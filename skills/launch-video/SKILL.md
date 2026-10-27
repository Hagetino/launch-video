---
name: launch-video
description: Make a short, premium brand intro or launch video (10-60 s) entirely in code, in the style of current AI product launch films (Claude, Raycast, Lovable, ElevenLabs, Linear). HTML/canvas scenes driven by a deterministic render(t), captured frame by frame with headless Chrome, cut to a generated music track. Use when the user asks for an intro video, launch video, title card, teaser, sizzle reel, animated logo reveal or motion graphics for a club, startup, product, event or pitch.
---

# Launch video

Build a 10-60 s brand film in code that feels like the launch videos people share on X and LinkedIn, not like a slideshow.

What's in this skill:

| Path | What |
|---|---|
| `STYLE.md` | Breakdown of 11 real launch films (2025-2026): cut rates, structure, type, colour, and 12 techniques ranked, each with how to build it in HTML/CSS/canvas |
| `template/intro.html` | Working 24 s, 120 BPM intro using the top techniques. All copy is in `COPY` and `SHOTS` at the top of the script |
| `template/render.mjs` | Frame-exact export: headless Chrome over the DevTools protocol, piped into ffmpeg. No npm installs |
| `template/add_audio.sh` | Mixes music + optional SFX onto the silent render |
| `scripts/gen_music.sh`, `scripts/gen_sfx.sh` | ElevenLabs music and sound-effect generation (needs `ELEVENLABS_API_KEY`) |
| `scripts/beats.py`, `scripts/energy.py` | Measure BPM, beat offset, and where the build/drop/silence really fall |
| `prompts/` | The music and SFX prompts that worked |

Requirements: Google Chrome (or set `CHROME=/path/to/chrome`), Node 22+ (for the built-in `WebSocket`), ffmpeg, python3. ElevenLabs is optional; any licensed track works.

## Workflow

### 1. Gather what the film is about
Get the real facts from the user or their materials: name, one-line tagline, what they do (3-7 short pillars), who it's for, and the brand (logo, fonts, colours). Never invent facts, partners or numbers. Ask for anything you'd otherwise make up.

### 2. References before design (the step that matters most)
Without references you fall back to generic defaults. Read `STYLE.md` first. If the user names videos they like, or the brief needs a different feel, download and look at those references too ([reel-to-action](https://github.com/Hagetino/reel-to-action) does this: contact sheets, cut rate, transcript). Then name the 2-3 references you're borrowing from and which technique you take from each before writing any code.

Defaults to avoid: cream background + serif + gold italic accent word on everything (it reads as boilerplate "made with Claude Code"), medium "PowerPoint-sized" type, slide-in-from-offscreen text, flashy logo explosions.

### 3. Music first, then cut the edit to it
1. Write a music prompt with an explicit BPM and a second-by-second section map that matches the planned scenes (see `prompts/music.txt`). 115-130 BPM, instrumental, a riser into a drop, a near-silent tail for the logo.
2. Generate it: `ELEVENLABS_API_KEY=... scripts/gen_music.sh template/audio/music.mp3 24`
3. Measure it: `python3 scripts/beats.py audio/music.mp3` (BPM + offset of the first beat) and `python3 scripts/energy.py audio/music.mp3` (where the drop and silence actually are). Generated music rarely matches the prompt exactly.
4. Put every scene change, word entrance and coda switch on a beat or half-beat from the measured grid (`beat = offset + n * 60/bpm`). Change the times in `render()` to match, not the other way round.

### 4. Build the scenes
Copy `template/` into the user's project and edit it. The contract `render.mjs` relies on:
- `window.render(t)` paints the frame at `t` seconds. Fully deterministic: no `Date`, no timers, no `Math.random` (use the seeded `rng`), no CSS transitions or animations.
- `window.DUR` is the length in seconds; `window.ready` resolves once fonts and assets are loaded.
- Opening the HTML normally previews it live in a browser; `?render=1` disables the preview loop.

Swap in the brand: fonts via `@font-face` and the `--display`/`--sans` variables, colours in `:root`, the logo by replacing `DOTS` (the mark is a set of squares, so a logo built from a grid fits directly; otherwise use an SVG path and a different reveal). Keep fonts and logos the user owns or that are openly licensed.

### 5. Grade stills before rendering
`node render.mjs stills 1.5,6.9,9.2,15.8,18.2,23` writes PNGs to `stills/`. Look at every scene and score it out of 10 against the references: composition, type scale (huge or tiny, never medium), contrast, does it look like a real launch film. Fix anything under 8 and re-grade. This pass caught an undersized mask and a UI that looked lost on screen in the original project.

### 6. Render and mix
```bash
node render.mjs video intro-silent.mp4   # ~1 min for 24 s at 1080p30
./add_audio.sh                           # -> intro.mp4
```
SFX: keep them sparse (typing under a prompt, one click per coda word, one impact on the logo). No shimmer or "swoosh" sounds on underlines and text effects; they read as cheap. Generate effects with `scripts/gen_sfx.sh` using `prompts/sfx.txt`.

Verify: `ffmpeg -i intro.mp4 -vf "select='gt(scene,0.3)',showinfo" -f null - 2>&1 | grep pts_time` lists the hard cuts. Check they land on beats.

### 7. Deliver
Give the file path, a timeline table (time, scene, technique, reference), the beat/cut check, and the lines the user should confirm (any claim, date or place in the copy). Offer 9:16 and 1:1 versions for Instagram and LinkedIn: change the viewport in the HTML and `render.mjs`, then re-lay out each scene rather than cropping.
