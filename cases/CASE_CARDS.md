# Case Cards (Evidence-Only)

## Case 01 — OpenWebUI + TTS stabilization
**Date:** 2026-02-19 to 2026-02-20

**Initial symptoms:**
- TTS discovery/speech instability
- route behavior inconsistencies during recovery cycles

**Actions performed:**
- pinned local TTS gateway
- added compatibility endpoints for voices/models
- added drift guard timer
- verified health + discovery + speech

**Evidence:**
- `evidence/FINALIZE_TTS_PINNED.md`
- `evidence/planet-verify-gate-cleanup-2026-02-20.txt`

**Measured outcome:**
- `PASS | tts:health reachable`
- `PASS | tts:/v1/audio/voices code=200`
- `PASS | tts:/v1/audio/models code=200`
- `PASS | tts:speech code=200 bytes=98976`

---

## Case 02 — Launch gate cleanup (failed-unit noise removal)
**Date:** 2026-02-20

**Initial symptoms:**
- multiple failed non-core units due unavailable NAS/STT dependencies
- one status service crashing on disk-parser edge case

**Actions performed:**
- repaired `project01-status.service` parser fault path (`df_pct()` hardening)
- disabled non-core failing timers with explicit rationale
- reset failed state and re-verified gate

**Evidence:**
- `evidence/gate-cleanup-2026-02-20_1005.md`
- `evidence/planet-verify-gate-cleanup-2026-02-20.txt`

**Measured outcome:**
- `PASS | systemd:failed_units=0`
- successful status snapshot write (`/var/www/project01/status.json`)

---

## Case 03 — Evidence-only product release packaging
**Date:** 2026-02-20

**Initial symptoms:**
- technical work existed but external-facing proof was fragmented

**Actions performed:**
- built sanitized release repo structure
- added claim mapping, publish checklist, scope boundaries
- established sync + sanitize workflow for evidence refresh

**Evidence:**
- `CLAIMS_TO_EVIDENCE.md`
- `PUBLISH_CHECKLIST.md`
- `offers/SCOPE_AND_BOUNDARIES.md`
- `evidence/review_summary.md`

**Measured outcome:**
- outreach-ready proof bundle with explicit non-overclaim boundaries
