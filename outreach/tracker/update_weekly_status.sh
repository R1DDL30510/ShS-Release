#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
CSV="$ROOT/outreach/tracker/LEADS.csv"
OUT="$ROOT/outreach/tracker/WEEKLY_STATUS.md"

if [[ ! -f "$CSV" ]]; then
  echo "Missing $CSV" >&2
  exit 1
fi

count(){
  local s="$1"
  awk -F, -v st="$s" 'NR>1 && $5==st {c++} END {print c+0}' "$CSV"
}

posted=$(count posted)
engaged=$(count engaged)
intake_sent=$(count intake_sent)
qualified=$(count qualified)
won=$(count won)
lost=$(count lost)

cat > "$OUT" <<MD
# Weekly Outreach Status

## Funnel snapshot
- Posts published: $posted
- Inbound replies: $engaged
- Engaged leads: $engaged
- Intake sent: $intake_sent
- Qualified: $qualified
- Won: $won
- Lost: $lost

## What worked
- (fill manually)

## What to change next week
- (fill manually)

## Next week targets
- Platform posts: (fill manually)
- Qualified leads target: (fill manually)
MD

echo "Wrote $OUT"
