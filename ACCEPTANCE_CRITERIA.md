# Acceptance Criteria (Strict)

Acceptance is based on explicit PASS checks agreed before execution.

## 1) AI Stack Rescue
Minimum strict PASS set:
- Target incident symptom is resolved or reduced to documented non-blocking state
- Core affected service(s) return healthy/active status
- Reproducible verification command output is included
- Rollback path is documented

## 2) Local AI Setup + TTS
Minimum strict PASS set:
- App endpoint health check passes
- Model backend endpoint is reachable and functional
- TTS health + discovery endpoints pass
- TTS speech generation passes with non-empty audio output
- Ops runbook is delivered

## 3) Ops Audit + Launch Gate
Minimum strict PASS set:
- Core vs non-core classification documented
- Repair/defer decisions documented with rationale
- Launch-gate verification snapshot produced
- Failed units state meets agreed threshold (default target: 0 core failed)
- Re-enable plan documented for deferred items

## 4) Monitoring & Alerting Baseline (Read-Only)
Minimum strict PASS set:
- Monitoring component inventory captured
- Runtime snapshot exported
- Probe/dashboard sanity status documented
- Top-3 prioritized recommendations delivered
- No write/change actions performed (read-only scope)

## Rule
If a strict criterion cannot be met, the delivery must explicitly state:
- unmet criterion
- reason
- remediation path


## Allowed WARN list (must be agreed before execution)
Examples of potentially acceptable WARN states:
- Host-local route-check artifacts that are documented as non-client-impacting
- Deferred non-core jobs explicitly marked out-of-scope

Any WARN not pre-agreed is treated as review-required before acceptance.
