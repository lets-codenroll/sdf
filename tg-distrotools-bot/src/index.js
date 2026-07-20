// src/index.js
// Node.js 20 + Telegraf. English UX.
// Flow: /start → invite user to the DISCUSSION GROUP → verify membership in that group → ask for voting URL → acknowledge.

import 'dotenv/config';
import { Telegraf, Markup } from 'telegraf';

// ─────────────────────────── ENV ───────────────────────────
const {
  BOT_TOKEN,
  VERIFY_CHAT_ID,     // REQUIRED: discussion group (e.g., @DistroToolsChat or -100xxxxxxxxxx)
  CHANNEL_ID = '',    // OPTIONAL: your main channel (e.g., @DistroTools) – shown as extra button
  ALLOWED_DOMAINS = ''// OPTIONAL: comma-separated allowlist for URLs
} = process.env;

if (!BOT_TOKEN || !VERIFY_CHAT_ID) {
  console.error('Missing required env: BOT_TOKEN and VERIFY_CHAT_ID must be set.');
  process.exit(1);
}

const bot = new Telegraf(BOT_TOKEN);

// ───────────────────── In-memory user state ─────────────────────
const userState = new Map(); // key: userId -> 'need_join' | 'awaiting_url' | 'done'
const setState = (uid, state) => userState.set(uid, state);
const getState = (uid) => userState.get(uid) || null;

// ────────────────────── Helpers: chat resolving ──────────────────────
let RESOLVED_VERIFY_ID = null;   // numeric id for the discussion group
let RESOLVED_CHANNEL_ID = null;  // numeric id for the channel (optional)
let BOT_ID = null;

const okStatuses = new Set(['member', 'administrator', 'creator']);

