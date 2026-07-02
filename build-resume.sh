#!/usr/bin/env bash
# Regenerate GarrettHagenResume.pdf from GarrettHagenResume.html via headless Chrome.
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"
CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
[ -x "$CHROME" ] || { echo "Chrome not found at: $CHROME (set \$CHROME)"; exit 1; }
"$CHROME" --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf=GarrettHagenResume.pdf "file://$PWD/GarrettHagenResume.html" 2>/dev/null
echo "Generated GarrettHagenResume.pdf"
