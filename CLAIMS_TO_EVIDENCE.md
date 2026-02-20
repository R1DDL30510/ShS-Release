# Claims to Evidence (v1)

This file maps each claim to concrete, inspectable evidence.

## Claim 1 — Core runtime services are up
**Evidence file:** `evidence/planet-verify-gate-cleanup-2026-02-20.txt`

**Quoted lines:**
- `PASS | systemd:caddy active`
- `PASS | systemd:docker active`
- `PASS | systemd:piper-tts active`
- `PASS | systemd:tts-drift-guard.timer active`
- `PASS | systemd:pihole-FTL active`
- `PASS | systemd:ollama active`

## Claim 2 — OpenWebUI app endpoint is healthy
**Evidence file:** `evidence/planet-verify-gate-cleanup-2026-02-20.txt`

**Quoted line:**
- `PASS | webui-local:3000 code=200`

## Claim 3 — TTS is functional end-to-end
**Evidence files:**
- `evidence/planet-verify-gate-cleanup-2026-02-20.txt`
- `evidence/FINALIZE_TTS_PINNED.md`

**Quoted lines:**
- `PASS | tts:health reachable`
- `PASS | tts:/v1/audio/voices code=200`
- `PASS | tts:/v1/audio/models code=200`
- `PASS | tts:speech code=200 bytes=98976`
- `Voice Defaults: ru_default / de_default / en_default`

## Claim 4 — Failed-unit launch noise was cleaned to zero
**Evidence files:**
- `evidence/planet-verify-gate-cleanup-2026-02-20.txt`
- `evidence/gate-cleanup-2026-02-20_1005.md`

**Quoted lines:**
- `PASS | systemd:failed_units=0`
- `Repaired project01-status.service ... df_pct() now returns None`
- `Disabled non-core timers ...`

## Claim 5 — Deferred items were handled transparently (not hidden)
**Evidence file:** `evidence/gate-cleanup-2026-02-20_1005.md`

**Quoted lines:**
- explicit disabled timer list
- explicit re-enable command block
- note on host-local route check artifact (`code=000`) + acceptance criterion

## Claim 6 — Anti-drift governance exists
**Evidence file:** `evidence/anti-drift-consolidation-v1.md`

**Quoted lines:**
- `Any change must produce: runtime verification, doc/lore update, rollback note`
- `Gate Cleanup (2026-02-20 10:05 CET) ... verified launch gate: systemd:failed_units=0`

---

## Scope note
This repository is evidence-only and sanitized for external presentation. It excludes credentials and private operational secrets by design.


## Claim 7 — Monitoring baseline visibility is demonstrated
**Evidence files:**
- `evidence/monitoring-runtime-snapshot-2026-02-20_1100.txt`
- `MONITORING_SAMPLE_DELIVERY.md`

**Quoted indicators:**
- monitoring containers listed as running (`prometheus`, `grafana`, `cadvisor`, `node-exporter`, `blackbox`)
- snapshot includes active core runtime dependency checks
- sample delivery explicitly states read-only scope and top-3 recommendations


## Sample delivery examples
- `SAMPLE_DELIVERY_PACK.md`
- `SAMPLE_DELIVERY_PACK_02_TTS_SETUP.md`
- `SAMPLE_DELIVERY_PACK_03_MONITORING.md`
