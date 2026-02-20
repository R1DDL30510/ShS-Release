#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

status=0
warn=0

EXCLUDES=(
  --glob '!.git/*'
  --glob '!scripts/prepublish_check.sh'
  --glob '!evidence/prepublish_check_latest.txt'
  --glob '!evidence/pre_outreach_audit.txt'
  --glob '!evidence/final_audit_snapshot.txt'
  --glob '!evidence/clean_prep_scan.txt'
  --glob '!PUBLISH_CHECKLIST.md'
  --glob '!CLAIMS_TO_EVIDENCE.md'
  --glob '!evidence/review_summary.md'
)

echo "== check: local-only tracked files =="
if git ls-files --error-unmatch scripts/sources.txt >/dev/null 2>&1; then
  echo "FAIL: scripts/sources.txt is tracked"
  status=1
else
  echo "PASS: scripts/sources.txt not tracked"
fi

echo "== check: placeholder/todo markers =="
MARKERS=$(rg -n "TODO|TBD|FIXME|\$TS|Draft v1" . -S \
  --glob '!.git/*' \
  --glob '!scripts/prepublish_check.sh' \
  --glob '!evidence/prepublish_check_latest.txt' \
  --glob '!evidence/pre_outreach_audit.txt' \
  --glob '!evidence/final_audit_snapshot.txt'
  --glob '!evidence/clean_prep_scan.txt' || true)
if [[ -n "$MARKERS" ]]; then
  echo "$MARKERS"
  echo "WARN: markers found (review manually)"
  warn=1
else
  echo "PASS: no obvious markers"
fi

echo "== check: secrets patterns =="
SECRETS=$(rg -n "(api[_-]?key|token|secret|password|passwd|authorization:|bearer\s+|PRIVATE KEY|BEGIN [A-Z ]+PRIVATE KEY|ssh-rsa|ghp_[A-Za-z0-9]{20,}|sk-[A-Za-z0-9]{20,})" . -S "${EXCLUDES[@]}" || true)
if [[ -n "$SECRETS" ]]; then
  echo "$SECRETS"
  echo "WARN: potential secret-like strings found (inspect context)"
  warn=1
else
  echo "PASS: no secret-like patterns"
fi

echo "== check: raw ipv4 =="
IPV4=$(rg -n "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" . -S \
  --glob '!.git/*' \
  --glob '!evidence/prepublish_check_latest.txt' \
  --glob '!evidence/pre_outreach_audit.txt' \
  --glob '!evidence/final_audit_snapshot.txt'
  --glob '!evidence/clean_prep_scan.txt' || true)
if [[ -n "$IPV4" ]]; then
  echo "$IPV4"
  echo "WARN: raw ipv4 found"
  warn=1
else
  echo "PASS: no raw ipv4"
fi

echo "== check: required docs =="
required=(README.md LANDING.md PRODUCT_MATRIX.md INTAKE_FORM.md DELIVERY_PACK_TEMPLATE.md FAQ.md CLAIMS_TO_EVIDENCE.md offers/OFFERS.md offers/SCOPE_AND_BOUNDARIES.md offers/ADDONS_AND_LIMITS.md evidence/EXEC_SUMMARY.md COMMERCIAL_TERMS.md LEGAL_TERMS.md PRIVACY_NOTICE.md)
for f in "${required[@]}"; do
  if [[ -f "$f" ]]; then echo "PASS: $f"; else echo "FAIL: missing $f"; status=1; fi
done

echo "== verdict =="
if [[ $status -ne 0 ]]; then
  echo "FAIL: blocking issues found"
  exit 1
elif [[ $warn -ne 0 ]]; then
  echo "WARN: non-blocking review items found"
  exit 0
else
  echo "PASS: publish-ready (pre-launch)"
  exit 0
fi
