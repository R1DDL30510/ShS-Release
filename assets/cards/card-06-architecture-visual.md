# Card 06 — Architecture Overview

## Local AI Service Path
Caddy (Ingress) → OpenWebUI (App) → Ollama (Model Runtime) → Piper TTS (Speech)

Monitoring: Prometheus + Grafana + Exporters

- Local/self-hosted orientation
- Reproducible verification output
- Drift-aware operations model

Proof: `ARCHITECTURE_OVERVIEW.md`, `COMPONENT_INVENTORY.md`
