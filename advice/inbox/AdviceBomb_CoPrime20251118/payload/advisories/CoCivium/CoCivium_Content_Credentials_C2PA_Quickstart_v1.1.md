# Content Credentials (C2PA) Quickstart v1.1

**Objective:** Ship images/PDFs with embedded provenance pointing back to CoCivium’s verifyable claims.

---

## 1) Decide your provenance chain

- **Entity:** "CoCivium"
- **Link back:** `https://cocivium.org/verify/<claim_id>` for the content’s source claim.
- **Public keys:** `/keys/keys.json`

---

## 2) Embed credentials

Use a C2PA‑capable tool to write:
- Organization = "CoCivium"
- Credential = link to verify URL of the governing claim
- Asserted date = UTC timestamp of publication
- Optional: thumbprint of the governing claim (`sha256:<hex>`)

---

## 3) Verify with two tools

- Extract C2PA manifest and check that:
  - The `assertions` include the verify URL
  - The timestamp is reasonable (±5 min of publish)
  - The file’s binary hash matches what is reported (if tool supports it)

---

## 4) Display rules

- Always display a **Verify** link next to the media, pointing to the governing claim verify page.
- If the verify page returns FAIL, hide the “Official” badge and show a warning.

---

## 5) Repository practice

- Keep original source media and a provenance‑stamped export side‑by‑side:
```
/media/source/logo.svg
/media/published/logo.png
/media/published/logo.png.c2pa.json  (optional export of the manifest)
```