function normalizeChatInput(raw) {
  let s = String(raw || '').trim();
  // Trim quotes/zero-width chars if pasted
  s = s.replace(/^[\'\"\u200B\u200C\u200D\uFEFF]+|[\'\"\u200B\u200C\u200D\uFEFF]+$/g, '');
  // If t.me URL → reduce to handle
  s = s.replace(/^https?:\/\/t\.me\//i, '');

  // Invite / joinchat links cannot be resolved via getChat
  if (/^\+|^joinchat\//i.test(s)) {
    throw new Error('Invite links cannot be resolved via getChat. Supply numeric id (-100...) instead.');
  }
  // Numeric? good
  if (/^-?\d+$/.test(s)) return s;
  // Ensure '@' for public handles
  if (!s.startsWith('@')) s = '@' + s;
  return s;
}

async function resolveToNumericId(input, label) {
  if (!input) return null;
  const norm = normalizeChatInput(input);
  console.log(`[INIT] ${label} (normalized):`, norm);

  if (/^-?\d+$/.test(norm)) {
    const id = Number(norm);
    console.log(`[INIT] ${label}: using numeric id`, id);
    return id;
  }

  // Resolve @handle → numeric
  const chat = await bot.telegram.getChat(norm);
  console.log(`[INIT] ${label}: resolved handle to id`, chat.id, `(title: ${chat.title || 'n/a'})`);
  return chat.id;
}

function chatLinkForUI(input) {
  try {
    const norm = normalizeChatInput(input);
    if (/^-?\d+$/.test(norm)) {
      // numeric id → cannot form public link; rely on invite link you share elsewhere
      return 'Open the invite link you received';
    }
    return `https://t.me/${norm.replace(/^@/, '')}`;
  } catch {
    return 'Open the invite link you received';
  }
}

// ────────────────────── URL validation ──────────────────────
function isValidUrl(text) {
  try {
    const u = new URL(text);
    if (!/^https?:$/.test(u.protocol)) return false;

    const allowlist = ALLOWED_DOMAINS
      .split(',')
      .map(s => s.trim().toLowerCase())
      .filter(Boolean);

    if (allowlist.length > 0) {
      const host = u.hostname.toLowerCase();
      const allowed = allowlist.some(domain => host === domain || host.endsWith('.' + domain));
      if (!allowed) return false;
    }
    return true;
  } catch {
    return false;
  }
}

// ────────────────────── Admin sanity checks ──────────────────────
async function ensureAdminChecks() {
  try {
    const me = await bot.telegram.getMe();
    BOT_ID = me.id;

    // Verify group (required)
    try {
      const m = await bot.telegram.getChatMember(RESOLVED_VERIFY_ID, BOT_ID);
      const admin = m?.status === 'administrator' || m?.status === 'creator';
      console[admin ? 'log' : 'warn'](
        admin
          ? '[OK] Bot is admin in VERIFY group.'
          : '[WARN] Bot is NOT admin in VERIFY group (recommended).'
      );
    } catch (e) {
      console.warn('[WARN] VERIFY_CHAT_ID admin check failed:', e?.response?.description || e.message);
    }

    // Optional: check channel admin (if provided)
    if (RESOLVED_CHANNEL_ID) {
      try {
        const m = await bot.telegram.getChatMember(RESOLVED_CHANNEL_ID, BOT_ID);
        const admin = m?.status === 'administrator' || m?.status === 'creator';
        console[admin ? 'log' : 'warn'](
          admin
            ? '[OK] Bot is admin in CHANNEL.'
            : '[WARN] Bot is NOT admin in CHANNEL (ok if not used for verification).'
        );
      } catch (e) {
        console.warn('[WARN] CHANNEL_ID admin check failed:', e?.response?.description || e.message);
      }
    }
  } catch (err) {
    console.warn('[WARN] Unable to confirm bot identity/admin status:', err?.response?.description || err.message);
  }
}

// ────────────────────── Handlers ──────────────────────
bot.start(async (ctx) => {
  const uid = ctx.from?.id;
  if (uid) setState(uid, 'need_join');

  const buttons = [];
  // Primary target: discussion group (verification)
  buttons.push([Markup.button.url('Join the discussion group', chatLinkForUI(VERIFY_CHAT_ID))]);

  // Optional: also show channel link if provided
  if (CHANNEL_ID) {
    buttons.push([Markup.button.url('Join our channel', chatLinkForUI(CHANNEL_ID))]);
  }

  // Confirm button
  buttons.push([Markup.button.callback('I joined', 'joined')]);

  await ctx.reply(
    [
      'Welcome!',
      'Please join our discussion group now, then come back and tap "I joined".',
      '',
      '1) Tap the button to open the group.',
      '2) Join the group.',
      '3) Return here and tap "I joined".'
    ].join('\n'),
    Markup.inlineKeyboard(buttons)
  );
});

bot.action('joined', async (ctx) => {
  const uid = ctx.from?.id;
  try {
    const member = await ctx.telegram.getChatMember(RESOLVED_VERIFY_ID, uid);
    if (okStatuses.has(member.status)) {
      if (uid) setState(uid, 'awaiting_url');
      await ctx.editMessageText(
        'Great! You are a member of the discussion group.\n\nPlease send me the voting page link (full URL starting with http/https).'
      );
    } else {
      await ctx.answerCbQuery(
        'You are not a member yet. Please join the discussion group and try again.',
        { show_alert: true }
      );
    }
  } catch (err) {
    const desc = err?.response?.description || err?.message || String(err);
    console.error('[ERROR] getChatMember (verify group) failed:', desc, {
      verifyGroup: RESOLVED_VERIFY_ID,
      user: uid
    });
    await ctx.answerCbQuery(
      'Could not verify membership. Check that the bot is admin in the discussion group and the ID/handle is correct.',
      { show_alert: true }
    );
  }
});

bot.on('text', async (ctx) => {
  const uid = ctx.from?.id;
  const text = (ctx.message?.text || '').trim();

  const state = uid ? getState(uid) : null;
  if (state !== 'awaiting_url') {
    return ctx.reply('Please join the discussion group first and tap "I joined". Use /start to begin.');
  }

  if (!isValidUrl(text)) {
    const tips = ALLOWED_DOMAINS
      ? ` Allowed domains: ${ALLOWED_DOMAINS.split(',').map(s => s.trim()).filter(Boolean).join(', ')}.`
      : '';
    return ctx.reply('Please send a valid URL starting with http or https.' + tips);
  }

  if (uid) setState(uid, 'done');
  return ctx.reply(['✅ Thanks! Your link has been received.', 'We wish you the best of luck! 🚀'].join('\n'));
});

// Global error visibility
bot.catch((err, ctx) => {
  console.error('Unhandled error while processing update', ctx?.update, err);
});

// Graceful shutdown
process.once('SIGINT', () => { bot.stop('SIGINT'); process.exit(0); });
process.once('SIGTERM', () => { bot.stop('SIGTERM'); process.exit(0); });

// ────────────────────── Bootstrap ──────────────────────
(async () => {
  try {
    RESOLVED_VERIFY_ID = await resolveToNumericId(VERIFY_CHAT_ID, 'VERIFY_CHAT_ID');
    if (CHANNEL_ID) {
      RESOLVED_CHANNEL_ID = await resolveToNumericId(CHANNEL_ID, 'CHANNEL_ID');
    }
  } catch (e) {
    console.error('[FATAL] Could not resolve chat identifiers:', e.message);
    process.exit(1);
  }

  await ensureAdminChecks(); // recommend bot be admin in the discussion group
  await bot.launch();
  console.log('Bot is up. Listening for updates...');
})();
