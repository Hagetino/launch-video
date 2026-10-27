#!/usr/bin/env bash
# Generate a short sound effect with the ElevenLabs Sound Effects API.
#   ELEVENLABS_API_KEY=... scripts/gen_sfx.sh <out.mp3> <seconds> "<description>"
set -euo pipefail
out=${1:?usage: gen_sfx.sh <out.mp3> <seconds> "<description>"}; secs=${2:?seconds}; text=${3:?description}
: "${ELEVENLABS_API_KEY:?set ELEVENLABS_API_KEY (https://elevenlabs.io/app/settings/api-keys)}"
body=$(python3 -c 'import json,sys; print(json.dumps({"text": sys.argv[1], "duration_seconds": float(sys.argv[2]), "prompt_influence": 0.7}))' "$text" "$secs")
code=$(curl -sS -w '%{http_code}' -X POST https://api.elevenlabs.io/v1/sound-generation \
  -H "xi-api-key: $ELEVENLABS_API_KEY" -H 'Content-Type: application/json' -d "$body" -o "$out")
[ "$code" = 200 ] || { echo "ElevenLabs returned HTTP $code:" >&2; cat "$out" >&2; rm -f "$out"; exit 1; }
echo "$out"
