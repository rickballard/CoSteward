# CoVaultHydration BPOE v1

This doc captures how seed stage CoCivium treats crown jewels and how
vault content is later hydrated into public repos.

It pairs with:

- docs/bpoe/CoGuardRails_BPOE_v1.md
- CoCache/docs/outreach/CoGuardRails_ValueProp_v1.md
- Vault side doc "Vault_Precautions_And_HydrationPlan_v1.md"

## 1. BPOE principles

- Repo first for non sensitive content, vault first for crown jewels.
- Guardrails first. If in doubt, keep sharp content in the vault and
  ship only a soft shadow to public repos.
- CoMetaTraining by default. Common flows become helpers, helpers
  become rails, but crown jewel mechanics stay out of public helpers.
- Edge aligned. Local operators know their vault paths and apply
  hydration rules close to where work is done.

## 2. What counts as crown jewel adjacent

Examples:

- GLUKEY and HP57 details.
- Emergent AI experiments and CoCivia internal logic.
- Full HP master plan and detailed investor models.
- Any helper that would let a hostile actor reimplement core value
  without the surrounding guardrails.

If you have to pause and ask yourself whether it is sharp, treat it as
crown jewel adjacent by default.

## 3. Session behaviour

Seed stage sessions SHOULD:

- Use CoRetro to search for existing CoGuardRails and CoVaultHydration
  docs before inventing new flows.
- Keep concrete GLUKEY and HP57 details out of chat and out of public
  repos.
- Write sharp versions into the vault and only bring summaries into
  CoCache or other repos.
- Treat chat as a planning and alignment surface, not as a secret store.

CoStart and other boot flows SHOULD:

- Remind operators that the vault exists and is the home of secrets.
- Nudge them toward CoGuardRails and CoVaultHydration docs when new
  helpers touch safety or capture risk.

## 4. Hydration guidance

When hydrating vault content into repos:

- Start from the vault doc and classification notes.
- Decide if the target audience is:
  - Internal operators,
  - Investors and partners,
  - Public and historians.
- Remove or blur details that are not needed for that audience.
- Keep intent and ethics intact even when details are softened.

Record each hydration step in the vault index so future stewards can
reconstruct what moved where and when.

## 5. CoIndex and CoCTA hooks

Over time CoIndex and CoCTA SHOULD learn to:

- Tag helpers that are CoGuardRails and CoVaultHydration related.
- Warn when new helpers appear to leak crown jewel level detail.
- Offer existing patterns for hydrating or redacting content instead
  of inventing new ones.

This keeps the seed stage BPOE from decaying as more agents come online.
