// Frame-exact export of intro.html via headless Chrome (DevTools protocol, no npm deps).
//   node render.mjs stills 0.5,1.2,3,5,9.5   -> stills/t<sec>.png
//   node render.mjs video intro-silent.mp4    -> 30 fps H.264 (needs Chrome + ffmpeg; set CHROME=/path if not macOS)
import { spawn } from 'node:child_process';
import { mkdtempSync, mkdirSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';

const HERE = dirname(fileURLToPath(import.meta.url));
const CHROME = process.env.CHROME || '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome';
const [mode = 'video', arg = 'intro-silent.mp4'] = process.argv.slice(2);
const FPS = 30;

const profile = mkdtempSync(join(tmpdir(), 'intro-'));
const chrome = spawn(CHROME, ['--headless=new', '--remote-debugging-port=0', `--user-data-dir=${profile}`,
  '--hide-scrollbars', '--force-color-profile=srgb', '--allow-file-access-from-files', 'about:blank'],
  { stdio: ['ignore', 'ignore', 'pipe'] });
const wsUrl = await new Promise((ok, fail) => {
  let buf = '';
  chrome.stderr.on('data', d => { buf += d; const m = buf.match(/ws:\/\/\S+/); if (m) ok(m[0]); });
  chrome.on('exit', () => fail(new Error('chrome exited: ' + buf)));
});
const port = new URL(wsUrl).port;
const page = (await (await fetch(`http://127.0.0.1:${port}/json/list`)).json()).find(t => t.type === 'page');
const ws = new WebSocket(page.webSocketDebuggerUrl);
await new Promise(r => ws.addEventListener('open', r, { once: true }));
let id = 0; const pending = new Map(), waiters = [];
ws.addEventListener('message', e => {
  const msg = JSON.parse(e.data);
  if (msg.id && pending.has(msg.id)) { const p = pending.get(msg.id); pending.delete(msg.id); msg.error ? p.fail(new Error(msg.error.message)) : p.ok(msg.result); }
  else if (msg.method) waiters.filter(w => w.m === msg.method).forEach(w => { waiters.splice(waiters.indexOf(w), 1); w.r(msg.params); });
});
const send = (method, params = {}) => new Promise((ok, fail) => { const i = ++id; pending.set(i, { ok, fail }); ws.send(JSON.stringify({ id: i, method, params })); });
const evaluate = async expr => (await send('Runtime.evaluate', { expression: expr, awaitPromise: true, returnByValue: true })).result.value;

await send('Page.enable');
await send('Emulation.setDeviceMetricsOverride', { width: 1920, height: 1080, deviceScaleFactor: 1, mobile: false });
const loaded = new Promise(r => waiters.push({ m: 'Page.loadEventFired', r }));
await send('Page.navigate', { url: 'file://' + join(HERE, 'intro.html') + '?render=1' });
await loaded;
await evaluate('window.ready');

const frame = async (t, format = 'jpeg') => {
  await evaluate(`render(${t})`);
  const { data } = await send('Page.captureScreenshot', { format, ...(format === 'jpeg' ? { quality: 95 } : {}) });
  return Buffer.from(data, 'base64');
};

if (mode === 'stills') {
  mkdirSync(join(HERE, 'stills'), { recursive: true });
  for (const t of arg.split(',').map(Number)) writeFileSync(join(HERE, 'stills', `t${t.toFixed(2).padStart(5, "0")}.png`), await frame(t, 'png'));
} else {
  const n = Math.round((await evaluate('DUR')) * FPS);
  const ff = spawn('ffmpeg', ['-y', '-loglevel', 'error', '-f', 'image2pipe', '-framerate', String(FPS), '-i', '-',
    '-c:v', 'libx264', '-pix_fmt', 'yuv420p', '-crf', '16', '-preset', 'slow', '-movflags', '+faststart', arg], { stdio: ['pipe', 'inherit', 'inherit'] });
  for (let i = 0; i < n; i++) {
    if (!ff.stdin.write(await frame(i / FPS))) await new Promise(r => ff.stdin.once('drain', r));
  }
  ff.stdin.end(); await new Promise(r => ff.on('close', r));
  console.log(`rendered ${n} frames -> ${arg}`);
}
ws.close(); chrome.kill();
await new Promise(r => setTimeout(r, 300));
rmSync(profile, { recursive: true, force: true });
