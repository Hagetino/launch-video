#!/usr/bin/env bash
# Generate an instrumental track with the ElevenLabs Music API.
#   ELEVENLABS_API_KEY=... scripts/gen_music.sh <out.mp3> <length-seconds> [prompt-file]
# Without a prompt file it uses prompts/music.txt next to this script.
set -euo pipefail
out=${1:?usage: gen_music.sh <out.mp3> <seconds> [prompt-file]}; secs=${2:?seconds}
prompt_file=${3:-"$(dirname "$0")/../prompts/music.txt"}
: "${ELEVENLABS_API_KEY:?set ELEVENLABS_API_KEY (https://elevenlabs.io/app/settings/api-keys)}"
body=$(python3 -c 'import json,sys; print(json.dumps({"prompt": open(sys.argv[1]).read().strip(), "music_length_ms": int(float(sys.argv[2])*1000)}))' "$prompt_file" "$secs")
code=$(curl -sS -w '%{http_code}' -X POST https://api.elevenlabs.io/v1/music \
  -H "xi-api-key: $ELEVENLABS_API_KEY" -H 'Content-Type: application/json' -d "$body" -o "$out")
[ "$code" = 200 ] || { echo "ElevenLabs returned HTTP $code:" >&2; cat "$out" >&2; rm -f "$out"; exit 1; }
echo "$out ($(ffprobe -v error -show_entries format=duration -of csv=p=0 "$out") s)"
