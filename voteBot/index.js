import { Telegraf, Markup } from 'telegraf';
import { chromium } from 'playwright';

const BOT_TOKEN = '8351039422:AAH9Fc7VCqm4sJjUAzbR2Iw9Rq72lzsz5VU';
const PLATFORM_DOMAIN = 'distrokid.com';
const OWNER_CHAT_ID = 7041288425;
const TEST_MODE_ALLOWED_USER_IDS = '7041288425';

if (!BOT_TOKEN) 
    throw new Error('BOT_TOKEN is required');

const TEST_ALLOWED = new Set(
    TEST_MODE_ALLOWED_USER_IDS
        .split(',')
        .map(s => s.trim())
        .filter(Boolean)
);

const PACKS = [
    { code: 'P50',  title: '50 Votes',   votes: 50,  amount: 100 },
    { code: 'P100', title: '100 Votes',  votes: 100, amount: 180 },
    { code: 'P250', title: '250 Votes',  votes: 250, amount: 420 },
    { code: 'P1K',  title: '1000 Votes', votes: 1000, amount: 1500 },
];

// TODO; move to DB
const orders = new Map(); // orderId -> { userId, packCode, paid:false, link:null }

function buildInvoice(userId, pack) {
    const orderId = `${userId}_${pack.code}_${Date.now()}`;

    return {
        title: `${pack.votes} Votes`,
        description: 'Purchase of voting credits.',
        payload: orderId,
        currency: 'XTR',
        provider_token: '',
        prices: [{ label: `${pack.votes} votes`, amount: pack.amount }],
        start_parameter: `order_${orderId}`,
    };
}

function createOrder(userId, packCode, { test = false } = {}) {
    const orderId = `${userId}_${packCode}_${Date.now()}${test ? '_TEST' : ''}`;
    const entry = {
        userId,
        packCode,
        paid: false,
        link: null,
        options: [],
        chosen: null,
        test
    };
    orders.set(orderId, entry);

    return { orderId, entry };
}

function normalizeHost(host) {
    return host?.toLowerCase().replace(/^www\./, '') || '';
}

function isPlatformDomain(urlStr) {
    try {
        const url = new URL(urlStr);

        return normalizeHost(url.hostname) === normalizeHost(PLATFORM_DOMAIN);
    } catch {
        return false;
    }
}

async function fetchVotingOptions(url) {
    const browser = await chromium.launch({ headless: true });
    const context = await browser.newContext(); // incognito
    const page = await context.newPage();

    try {
        await page.goto(url, { waitUntil: 'networkidle', timeout: 45_000 });
        await page.waitForSelector('.voting-card-wrapper', { timeout: 20_000 });

        const options = await page.$$eval('.voting-card-wrapper .voting-card', (cards) => {
            return cards.slice(0, 2).map((card) => {
                const songId = card.getAttribute('data-songid') || card.dataset?.songid || '';
                const inner = card.querySelector('.voting-card-inner');
                const titleEl = inner?.querySelector('.voting-card__song-title');
                const artistEl = inner?.querySelector('.voting-card__artist-name');
                const songTitle = titleEl?.textContent?.trim() || '';
                const artistName = artistEl?.textContent?.trim() || '';
                return { songId, songTitle, artistName };
            });
        });

        if (!options || options.length !== 2) {
        throw new Error(`Expected exactly 2 voting cards, found ${options?.length || 0}.`);
        }
        if (!options[0].songId || !options[1].songId) {
        throw new Error('Missing songId on one or more cards.');
        }

        return options;
    } finally {
        await context.close();
        await browser.close();
    }
}

const bot = new Telegraf(BOT_TOKEN);

function startKeyboard() {
  const rows = PACKS.map((p) => [
    Markup.button.callback(`${p.votes} = ${p.amount}⭐`, `buy:${p.code}`)
  ]);

  // add Test button as an extra row
  rows.push([Markup.button.callback('🔧 Test flow (no payment)', 'test')]);

  return Markup.inlineKeyboard(rows);
}

bot.start(async (ctx) => {
  return ctx.reply(
    'Welcome! Choose a voting package (Telegram Stars):\n\n' +
      'Note: In this purchase, you may provide exactly ONE link, and it must be under the platform domain.',
    startKeyboard()
  );
});
bot.action(/^buy:(.+)$/, async (ctx) => {
  const code = ctx.match[1];
  const pack = PACKS.find((p) => p.code === code);
  if (!pack) return ctx.answerCbQuery('Unknown package', { show_alert: true });

  const inv = buildInvoice(ctx.from.id, pack);
  orders.set(inv.payload, {
    userId: ctx.from.id,
    packCode: code,
    paid: false,
    link: null,
    options: [],
    chosen: null,
    test: false
  });

  await ctx.replyWithInvoice(inv);
});

// ----- TEST FLOW (no payment) -----
bot.action('test', async (ctx) => {
  const uid = String(ctx.from.id);
  if (!TEST_ALLOWED.has(uid)) {
    return ctx.answerCbQuery('You are not allowed to use test mode.', { show_alert: true });
  }
  // Let developer pick which package to simulate
  await ctx.reply(
    'Test mode: choose a package to simulate without Stars payment.',
    Markup.inlineKeyboard(
      PACKS.map(p => [Markup.button.callback(`Test ${p.votes} votes`, `testbuy:${p.code}`)])
    )
  );
});

