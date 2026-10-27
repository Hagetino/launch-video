#!/usr/bin/env bash
# Mix the music + SFX onto intro-silent.mp4 -> intro.mp4.
# Needs audio/music.mp3. audio/typing.mp3, audio/blip.mp3 and audio/hit.mp3 are optional.
# Template timing: 120 BPM, drop at 8.0 s, typing 5.0-6.6 s, coda blips on every beat 17-20 s, hit at 20.5 s.
set -euo pipefail
cd "$(dirname "$0")"
DUR=${DUR:-24}
CUES=(blip@17.0:0.55 blip@17.5:0.55 blip@18.0:0.6 blip@18.5:0.6 blip@19.0:0.65 blip@19.5:0.65 blip@20.0:0.7 hit@20.5:0.95)
inputs=(-i intro-silent.mp4 -i audio/music.mp3)
filters="[1:a]volume=${MUSIC_VOL:-0.9}[m];"; labels="[m]"; i=2
if [ -f audio/typing.mp3 ]; then
  inputs+=(-i audio/typing.mp3)
  filters+="[$i:a]atrim=0:1.6,afade=t=out:st=1.3:d=0.3,volume=0.35,adelay=5000|5000[s$i];"; labels+="[s$i]"; i=$((i+1))
fi
for c in "${CUES[@]}"; do
  f=${c%%@*}; rest=${c#*@}; t=${rest%%:*}; v=${rest#*:}
  [ -f "audio/$f.mp3" ] || continue
  ms=$(python3 -c "print(round($t*1000))")
  inputs+=(-i "audio/$f.mp3")
  filters+="[$i:a]volume=$v,adelay=${ms}|${ms}[s$i];"; labels+="[s$i]"; i=$((i+1))
done
filters+="${labels}amix=inputs=$((i-1)):normalize=0:dropout_transition=0,alimiter=limit=0.9,atrim=0:${DUR}[a]"
ffmpeg -y -loglevel error "${inputs[@]}" -filter_complex "$filters" -map 0:v -map "[a]" -c:v copy -c:a aac -b:a 192k -shortest intro.mp4
echo intro.mp4
