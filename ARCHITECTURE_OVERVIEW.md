# Architecture Overview (Client-Facing)

This is a practical overview of the service stack used in current proof cases.

## Core runtime path
1. **Ingress/Reverse Proxy:** Caddy
2. **App Layer:** OpenWebUI (container)
3. **Model Runtime:** Ollama (system service)
4. **Speech Layer:** Piper TTS gateway (system service)
5. **Ops Visibility:** Monitoring stack (Prometheus/Grafana + exporters)

## High-level flow
- Client request enters through Caddy
- OpenWebUI handles UI/session interactions
- OpenWebUI calls model backend (Ollama)
- If speech output is requested, OpenWebUI calls Piper TTS API
- Monitoring stack tracks runtime health for operational checks

## Why this architecture
- Local/self-hosted orientation
- Reproducible verification outputs
- Drift detection and operational guardrails
- Separation between core and non-core operational jobs

## Known operational boundary
Host-local route checks may show artifacts in some contexts; launch acceptance is based on defined verification criteria and client-relevant checks.

## Evidence links
- `evidence/planet-verify-gate-cleanup-2026-02-20.txt`
- `evidence/FINALIZE_TTS_PINNED.md`
- `evidence/EXEC_SUMMARY.md`