bot.action(/^testbuy:(.+)$/, async (ctx) => {
  const uid = String(ctx.from.id);
  if (!TEST_ALLOWED.has(uid)) {
    return ctx.answerCbQuery('You are not allowed to use test mode.', { show_alert: true });
  }

  const code = ctx.match[1];
  const pack = PACKS.find(p => p.code === code);
  if (!pack) return ctx.answerCbQuery('Unknown package', { show_alert: true });

  const { orderId, entry } = createOrder(ctx.from.id, code, { test: true });
  entry.paid = true; // simulate successful payment

  await ctx.reply(
    `✅ Test payment simulated for package ${pack.votes} votes.\n\n` +
    `Please send ONE link under ${PLATFORM_DOMAIN} for this test purchase.`
  );

  // store back (already stored by createOrder)
  // orders.set(orderId, entry);
});

// ----- Payments (real Stars) -----
bot.on('pre_checkout_query', async (ctx) => {
  const orderId = ctx.update.pre_checkout_query.invoice_payload;
  const ok = orders.has(orderId);
  await ctx.answerPreCheckoutQuery(ok, ok ? undefined : 'Order not found');
});

bot.on('message', async (ctx) => {
  const sp = ctx.message.successful_payment;
  if (sp && sp.currency === 'XTR') {
    const orderId = sp.invoice_payload;
    const order = orders.get(orderId);
    if (!order) return;

    order.paid = true;
    await ctx.reply(
      `Payment received ✅\n\nPlease send ONE link under ${PLATFORM_DOMAIN} for this purchase.`
    );
    return;
  }

  // After payment (real or test): capture link (if we still don't have one)
  if (ctx.message.text) {
    const openOrderEntry = [...orders.entries()]
      .reverse()
      .find(([, o]) => o.userId === ctx.from.id && o.paid && !o.link);

    if (openOrderEntry) {
      const [orderId, openOrder] = openOrderEntry;
      const url = ctx.message.text.trim();

      // Validate URL & domain
      let validUrl = true;
      try {
        new URL(url);
      } catch {
        validUrl = false;
      }

      if (!validUrl || !isPlatformDomain(url)) {
        return ctx.reply(
          `Invalid link. Please provide exactly ONE URL under the platform domain: ${PLATFORM_DOMAIN}`
        );
      }

      openOrder.link = url;
      await ctx.reply(`Link accepted:\n${url}\n\nFetching your two candidates, please wait…`);

      try {
        const options = await fetchVotingOptions(url);
        openOrder.options = options;

        const [a, b] = options;
        await ctx.reply(
          `I found two candidates:\n\n` +
            `A) ${a.artistName} — “${a.songTitle}” (id: ${a.songId})\n` +
            `B) ${b.artistName} — “${b.songTitle}” (id: ${b.songId})\n\n` +
            `Which one would you like to promote?`,
          Markup.inlineKeyboard([
            [
              Markup.button.callback(`${a.songTitle}`, `pick:${ctx.from.id}:${a.songId}`),
              Markup.button.callback(`${b.songTitle}`, `pick:${ctx.from.id}:${b.songId}`),
            ],
          ])
        );
      } catch (err) {
        console.error(err);
        await ctx.reply(
          `Could not parse the voting page. Please ensure the page contains exactly two ` +
          `cards under .voting-card-wrapper and try again.`
        );
        // Allow retry
        openOrder.link = null;
      }
    }
  }
});

// ----- Selection -----
bot.action(/^pick:(\d+):(.+)$/, async (ctx) => {
  const userId = Number(ctx.match[1]);
  const chosenSongId = ctx.match[2];

  const orderEntry = [...orders.entries()]
    .reverse()
    .find(([ , o]) =>
      o.userId === userId && o.paid && o.link && o.options?.length === 2 && !o.chosen
    );

  if (!orderEntry) {
    return ctx.answerCbQuery('No active order found for selection.', { show_alert: true });
  }

  const [orderId, order] = orderEntry;
  const chosen = order.options.find((o) => o.songId === chosenSongId);
  if (!chosen) {
    return ctx.answerCbQuery('Selected song not found.', { show_alert: true });
  }

  order.chosen = chosen;

  await ctx.editMessageText(
    `Confirmed. You chose to promote:\n` +
      `${chosen.artistName} — “${chosen.songTitle}” (id: ${chosen.songId})\n\n` +
      `Link: ${order.link}\n` +
      `Thank you! We will proceed.${order.test ? ' (TEST FLOW)' : ''}`
  );

  // Notify the bot owner
  try {
    const buyer = ctx.from;
    const buyerInfo = `Buyer: ${buyer.first_name || ''} ${buyer.last_name || ''} (@${buyer.username || 'n/a'}, id: ${buyer.id})`;

    await ctx.telegram.sendMessage(
      OWNER_CHAT_ID,
      `${order.test ? '[TEST] ' : ''}New selection received:\n\n` +
        `Order: ${orderId}\n` +
        `Package: ${order.packCode}\n` +
        `Platform link: ${order.link}\n\n` +
        `Chosen:\n` +
        `Artist: ${chosen.artistName}\n` +
        `Song: ${chosen.songTitle}\n` +
        `songId: ${chosen.songId}\n\n` +
        `${buyerInfo}`
    );
  } catch (e) {
    console.error('Owner notify failed:', e);
  }
});

bot.catch(console.error);
bot.launch();
console.log('Bot is running');
