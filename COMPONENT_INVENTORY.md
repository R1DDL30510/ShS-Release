# Component Inventory

| Component | Type | Purpose | Current Status | Product Relevance | Evidence |
|---|---|---|---|---|---|
| Caddy | systemd service | ingress/reverse proxy | active | all offers | `evidence/planet-verify-gate-cleanup-2026-02-20.txt` |
| Docker | systemd service | container runtime | active | setup, audit, rescue | `evidence/planet-verify-gate-cleanup-2026-02-20.txt` |
| OpenWebUI (`webui-openwebui-1`) | container | user-facing AI app | up (healthy) | setup, rescue | `evidence/planet-verify-gate-cleanup-2026-02-20.txt` |
| Ollama | systemd service | local model backend | active | setup, rescue | `evidence/planet-verify-gate-cleanup-2026-02-20.txt` |
| Piper TTS gateway | systemd service | speech synthesis API | active | setup, rescue | `evidence/FINALIZE_TTS_PINNED.md` |
| TTS drift guard timer | systemd timer | detect endpoint drift/fallback | active | setup, audit | `evidence/FINALIZE_TTS_PINNED.md` |
| project01-status.timer | systemd timer | periodic status snapshot generation | active | audit | `evidence/gate-cleanup-2026-02-20_1005.md` |
| Prometheus | container | metrics collection | active | optional monitoring add-on | `evidence/monitoring-runtime-snapshot-2026-02-20_1100.txt` |
| Grafana | container | dashboards/visualization | active | optional monitoring add-on | `evidence/monitoring-runtime-snapshot-2026-02-20_1100.txt` |
| cadvisor | container | container metrics | active | optional monitoring add-on | `evidence/monitoring-runtime-snapshot-2026-02-20_1100.txt` |
| node-exporter | container | host metrics | active | optional monitoring add-on | `evidence/monitoring-runtime-snapshot-2026-02-20_1100.txt` |
| blackbox-exporter | container | endpoint probing | active | optional monitoring add-on | `evidence/monitoring-runtime-snapshot-2026-02-20_1100.txt` |
| path-validator-hourly.timer | systemd timer | non-core integrity job | disabled (deferred) | deferred scope | `evidence/gate-cleanup-2026-02-20_1005.md` |
| truth-backup-garch.timer | systemd timer | non-core backup job | disabled (deferred) | deferred scope | `evidence/gate-cleanup-2026-02-20_1005.md` |
| truth-backup-image-garch.timer | systemd timer | non-core image backup | disabled (deferred) | deferred scope | `evidence/gate-cleanup-2026-02-20_1005.md` |
| truth-restore-smoke.timer | systemd timer | non-core restore smoke test | disabled (deferred) | deferred scope | `evidence/gate-cleanup-2026-02-20_1005.md` |
| voice-e2e-realcheck.timer | systemd timer | non-core voice e2e check | disabled (deferred) | deferred scope | `evidence/gate-cleanup-2026-02-20_1005.md` |

## Notes
- Disabled non-core timers are intentionally documented as deferred, not hidden.
- Core launch gate evidence is captured in `evidence/EXEC_SUMMARY.md`.
