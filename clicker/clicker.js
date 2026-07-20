/**
 * Automated clicker script using Playwright.
 * 
 * This script navigates to a specified URL and clicks a designated button
 * It rotates through different browsers (Chromium, Firefox, WebKit) to mimic 
 * diverse user agents and avoid detection.
 * 
 * Usage:
 *   1. Ensure Node.js is installed.
 *   2. Install Playwright: npm install playwright
 *   3. Run the script: node clicker.js
 */
const fs = require('fs');
const path = require('path');
const { chromium, firefox, webkit } = require('playwright');

const TARGET_SITES = [
  {
    url: 'https://distrokid.com/spotlight/shalva1/vote/',
    selector: '.voting-card-84365090 .voteButton'
  },
  {
    url: 'https://distrokid.com/spotlight/shalva1/vote/',
    selector: '.voting-card-84365090 .voteButton'
  },
  {
    url: 'https://distrokid.com/spotlight/shalva1/vote/',
    selector: '.voting-card-84365090 .voteButton'
  },
  {
    url: 'https://distrokid.com/spotlight/amitmoreno/vote/',
    selector: '.voting-card-85492361 .voteButton'
  }
];

// Button selector to click:
// const BUTTON_SELECTOR = '.voting-card-83332602 .voteButton';

// const MAX_NAV_TIMEOUT = 30000; // ms
const ROTATE_FILE = path.join(__dirname, '.browser-rotate.json');
const BROWSERS = ['chromium', 'firefox', 'webkit'];

function pickRandomSite() {
  const idx = Math.floor(Math.random() * TARGET_SITES.length);
  return TARGET_SITES[idx];
}

function randomNavTimeoutMs() {
    const min = 150000;
    const max = 300000;
    
    // returns integer ms in [min, max)
    return Math.floor(Math.random() * (max - min)) + min;
}

function msUntilNextThreeMinuteMark() {
  const now = new Date();
  const next = new Date(now);
  // next minute divisible by 3, with second=0
  const m = now.getMinutes();
  const nextMultiple = (Math.floor(m / 3) + (now.getSeconds() || now.getMilliseconds() ? 1 : 0)) * 3;
  const targetMinute = nextMultiple % 60;
  if (nextMultiple >= 60 && targetMinute !== m) next.setHours(now.getHours() + 1);
  next.setMinutes(targetMinute);
  next.setSeconds(0);
  next.setMilliseconds(0);
  const diff = next - now;
  return diff > 0 ? diff : 0;
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

async function performClickOnce() {
    // pick and persist next browser index
    let idx = loadNextBrowserIndex();
    const browserName = BROWSERS[idx % BROWSERS.length];
    const nextIdx = (idx + 1) % BROWSERS.length;
    saveNextBrowserIndex(nextIdx);

    // map to playwright launcher
    const launcher = { chromium, firefox, webkit }[browserName];
    console.log(`[Runner] Launching ${browserName} (headless incognito)`);

    const browser = await launcher.launch({ headless: true });
    const context = await browser.newContext(); // isolated "incognito"-like
    const page = await context.newPage();

    try {
        const site = pickRandomSite();
        const timeoutMs = randomNavTimeoutMs();
        console.log(`Navigating to ${site.url} (timeout ${timeoutMs} ms)`);

        await page.goto(site.url, { timeout: timeoutMs, waitUntil: 'domcontentloaded' });
        await page.waitForTimeout(500 + Math.floor(Math.random() * 800)); // small, human-friendly settle
        await page.waitForSelector(site.selector, { state: 'visible', timeout: 10000 });
        await page.click(site.selector, { timeout: 5000 });
        await page.waitForTimeout(1000 + Math.floor(Math.random() * 2000));
        console.log(`[Runner] Clicked on ${site.selector} at ${new Date().toISOString()}`);
    } catch (err) {
        console.error(`[Runner] Error:`, err);
    } finally {
        await context.close();
        await browser.close();
    }
}

async function main() {
  console.log('Scheduler starting — aligning to the next 3-minute mark...');
  const initialDelay = msUntilNextThreeMinuteMark();
  if (initialDelay) {
    console.log(`Waiting ${Math.round(initialDelay / 1000)}s to align...`);
    await new Promise(r => setTimeout(r, initialDelay));
  }

  // first run
  await performClickOnce();

  // repeat every 3 minutes; guard against drift
  const intervalMs = 3 * 60 * 1000;
  setInterval(async () => {
    const m = new Date().getMinutes();
    if (m % 3 !== 0) {
      console.warn('Drift detected; re-aligning before next run.');
      const d = msUntilNextThreeMinuteMark();
      setTimeout(() => performClickOnce(), d);
      return;
    }
    await performClickOnce();
  }, intervalMs);
}

main().catch(e => {
  console.error('Fatal error:', e);
  process.exit(1);
});
