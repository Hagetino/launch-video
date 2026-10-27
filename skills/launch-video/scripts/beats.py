# Estimate BPM and the beat offset (first beat) of a track, plus its strongest onsets.
#   python3 scripts/beats.py audio/music.mp3     (searches 110-130 BPM; edit the range for other tempos)
import subprocess, sys, array, math
SR, HOP = 11025, 110  # ~10 ms hops
raw = subprocess.run(['ffmpeg','-loglevel','error','-i',sys.argv[1],'-ac','1','-ar',str(SR),'-f','s16le','-'],capture_output=True).stdout
x = array.array('h'); x.frombytes(raw)
# low-passed energy (kick-ish) via simple moving average, then onset flux
env = []
for i in range(0, len(x) - HOP, HOP):
    seg = x[i:i+HOP]; env.append(math.sqrt(sum(v*v for v in seg) / HOP))
flux = [max(0, env[i] - env[i-1]) for i in range(1, len(env))]
fps = SR / HOP
best = None
for bpm10 in range(1100, 1301, 2):
    bpm = bpm10 / 10; per = 60 / bpm
    for off_ms in range(0, int(per * 1000), 5):
        off = off_ms / 1000; score = 0; t = off
        while t < len(flux) / fps:
            k = int(t * fps); score += max(flux[max(0,k-1):k+2] or [0]); t += per
        score /= (len(flux) / fps / per)
        if not best or score > best[0]: best = (score, bpm, off)
print("best bpm %.1f offset %.3fs score %.0f" % (best[1], best[2], best[0]))
# strongest onsets for reference
top = sorted(range(len(flux)), key=lambda i: -flux[i])[:12]
print("top onsets:", sorted(round((i+1)/fps, 2) for i in top))
