# Launch Readiness Audit (2026-02-20_0958)

## Scope
- Core runtime health
- WebUI and TTS availability
- Failed unit triage for market readiness

## Core Services

auto-generated from: systemctl is-active caddy docker piper-tts tts-drift-guard.timer pihole-FTL ollama

## Failed Units Snapshot


auto-generated from: systemctl --failed --no-legend


action guidance:
- Keep core services green (caddy/docker/webui/piper)
- Move non-core failed units into either:
  - repaired operational path, or
  - explicitly disabled + documented as out-of-scope for client delivery

## Reproducible Verify Command

/home/<REDACTED_USER>/planet/bin/planet-verify.sh





## Core Services Status (snapshot)
```text
$(systemctl is-active caddy docker piper-tts tts-drift-guard.timer pihole-FTL ollama || true)
```

## Failed Units (snapshot)
```text
$(systemctl --failed --no-legend || true)
```

## Immediate Commercialization Gate
- PASS: WebUI local health, TTS synth verify, core services active.
- WARN: 7 failed non-core units remain; must be either repaired or explicitly excluded from client-facing baseline.
- WARN: Host-local HTTPS self-check returns 000 (known local-check artifact). Use LAN-client checks as acceptance criteria.
