#!/bin/bash
# Send EC LLM command(s) to the mlkem daemon; print response.
# Usage:
#   ec_send.sh '<one-line command>'
#   ec_send.sh --file scripts/ec_daemon/cmd.json
#
# The daemon must be running (started from formosa-mlkem):
#   python3 -u scripts/ec_daemon/daemon.py &
#
# Multi-line tactics: put them in cmd.json. The daemon counts
# sentences (lines ending '.' or meta keywords) and reads exactly
# that many <END>-terminated responses.
set -eu
D="$(cd "$(dirname "$0")" && pwd)"
IN="$D/ec_in"
OUT="$D/ec_out"
if [ ! -p "$IN" ] || [ ! -p "$OUT" ]; then
  echo "ec_send.sh: $IN and $OUT must be named pipes." >&2
  echo "ec_send.sh: daemon not running. Start with:" >&2
  echo "  cd /Users/mbb/Desktop/Repos/formosa-mlkem && python3 -u scripts/ec_daemon/daemon.py &" >&2
  exit 2
fi
if [ "${1:-}" = "--file" ]; then
  REQ=$(cat "$2")
else
  REQ="${1:-}"
fi
if [ -z "$REQ" ]; then
  echo "ec_send.sh: empty request." >&2
  exit 1
fi
{ printf '%s\n' "$REQ" > "$IN"; } &
WRITER=$!
cat "$OUT"
wait "$WRITER"
