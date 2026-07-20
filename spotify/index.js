const fs = require('fs');
const path = require('path');
const { chromium, firefox, webkit } = require('playwright');

const TARGET_SITES = [
  {
    url: 'https://open.spotify.com/track/75IDlFRrBj4V8KiziqNkmz?si=f7cb693c6d4c41f4&nd=1&dlsi=ba69fd8448e44a68',
    // ננסה כמה סלקטורים לפי סדר
    selectors: [
      'button[data-testid="play-button"]',
      'button[data-encore-id="buttonPrimary"]',
      '[data-testid="action-bar-row"] button',
      '[data-testid="action-bar-row"] .e-91000-button-primary',
    ]
  }
];

const ROTATE_FILE = path.join(__dirname, '.browser-rotate.json');
const BROWSERS = ['chromium', 'firefox', 'webkit'];

function pickRandomSite() {
  const idx = Math.floor(Math.random() * TARGET_SITES.length);
  return TARGET_SITES[idx];
}

function loadNextBrowserIndex() {
  try {
    const obj = JSON.parse(fs.readFileSync(ROTATE_FILE, 'utf8'));
    return typeof obj.index === 'number' ? obj.index : 0;
  } catch {
    return 0;
  }
}

function saveNextBrowserIndex(idx) {
  try {
    fs.writeFileSync(ROTATE_FILE, JSON.stringify({ index: idx }), 'utf8');
  } catch (e) {
    console.warn('Could not persist rotation index:', e.message);
  }
}

async function clickFirstAvailable(page, selectors) {
  for (const sel of selectors) {
    try {
      await page.waitForSelector(sel, { state: 'visible', timeout: 4000 });
      await page.click(sel, { timeout: 4000 });
      console.log(`[Runner] Clicked selector: ${sel}`);
      return true;
    } catch (e) {
      // ננסה את הבא
    }
  }
  return false;
}

async function performClickOnceAndStay() {
  let idx = loadNextBrowserIndex();
  const browserName = BROWSERS[idx % BROWSERS.length];
  const nextIdx = (idx + 1) % BROWSERS.length;
  saveNextBrowserIndex(nextIdx);

  const launcher = { chromium, firefox, webkit }[browserName];
  console.log(`[Runner] Launching ${browserName} (headless, will stay open)`);

  const browser = await launcher.launch({ headless: true });
  const context = await browser.newContext();
  const page = await context.newPage();

  try {
    const site = pickRandomSite();
    console.log(`Navigating to ${site.url}`);

    // טעינה
    await page.goto(site.url, { waitUntil: 'domcontentloaded', timeout: 45000 });

    // נמתין עוד קצת שה-React יישן
    await page.waitForTimeout(3000);

    const clicked = await clickFirstAvailable(page, site.selectors);

    if (!clicked) {
      console.warn('[Runner] No known selector became visible. Keeping browser alive for inspection.');
    }

    // להישאר חי לנצח
    await new Promise(() => {});
  } catch (err) {
    console.error('[Runner] Error during run:', err);
    // גם בשגיאה – לא סוגרים
    await new Promise(() => {});
  }
}

async function main() {
  await performClickOnceAndStay();
}

main().catch(e => {
  console.error('Fatal error:', e);
  process.exit(1);
});
