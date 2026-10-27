# Reference style breakdown: AI launch / brand intro films (2025-2026)

Analysed 2026-10-12 from the public YouTube copies of the official launch posts that ran on X and LinkedIn. To look at a reference yourself, run it through [reel-to-action](https://github.com/Hagetino/reel-to-action) (`fetch_reel.sh --max-frames 30 --keep-video -o refs/<name> <url>`) and read its `contact.jpg`. The "Look at" lines below name the sheets that were most useful in the original study; they are not shipped in this repo.

Cut counts come from ffmpeg scene detection at `scene>0.3` (hard cuts). I also counted at `>0.12`, which picks up soft cuts, morphs and dissolves. BPM comes from librosa `beat_track`. Treat the BPM figures as rough: they can be off by double or half.

| name | url | date | views | len | hard cuts (>0.3) | soft (>0.12) | avg shot | BPM est. |
|---|---|---|---|---|---|---|---|---|
| opus55 | https://www.youtube.com/watch?v=1f13Bl1sYkw (Claude, "Introducing Claude Opus 5.5") | 2026-09-22 | 339k | 20.0s | 33 | 38 | **0.58s** (accelerates to 0.28s) | 144 (cuts imply ~104/207) |
| claude-motion | https://www.youtube.com/watch?v=en0GuyhieQk (Claude Dashboards & Claude Motion) | 2026-10-08 | 1.06M | 81.6s | 1 | 9 | continuous | 172 (likely 86) |
| lovable2 | https://www.youtube.com/watch?v=xDwR1_vrIg8 (Lovable 2.0) | 2025-04-24 | 10.7M | 80.4s | 13 | 52 | 5.7s hard / ~1.5s soft | 112 |
| notion3 | https://www.youtube.com/watch?v=R1cF4T4lgI4 (Notion 3.0: Agents) | 2025-09-18 | 15.8M | 90.0s | 6 | 28 | ~3s soft | 123 |
| elevenv3 | https://www.youtube.com/watch?v=nuT-L5Dq1yM (Eleven v3 cinematic launch) | 2025-06-12 | 38k (X-first) | 75.3s | 1 | 12 | continuous | 123 |
| raycast2026 | https://www.youtube.com/watch?v=Mi173xGb0ZA ("New Raycast. Coming 2026") | 2025-12-18 | 114k | 38.6s | 5 | 9 | 6.4s | 129 |
| linear-agents | https://www.youtube.com/watch?v=sbwOQV5zY34 (Linear for Agents) | 2025-05-21 | 22k (X-first) | 32.7s | 0 | 0 | one continuous take | 144 |
| cursor2 | https://www.youtube.com/watch?v=An8IM-kPyms (Introducing Cursor 2.0) | 2025-10-29 | 9.5M | 64.4s | 1 | 7 | continuous | 112 |
| comet | https://www.youtube.com/watch?v=YeldJ4UezDQ (Perplexity Comet) | 2025-07-09 | 238k | 72.3s | 6 | 17 | ~4s soft | 65 (half-time) |
| remotion-launch | https://www.youtube.com/watch?v=iShab28B_ak (Claude Code + Remotion "product launch motion design") | 2026-07-20 | 3k | 36.2s | 1 | 2 | continuous | 129 |
| cursor3 | https://www.youtube.com/watch?v=UxbULt_hCdA (Introducing Cursor 3) | 2026-04-02 | 3.1M | 90.4s | 24 | 29 | 3.6s | 99 |

The headline finding is that **almost none of these films use hard cuts.** Apart from the Opus 5.5 montage and Cursor 3, which is a talking-head interview, each film is one continuous canvas. Elements morph, push, blur and re-frame, and the "edit" happens inside the frame. With a hard-cut threshold, the median is about 1 cut per 30s. With the soft threshold, it is about one change of state every 1.5-3s.

---

## 1. Claude Opus 5.5 launch film (opus55): the best reference for a 20s brand intro
- **Length / pace:** 20s. 33 hard cuts. Shots start around 0.5-0.6s and **accelerate** to 0.25-0.3s at 13-15.8s, building like a drum roll into the line. It ends on a held title and logo.
- **Structure:**
  - 0-3s: a cinematic horizon (planet-limb gradient, orange on black) on a slow push.
  - 3-11s: a match-cut montage. Every shot is **a curved arc/horizon in the same screen position** (lower third, convex up), each in a different material: sliced fruit, a leaf, an engraved print, a blueprint sketch, a micrograph, lace, a felt-paper collage, a cross-section of a mushroom gill, a dandelion.
  - 11-16s: words appear one at a time **sitting on the arc**: "There's" / "more to" / "discover". The text stays locked while the textures cut under it on the beat.
  - 16-20s: hold, then end card.
- **Typography:** one serif (Anthropic's display serif, Tiempos-like) in lower case, small (about 4-5% of frame height), centred, and slightly **curved/warped to follow the arc**. White on dark textures, black on light ones.
- **Colour:** no fixed palette. Each shot carries its own material colour (terracotta, teal, mustard, magenta, kraft paper). Brand warmth comes from the cream paper and orange recurring.
- **Transitions:** hard cuts only. The match-cut geometry (the same arc in the same place) makes them feel like one object changing material.
- **Signatures:** a shape match-cut montage, a mix of tactile/analog textures (scan, macro photo, collage, engraving), **text riding a constant anchor while the world swaps underneath**, and a cut rate that accelerates. Grain and halation come from the photographic sources.
- **Sound:** music only with a pulsing build, no VO. The final word lands on the musical resolve.
- **Look at:** `refs/opus55/contact.jpg`, which is the single most useful sheet, and `frames/f_29_0015.6s.jpg`.

## 2. Claude Dashboards & Claude Motion (claude-motion)
- **Length / pace:** 82s. Essentially one continuous move. Content moves in and out through push-ins and UI "zoom-throughs".
- **Structure:**
  - Opens on an isometric 3D map with time stamps ("6:10 am") and labelled pins.
  - The frame **pulls back to reveal it was a video inside a player chrome**.
  - Webcam presenter inside the player, with comment bubbles stacking beside him.
  - Dashboard UI builds, then morphs into an animated map.
  - Text-on-a-path: "Tracing every morning ride from the hilltop to downtown" curls along a bike route.
  - 3D isometric scene with the time-lapse clock ticking.
  - An "Export" button, with app logos orbiting in.
  - The tagline is typed and **selected with a text-selection highlight and edit toolbar**: "Claude makes it. You steer it."
  - Logo.
- **Typography:** the Anthropic serif for headlines, a clean sans for UI, and monospaced time stamps.
- **Colour:** warm off-white (#F2F0EB-ish) background, coral/terracotta accent, teal data marks.
- **Signatures:** a **recursive zoom (screen inside a screen)**, a cursor that acts out the story, text along an SVG path, an isometric map with labelled pins and a ticking clock, and logos popping in on springs. The end tagline appears as a UI text selection (blue highlight box plus toolbar). This is a strong idea for a "made with code" brand.
- **Sound:** VO plus a soft, fast pulse.
- **Look at:** `refs/claude-motion/timeline.jpg`.

## 3. Lovable 2.0 (lovable2): the "hype" energy reference
- **Length / pace:** 80s. 52 soft changes, so a new state about every 1.5s. Big kinetic word beats alternate with 3-5s UI demo beats.
- **Structure:**
  - 0-3s: a field of glossy pink/orange spheres (a gradient "bokeh" balls look), with the camera pushing in.
  - One sphere carries the word "Today".
  - The spheres shrink into a grid of dots, which collapses into an emoji-sized icon inline with text: "Less than 1% [icon] of the world…".
  - "knows how to c|" is typed with a **gradient cursor bar**, and "change" blurs in from the right.
  - A heart icon morphs into the logo, and the wordmark wipes in on a cobalt-to-magenta field.
  - Single-word cards: "ideas", "than ever before", "creating", "new apps", each on its own mesh-gradient.
  - The prompt box sits in a **glowing gradient pill** (an orange/magenta aura around a black capsule).
  - UI screens tilt in perspective with a coloured glow behind them.
  - Close-ups of buttons ("Invite", "Publish") with a big hand cursor.
  - "Introducing" on black, then "Now", then "What are you building?", then the logo and URL.
- **Typography:** a heavy grotesk (Camera Plain-like), white on gradient or black on cream. Single words are set very large, with headline type up to 25% of frame height.
- **Colour:** the brand gradient is pink, magenta, orange and cobalt blue, over cream (#F6F3EE) and black. The gradients are **soft, grainy mesh gradients**, never flat.
- **Transitions:** blur-dissolves (text arrives from about 20px blur plus opacity), a gradient wipe with a soft edge, a shape morph from heart to logo, and match-zooms into a UI element.
- **Signatures:** mesh-gradient orbs, **glow halos behind UI** (a blurred copy of the brand gradient), typewriter text with a gradient caret, single-word staccato cards on the beat, and 3D-tilted UI panels.
- **Sound:** an upbeat pop/house track at about 112 bpm. Each word card lands on a beat, and there's a short riser before "Introducing".
- **Look at:** `refs/lovable2/timeline.jpg` and `refs/lovable2/burst0.jpg` (the opening orb into dot grid into inline icon).

## 4. ElevenLabs v3 cinematic (elevenv3)
- **Length / pace:** 75s on one continuous dark canvas. Text and objects fly through z-depth.
- **Structure:**
  - "What if you could…": words fade up, one at a time, from blur.
  - "Every / Exactly" lines slide past each other.
  - Red/cyan gradient light swells into a giant chrome-gradient "V3".
  - UI cards (voice sliders, waveform player) float in depth with parallax.
  - "And full control over delivery" with a **gradient-filled keyword**.
  - "70 languages": dozens of scripts (Devanagari, Greek, Punjabi, Catalan) drift at different depths, sizes and **depth-of-field blur**, and a huge foreground word ("language") flies past the camera.
  - Iridescent conic-gradient spheres represent voices and roll through emotion words.
  - A radar/hexagon chart of emotions.
  - A waveform turns into vertical bars.
  - Flash to white: a glossy sphere, a "whisper" tag, and the wordmark.
- **Typography:** a geometric sans in semibold for statements, an italic serif for the floating language names, and keywords filled with a gradient.
- **Colour:** deep black and violet (#0B0614 to #3A1170) with magenta/cyan accents. The finale inverts to white.
- **Signatures:** a **z-space typography field with DOF blur**, foreground type crossing the camera, gradient-clipped keywords, iridescent conic orbs, a waveform motif, and a **dark-to-white inversion for the finale**.
- **Sound:** VO demos the product itself (expressive voices) over a cinematic pulse with whooshes on the fly-bys.
- **Look at:** `refs/elevenv3/timeline.jpg` and `burst29.jpg`.

## 5. Raycast "New Raycast. Coming 2026" (raycast2026): the "premium teaser" reference
- **Length / pace:** 38.6s. 5 hard cuts. Slow, confident pacing: a feature vignette every 3-4s, then a staccato typographic coda.
- **Structure:**
  - 0-6s: an abstract black/graphite **liquid-satin 3D background** (a dark wallpaper with a single specular edge highlight) on a very slow camera drift.
  - A frosted-glass search bar slides up very large ("Search…"), then pulls back to normal scale.
  - Typing "clipbo|", then clipboard history.
  - Emoji picker: tiles scroll sideways, and the selected tile gets a **coloured glow border**.
  - A voice pill with live waveform bars.
  - AI chat: "Getting active Linear issues…", with tool-call rows resolving.
  - "Checking for updates…" spinner pill.
  - Cut to pure black: tiny monospaced caps in two separated words: "NEW   LAUNCHER DESIGN", "NEW   HOTKEY RECORDER", "NEW   VOICE FEATURES", "NEW   CLOUD SYNC ENGINE", "NEW   RAYCAST", "NEW RAYCAST / COMING 2026".
  - A tiny logo.
- **Typography:** Inter-like for the UI, and **tiny uppercase monospace (around 1.2% of frame height) with wide spacing** for the coda. The confidence comes from type being smaller than you'd expect.
- **Colour:** monochrome graphite and black, with colour only from emoji and app icons.
- **Signatures:** glassmorphism (backdrop blur, a 1px inner highlight, soft drop shadow), extreme UI close-ups that **pull back** to reveal the panel, a **"tiny mono caps on black" end sequence that changes on every beat**, and a single specular line on the background.
- **Sound:** a minimal electronic track at about 129 bpm with UI clicks. The coda words switch on the beat, and the last hit drops to silence before the logo.
- **Look at:** `refs/raycast2026/timeline.jpg`. Its last two rows are the end sequence to copy for a short brand intro.

## 6. Linear for Agents (linear-agents)
- **Length / pace:** 32.7s. **Zero cuts.** One continuous UI performance. Every change is a dissolve, blur or focus pull inside a dark canvas.
- **Structure:**
  - "Linear for Agents" title.
  - The backlog list fades in row by row (staggered about 40ms per row).
  - Multi-select: rows highlight in indigo.
  - The "Assign to…" menu shows agents.
  - Everything **dims and blurs except the focused panel** (a focus pull).
  - The activity feed types in.
  - Agent cards with "Enable" buttons; one flips to "Enabled".
  - Issue view: "@devin" mention autocomplete, and a code suggestion streams in.
  - Title cards "Agents for Coding" and "Agents for Triage".
  - "Linear for" plus "Agents" types on.
  - Linear logo.
- **Typography:** Inter Display in medium weight, white on #0F0F11, with small, precise UI.
- **Colour:** near-black, with indigo (#5E6AD2) as the only accent.
- **Signatures:** **depth via blur and dim instead of 3D** (out-of-focus layers behind the focused one), a "pixel-blur/redaction" transition (a block shimmer while content loads), staggered list reveals, and a slow cursor.
- **Sound:** soft electronic. A gentle bed shifts to an upbeat one at the title.
- **Look at:** `refs/linear-agents/contact.jpg`.

## 7. Notion 3.0: Agents (notion3)
- **Length / pace:** 90s. About 28 soft changes. A friendly, illustrated, "playful product" grammar.
- **Structure:**
  - Hand-drawn character faces line up: "You assign the tasks. Your Agents do the work."
  - Agent personalisation: a carousel of hats and props with a focus box.
  - A huge typed prompt ("Create a b|") **zoomed to full screen**, then pulling back into the input box.
  - "Crafting •••" with animated colour dots.
  - The UI builds itself: a Bug Tracker table fills row by row and status pills change.
  - A transcript widget.
  - A grid of hundreds of agent cards in a parallax wall.
  - The team of characters returns: "Your team of Agents are ready to work".
  - "Get started at notion.com", then logo.
- **Typography:** Notion's Inter-like sans in bold, black on white. The prompt text is enormous.
- **Colour:** white, black and **one saturated blue (#2383E2) used as a full-frame wipe colour**.
- **Signatures:** a solid-colour panel wipe (blue slab slides across, content rides on it), giant-type-to-UI scale transitions, line-art mascots with tiny squash and stretch, and the wall of cards.
- **Look at:** `refs/notion3/timeline.jpg`.

## 8. Perplexity Comet (comet)
- **Length / pace:** 72s. A soft, editorial, almost literary tone.
- **Structure:**
  - The logo assembles from line strokes on paper white.
  - Particle dots converge: "Connecting the dots between…"
  - A **vertical word drum/roller**: "Tabs / Emails / Calendars / Socials / Life" rotates on a 3D cylinder, next to a rotating 3D orb that changes material (teal glass, red, iridescent).
  - "Ask more", "Understand more" (the keyword blurs in).
  - Browser demos with the assistant panel.
  - A **dotted particle ring** breathes.
  - Fade to black, then a planet/bokeh field: "Browse at the speed of thought."
  - Starfield, then the moon/orb, then the logo.
- **Typography:** a thin, condensed serif (FK Grotesk/Editorial style) in grey on off-white, with words blur-dissolving.
- **Colour:** off-white (#F7F6F2) to deep space black with stars. Accent colour comes only from the orb.
- **Signatures:** a **3D word roller (slot-machine) list**, particle convergence into text and shape, an orb as a stand-in for the AI, and a final light-to-dark flip into space.
- **Look at:** `refs/comet/timeline.jpg`.

## 9. Cursor 2.0 (cursor2)
- **Length / pace:** 64s. One continuous screen performance at 60fps.
- **Structure:**
  - 3D cube logo plus "2.0" on cream.
  - "Introducing Composer, our first agent model."
  - **Animated bar chart** benchmark.
  - "And a new Cursor built for agents."
  - The app window over a painted landscape wallpaper.
  - Parallel agents.
  - A diff review with zoom-ins.
  - "Work with a built-in browser."
  - Logo.
- **Typography:** a neutral grotesk in medium weight, centred, black on #F7F7F4.
- **Colour:** off-white and black, with an impressionist painting as the desktop wallpaper behind the UI. That gives warmth without branding.
- **Signatures:** **smooth virtual-camera zooms into regions of a real UI** (scale plus translate with ease-in-out, framed to the exact element), plain sentence cards, and benchmark bars that grow.
- **Look at:** `refs/cursor2/contact.jpg`.

## 10. Claude Code + Remotion "product launch motion design" (remotion-launch): code-built, so feasible for us
- **Length / pace:** 36s. No hard cuts. Elements move inside a constant cream world.
- **Structure:**
  - "AI" types in serif, then "AI Foundatio|" with a **blur-in per character**.
  - A cursor-like plus mark.
  - A **3D-tilted card** gets a soft spotlight (vignette light), and a highlighted phrase in a gold italic serif ("*one* project") is underlined by a growing rule.
  - A card stack in 3D falls onto a dark table.
  - The grid of UI cards zooms through, intercut with statement lines, each with a gold italic keyword and a short underline that draws in.
  - Floating paper cards scatter in depth.
  - Wordmark lockup "AI Foundation Lab" plus mono subtitle "TEAM RESEARCH CONSOLE".
- **Typography:** a serif display (Tiempos/Newsreader-like) with the **accent word in italic and an ochre colour (#A87A1E)**, plus monospaced small caps for labels.
- **Colour:** cream #F4F1EA, near-black text and one ochre accent.
- **Note:** this is a nicely crafted but **default-looking "AI-generated Remotion" aesthetic** (cream, serif, gold italic accent word). It's the look we should *not* lean on exclusively, or the result will read as "made with Claude Code" boilerplate.
- **Look at:** `refs/remotion-launch/timeline.jpg`.

## 11. Cursor 3 (cursor3): control sample
A talking-head founder conversation with 3.6s average shots, cutting between a wide two-shot, singles and a screen. It's useful only to show that the big launches split into "film" and "founder talk". For a 20-30s brand intro, ignore this format.

---

## What they have in common
1. **One continuous world, not a slideshow.** In 8 of 11 there are almost no hard cuts. The camera moves through a single canvas: zooming into UI, pulling back, focus-pulling, morphing shapes. The only fast-cut piece (Opus 5.5) disguises its cuts with a **match-cut on a fixed shape**.
2. **Type is the hero, and it is sparse.** 1-4 words on screen at a time, centred, in one display face. Words arrive by **blur-plus-opacity plus small y-offset**, not by sliding in from off-screen. Very often one keyword is treated differently: gradient-filled (ElevenLabs), italic and coloured (Remotion, Claude), or blurred in late (Comet, Lovable).
3. **Two scales of type.** Either huge (Lovable "Now", ElevenLabs "language", Notion "Create a b|") or tiny and confident (Raycast mono caps, Opus 5.5 small serif). Medium "PowerPoint-sized" text is avoided.
4. **A restrained palette with one hero colour or gradient.** Common backgrounds are off-white/cream (#F4F1EA to #F7F6F2) or near-black (#0B0B0F). The accent is a single colour (Linear indigo, Notion blue, Claude coral) or a soft **grainy mesh gradient** (Lovable, ElevenLabs).
5. **Real-feeling UI as set dressing.** Glass panels, prompt boxes, cursors, typed input, streaming text, status pills flipping, waveforms. Even non-product pieces use "typing into a box" as the hook.
6. **Depth without heavy 3D.** Parallax layers, depth-of-field blur, dimming unfocused layers, gentle perspective tilt on cards, and a few hero 3D objects (orb, logo cube, satin wallpaper).
7. **Tactility and analog warmth.** Grain on gradients, paper textures, macro photography (Opus 5.5), painted wallpaper (Cursor), hand-drawn mascots (Notion). This counters the "AI slop" smoothness.
8. **Beat structure:** a cold open on texture or abstract motion (2-3s), then a statement in 2-4 kinetic-type beats, then 2-4 quick product/idea vignettes, then a **staccato typographic coda that switches on every beat**, then the logo on a beat followed by 0.5-1s of near silence.
9. **The music drives the edit.** 110-130 bpm electronic/house, no VO in the shortest pieces. State changes snap to beats or half-beats. A riser goes into the reveal, then there's a hard stop.
10. **The endings are minimal.** A small logo centred on a plain background, sometimes with a URL. The logo build is simple (fade/scale from 96% with blur), never a flashy explode.

---

## Techniques ranked by how much they make it feel current and premium
These are for HTML/CSS/canvas/WebGL rendered frame-by-frame. Assume a deterministic `render(t)` per frame with no real-time timers. Drive everything from `t` with custom easing (`cubic-bezier(0.22,1,0.36,1)` "expo-out" for entrances, `(0.65,0,0.35,1)` for camera moves), or with spring functions evaluated analytically.

1. **Blur-in kinetic type, word by word, with a single accent word** (every reference)
   - Each word goes from `filter: blur(16px)`, `opacity: 0`, `translateY(0.25em)`, `letter-spacing: 0.02em` to `blur(0)`, `opacity: 1`, `translateY(0)`, `letter-spacing: -0.02em` over 450-600ms with expo-out. Stagger words by 60-90ms.
   - The accent word comes 150ms late and gets a gradient fill (`background: linear-gradient(...); -webkit-background-clip: text; color: transparent`) or italic serif plus accent colour.
   - Exit: blur to 8px and fade to 0 over 250ms. Never slide off-screen.
2. **One continuous camera instead of cuts** (Linear, Cursor, Claude Motion, ElevenLabs)
   - Put all scenes on one large "world" div. Animate a single `transform: translate3d() scale()` on the world container with eased keyframes to zoom into a UI element, pull back to reveal context, and push through a word.
   - Go for a recursive zoom: the next scene sits *inside* a small element of the current one (Claude Motion's screen-in-player). Interpolate scale exponentially, `scale = a*(b/a)^p`, so zooms feel linear to the eye.
3. **Match-cut montage on a fixed shape, accelerating** (Opus 5.5)
   - Keep a constant mask shape (an arc/horizon, circle or your logo silhouette) at a fixed position. Behind it, swap textures (images, shader patterns, UI crops) every beat, then every half-beat for the last 2 seconds.
   - Implementation: an SVG `clipPath` or CSS `mask-image` with the shape. Swap the `<img>`/canvas source by `floor(t*bpm/60*k)`. Words sit on the shape's edge using SVG `<textPath>`.
   - This single device gives the "cut to the music" energy without chaos.
4. **Grainy mesh-gradient fields and glow halos** (Lovable, ElevenLabs, Comet)
   - A WebGL fragment shader with 3-5 moving gaussian colour blobs (or layered `radial-gradient`s with animated positions), plus **film grain**: per-frame noise `fract(sin(dot(uv*t...)))` at 4-6% opacity, regenerated each frame.
   - Glow behind a UI card: a duplicate of the card filled with the gradient, `filter: blur(60px)`, `opacity: 0.7`, scaled 1.1, placed under the card.
5. **Tiny monospaced-caps beat coda** (Raycast)
   - On pure black, centred 13-16px uppercase mono with `letter-spacing: 0.2em`, split into two words with a wide gap. Swap the text exactly on each beat with no transition, or with a 2-frame flicker.
   - Use it for your pillars ("BUILD   AGENTS", "SHIP   DEMOS", "MEET   FOUNDERS") and end on "[YOUR NAME]   2026". This is very cheap and feels very premium.
6. **Real-looking UI performance: typed prompt, caret, streaming output** (Lovable, Notion, Raycast, Linear)
   - A glassmorphism panel: `backdrop-filter: blur(24px) saturate(140%)`, `background: rgba(255,255,255,0.06)`, `border: 1px solid rgba(255,255,255,0.12)`, an inner top highlight, and a large soft shadow.
   - Type characters at about 18-25 chars/s with slight jitter (a seeded RNG, not Math.random). Use a gradient or blinking caret, blinking from `t`.
   - Stream answer lines with blur-in, and flip status pills ("Running…" to "Done") on beats.
   - An optional animated cursor follows a bezier path with ease-in-out and a click "press" (scale 0.92 for 80ms).
7. **Depth-of-field type field / parallax z-space** (ElevenLabs, Comet, Remotion card stack)
   - A CSS 3D scene (`perspective: 1200px`, elements at different `translateZ`), or canvas with manual projection.
   - Blur each element by `|z - focusZ| * k`. Move the camera forward so a foreground word sweeps past at huge scale (motion blur: render 4-8 sub-frames and average them in canvas, or stack 3 offset copies at low opacity).
   - Good for "AI / agents / research / startups / builders" words floating in depth.
8. **Focus pull: dim and blur everything except the subject** (Linear)
   - Animate non-focused layers to `filter: blur(6px) brightness(0.45)` while the focused layer stays sharp and scales 1.00 to 1.03. It's cheap and very "Linear".
9. **Shape morph: logo built from the motif** (Lovable heart to logo, Comet strokes to logo, Lovable dots to icon)
   - Use SVG path interpolation (flubber.js, or matching point counts) between a primitive (a circle or the dot grid) and your logo. Alternatively, particles: sample N points from the logo outline in canvas and move scattered dots into place with staggered springs.
   - Use this for the final reveal.
10. **Solid colour slab wipes and light/dark inversion** (Notion blue slab, ElevenLabs and Comet flip)
    - One full-frame rectangle in the hero colour sweeps across (translateX with expo-in-out, 400ms), and the next scene is revealed riding on it.
    - Use one inversion (dark to light, or light to dark) at the climax. It reads as a "chapter change" and makes the logo pop.
11. **Analog texture and grain overlay**
    - A static paper/noise texture at 6-10% via `mix-blend-mode: overlay`, plus per-frame shifting grain, a subtle vignette, and optional chromatic aberration on fast moves (RGB-split copies offset 1-2px, only during camera velocity peaks).
    - Optional light leaks are a gradient blob with `mix-blend-mode: screen` that drifts. Use them sparingly; none of the references lean on them.
12. **3D word roller / slot list** (Comet)
    - A column of words on a cylinder: `rotateX(i*θ - t*ω)` with `translateZ(r)` and opacity falling off with angle. The list rolls through what you do and lands on the key word on the beat.

### Recommended recipe for a 20-30s brand intro (from the references)
| time | beat | technique |
|---|---|---|
| 0-3s | Cold open: grainy mesh gradient or a match-cut texture shape, slow push | 4 / 3 |
| 3-9s | "Every big shift…" / "starts with people who build": 2-3 blur-in word beats, one accent word | 1 |
| 9-17s | Fast montage: the shape mask swapping textures or UI crops on every beat (a prompt box typing, code streaming, a demo-day photo), accelerating to half-beats | 3 / 6 |
| 17-22s | The camera pushes into the prompt box and through a word, then inverts to the other theme | 2 / 7 / 10 |
| 22-26s | Raycast-style mono coda: "BUILD   AGENTS" / "SHIP   PRODUCTS" / "MEET   FOUNDERS" | 5 |
| 26-30s | Logo morphs from the motif, with tiny mono caps under it (university / city / year), then a 1s hold on near silence | 9 |

Music: 115-128 bpm electronic with a clear riser into the montage and a hard stop on the logo. Cut every state change to beats computed from the BPM (`beat = 60/bpm`). Keep any VO out, or just one whispered line.
