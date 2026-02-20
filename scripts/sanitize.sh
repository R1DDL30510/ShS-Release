#!/usr/bin/env bash
set -euo pipefail
f="$1"
# Conservative redactions (extend as needed)
sed -E \
  -e 's/[0-9]{1,3}(\.[0-9]{1,3}){3}/<REDACTED_IP>/g' \
  -e 's#(/home/)[^/]+#\1<REDACTED_USER>#g' \
  -e 's#(ssh )[^ ]+#\1<REDACTED_HOST>#g' \
  "$f" > "$f.tmp"
mv "$f.tmp" "$f"
