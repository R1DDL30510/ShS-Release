# Publish Checklist (Leak + Quality Gate)

## 1) Redaction Check
- [ ] No raw internal IP addresses remain (except intentionally public-safe placeholders)
- [ ] No usernames/host aliases that reveal private infra
- [ ] No credentials, tokens, API keys, cookies
- [ ] No private mount paths exposing sensitive structure

## 2) Evidence Integrity
- [ ] Every claim in `CLAIMS_TO_EVIDENCE.md` maps to a file in `evidence/`
- [ ] No unverifiable marketing statements
- [ ] Timestamps present on key artifacts

## 3) Product Clarity
- [ ] `offers/OFFERS.md` has fixed scope + fixed price
- [ ] Deliverables are explicit
- [ ] Out-of-scope and assumptions are explicit

## 4) Reproducibility
- [ ] `scripts/sync_from_shsgpi.sh` runs successfully
- [ ] `scripts/sanitize.sh` runs cleanly
- [ ] Fresh sync does not reintroduce sensitive strings

## 5) Final Manual Review
- [ ] Open every file in `evidence/` once before publish
- [ ] Confirm no personal/private context leaked
- [ ] Commit with clear tag/message (e.g. `release: evidence pack v1`)
