# Anti-Drift Consolidation v1

Timestamp: 2026-02-19

## Goal
Prevent dirty partial changes and keep world docs, lore, and runtime state aligned.

## Current controls
- Periodic WORLD_ONRAMP refresh (cron)
- Periodic OPERATOR_SPICKZETTEL refresh (cron)
- File-triggered OPERATOR refresh (`/home/<REDACTED_USER>/planet/.trigger_spickzettel`)

## Operational rule
Any change must produce:
1) runtime verification
2) doc/lore update
3) rollback note

## Post-change checklist
1. Service health:
   - `docker ps`
   - `systemctl --type=service --state=running`
2. Route health:
   - `curl -k -I https://garui.home.arpa/`
   - `curl -I https://garui.home.arpa/grafana/`
3. DNS/provider health:
   - `dig +short forge.home.arpa @<REDACTED_IP>`
   - `curl http://forge.home.arpa:11434/api/tags`
4. Documentation sync:
   - update relevant `/home/<REDACTED_USER>/planet/docs/*.md`
   - update `/home/<REDACTED_USER>/planet/lore/ledger/*.yaml`
5. Drift scan:
   - check for stale IP literals where hostnames are canonical

## Known open issue
- OpenWebUI backend route `/ui` currently degraded; root portal serves status page (200) while backend recovery is pending.

## Recovery Attempt Log (2026-02-19 late evening)
- Performed ordered recovery: webui recreate -> docker restart -> stack restart -> caddy restart -> host reboot.
- Result: gateway root remained reachable (200 fallback), but OpenWebUI backend still returns empty reply/502.
- Additional clean-room container test with fresh data path reproduced same empty-reply behavior.
- Conclusion: likely image/runtime-level OpenWebUI issue under current environment, not DNS/Caddy/firewall route issue.

## GARUI Stabilization Update (2026-02-19 22:58 CET)
- Applied static Control Landing at `/var/www/garui/index.html` as root service surface.
- Reapplied Caddy routing with root static file_server + explicit `/ui` reverse_proxy to <REDACTED_IP>:3000.
- Verification:
  - `https://garui.home.arpa/` -> 200
  - `https://garui.home.arpa/ui/` -> 200
  - `/grafana` and `/prometheus` -> 401 (expected auth gate)
  - local `http://<REDACTED_IP>:3000/` -> 200
- Current status: gateway stable, monitoring stable, webui currently recovered.

## TTS Finalize Pin (2026-02-19 23:xx CET)
- Pinned local Piper gateway on shsgpi at `http://<REDACTED_IP>:5511/v1`.
- Added discovery endpoints `/v1/audio/voices` and `/v1/audio/models` for OpenWebUI compatibility.
- Added drift guard script + systemd timer (`tts-drift-guard.timer`) every 10 min.
- Added reproducible runbook: `/home/<REDACTED_USER>/tts/FINALIZE_TTS_PINNED.md`.

## Gate Cleanup (2026-02-20 10:05 CET)
- Repaired project01 status snapshot service by making df parser fault-tolerant on unavailable mount targets.
- Disabled non-core failing timers tied to unavailable NAS/STT dependencies.
- Reset failed unit state and verified launch gate: `systemd:failed_units=0`.
- Evidence:
  - /home/<REDACTED_USER>/planet/docs/planet-verify-gate-cleanup-2026-02-20.txt
  - /home/<REDACTED_USER>/planet/docs/gate-cleanup-2026-02-20_1005.md
