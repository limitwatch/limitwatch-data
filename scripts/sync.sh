#!/usr/bin/env bash
# Copy the latest JSON feed from the LimitWatch site build into this repo.
set -euo pipefail
SRC="${LIMITWATCH_DIST:-/workspace/limitwatch/dist/api}"
DEST="$(cd "$(dirname "$0")/.." && pwd)/api"
for f in plans.json changes.json; do
  [ -f "$SRC/$f" ] || { echo "missing $SRC/$f" >&2; exit 1; }
  python3 -m json.tool "$SRC/$f" >/dev/null
  cp "$SRC/$f" "$DEST/$f"
done
cd "$DEST/.."
git status --short api
