# Pipelines Overview

## 1) Rescue Pipeline (Break/Fix)
**Input:** unstable or failing local/self-hosted stack  
**Actions:** diagnose -> targeted repair -> verify -> rollback notes  
**Output:** incident summary + evidence block + next-risk notes

Related offer: `offers/OFFERS.md` (AI Stack Rescue)

---

## 2) Setup & Stabilization Pipeline
**Input:** desired OpenWebUI/Ollama/TTS integration  
**Actions:** integration -> pinning -> health/discovery/speech verification -> drift guard  
**Output:** baseline config docs + verification + operations runbook

Related offer: `offers/OFFERS.md` (Local AI Setup + TTS)

---

## 3) Ops Audit + Launch Gate Pipeline
**Input:** noisy pre-launch environment with failed/non-core units  
**Actions:** core vs non-core triage -> repair/disable decisions -> reset-failed -> gate verification  
**Output:** audit report + gate status + deferred/re-enable plan

Related offer: `offers/OFFERS.md` (Ops Audit + Launch Gate)

---

## 4) Evidence Packaging Pipeline
**Input:** operational artifacts from execution world  
**Actions:** sync -> sanitize -> claims mapping -> prepublish QA  
**Output:** publishable proof repository without sensitive leakage

Related docs:
- `CLAIMS_TO_EVIDENCE.md`
- `PUBLISH_CHECKLIST.md`
- `scripts/prepublish_check.sh`


---

## 5) Monitoring Baseline Pipeline
**Input:** existing runtime with unclear observability status  
**Actions:** component inventory check -> minimal probe/dashboard sanity -> snapshot export  
**Output:** monitoring baseline report + priority action list

Related offer: `offers/OFFERS.md` (Monitoring & Alerting Baseline)
