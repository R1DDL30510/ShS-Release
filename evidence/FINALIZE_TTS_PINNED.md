# TTS Finalized (Pinned) — 2026-02-19

## Runtime
- Service: `piper-tts.service` (enabled)
- Gateway: `http://<REDACTED_IP>:5511/v1`
- Health: `/health`
- Discovery: `/v1/audio/voices`, `/v1/audio/models`
- Speech: `/v1/audio/speech`

## Voice Defaults
- `ru_default` -> `ru_RU-irina-medium.onnx`
- `de_default` -> `de_DE-thorsten-medium.onnx`
- `en_default` -> `en_US-lessac-medium.onnx`

## OpenWebUI Required Values
- TTS Engine: `openai`
- TTS Base URL: `http://<REDACTED_IP>:5511/v1`
- TTS API Key: `local-shim`
- TTS Model: `piper-local`
- TTS Voice: `ru_default` / `de_default` / `en_default`

## Verification
- `/home/<REDACTED_USER>/tts/verify_tts_stack.sh`
- `systemctl status piper-tts.service`
- `systemctl status tts-drift-guard.timer`

## Drift Guard
- Script: `/home/<REDACTED_USER>/tts/tts_drift_guard.sh`
- Log: `/home/<REDACTED_USER>/tts/logs/tts-drift-guard.log`
- Timer interval: every 10 minutes
- Detects fallback/drift to `<REDACTED_IP>:80` in OpenWebUI logs.
