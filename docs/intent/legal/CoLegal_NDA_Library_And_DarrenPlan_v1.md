# CoLegal - NDA Library And Darren Plan (v1)

Generated: 20251208T162817Z

## Intent

Define how CoCivium will handle NDAs and similar legal templates, with an immediate
focus on providing a reliable NDA path for Darren (wealth advisor) ahead of the
planned advisory meeting.

This doc does not expose confidential legal terms. It describes structure and workflow.

## NDA library concept (seed)

- Aim:
  - Maintain a library of NDA templates and related contracts.
  - Support generic and recipient-specific variants.
  - Prefer digital signing where feasible.

- Storage expectations (to be refined):
  - Public parts (templates, boilerplates) MAY live on public repos.
  - Private parts (filled-in versions, signed copies, identity details) SHOULD live:
    - On private repos, or
    - On LAN server vaults (for example CoCiviumAdmin), or
    - In secure document stores managed outside public Git.

Future CoWaves SHOULD:

- Create a concrete folder layout for NDA templates (for example in RickPublic or a
  dedicated legal repo).
- Add simple indexes that point from CoSteward into that library.

## Darren-specific NDA plan (seed)

Immediate needs for Darren:

- Provide an NDA he can open reliably.
- Offer common formats (for example markdown, PDF, Word).
- Keep terms aligned with the CoCivium stealth and IP protection goals.

Recommended near-term workflow:

1. Confirm which repo currently holds the most recent CoCivium NDA draft.
   - For example a legal or RickPublic repo path such as:
     - docs/legal/CoCivium_NDA_Template_v1.*
   - (Exact path to be confirmed in a future wave.)
2. From that template, generate:
   - A Darren-specific NDA instance.
   - Exported as:
     - .md for versioning.
     - .pdf and/or .docx for signing.
3. Provide Rick with the files so they can be attached to a reply email to Darren.

This wave does not fabricate the legal text. It assumes:

- The NDA terms come from prior legal work already done on repo.
- Co1 and Outreaches will coordinate on:
  - Which NDA variant is appropriate for Darren.
  - Any jurisdictional or advisor-specific nuances.

## Future CoWaves (seed checklist)

- [ ] Locate the current canonical CoCivium NDA template on repo.
- [ ] Create an NDA library index file that lists:
      - Template names.
      - Intended use cases.
      - Status (draft, approved).
- [ ] Generate Darren-specific NDA documents in multiple formats.
- [ ] Add BPOE guidance on:
      - When to use which NDA.
      - How to store signed copies without leaking private details on public repos.

_This v1 is a planning and structure doc. The actual NDA contents remain in their own
 legal files and can be evolved with legal input without changing this plan._

