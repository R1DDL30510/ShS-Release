# ShS Release — Product Proof Repository

Public-facing, evidence-only portfolio/release repo for Secure Home Systems operational products.

## What you can reserve now (pilot/waitlist)
1. **AI Stack Rescue (2h)** — fast diagnosis + recovery with proof
2. **Local AI Setup + TTS (1 day)** — integration + verification + drift guard
3. **Ops Audit + Launch Gate** — triage, cleanup decisions, gate snapshot

See: `offers/OFFERS.md`

Add-ons & limits: `offers/ADDONS_AND_LIMITS.md`

## Proof map
- Claim mapping: `CLAIMS_TO_EVIDENCE.md`
- Evidence index: `evidence/INDEX.md`
- Evidence summary: `evidence/EXEC_SUMMARY.md`
- Case summaries: `cases/CASE_CARDS.md`
- Scope limits: `offers/SCOPE_AND_BOUNDARIES.md`

## Repo intent
### This repo is
- Sanitized proof for service/product claims
- Reproducible verification outputs
- Offer descriptions with boundaries and deliverables

### This repo is NOT
- A credential store
- A private infra topology dump
- A replacement for legal/compliance certification

## Outreach readiness gate
Before publishing, complete: `PUBLISH_CHECKLIST.md`

## Sync/update
Run:

```bash
./scripts/sync_from_shsgpi.sh
```

This pulls selected artifacts from shsgpi and sanitizes obvious sensitive details.

## Private sync config
- `scripts/sources.txt` is local runtime config (can be excluded from public publish).
- `scripts/sources.example.txt` is the share-safe template.

## Business & legal basics
- `COMMERCIAL_TERMS.md`
- `LEGAL_TERMS.md`
- `PRIVACY_NOTICE.md`
- `SALES_READY.md`


## Current status
- Pre-Launch / pilot-waitlist phase
- Formal business registration in preparation


## Sales assets
- `LANDING.md`
- `PRODUCT_MATRIX.md`
- `INTAKE_FORM.md`
- `DELIVERY_PACK_TEMPLATE.md`
- `FAQ.md`


## Pre-publish QA
Run: `./scripts/prepublish_check.sh`


## Transparency docs
- `ARCHITECTURE_OVERVIEW.md`
- `PIPELINES_OVERVIEW.md`
- `COMPONENT_INVENTORY.md`

- `HOW_ENGAGEMENT_WORKS.md`
- `SAMPLE_DELIVERY_PACK.md`
- `SERVICE_LEVELS.md`
- `ACCEPTANCE_CRITERIA.md`
- `CAPACITY_AND_BOOKING_POLICY.md`
- `MONITORING_SAMPLE_DELIVERY.md`
- `SAMPLE_DELIVERY_PACK_02_TTS_SETUP.md`
- `SAMPLE_DELIVERY_PACK_03_MONITORING.md`
- `assets/PRODUCT_CARDS.md`
- `assets/PIPELINE_FLOW.md`

## Visual assets (dark clean)
- `assets/STYLE_GUIDE_DARK_CLEAN.md`
- `assets/cards/card-01-ai-stack-rescue.md`
- `assets/cards/card-02-local-ai-setup-tts.md`
- `assets/cards/card-03-ops-audit-launch-gate.md`
- `assets/cards/card-04-monitoring-baseline.md`
- `assets/cards/card-05-pipeline-flow-visual.md`
- `assets/cards/card-06-architecture-visual.md`
