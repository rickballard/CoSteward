# CoBus BPOE v1

This doc defines how seed stage CoCivium uses CoBus notices to move
intent, context and guardrails between sessions and roles (Co1, CoPre,
CoPrime, Outreaches, DrB and others).

CoBus notices are lightweight, trail friendly memos that:

- Point at packs, branches and vault paths.
- Describe what changed and what is being asked.
- Remind sessions about guardrails and sensitivity.
- Never carry crown jewel or GLUKEY level detail themselves.

They pair with:

- CoGuardRails_BPOE_v1.md
- CoVaultHydration_BPOE_v1.md
- CoTick, CoAxioms and CoEvoCascade insights couplets.

## 1. When to use CoBus

Use a CoBus notice when:

- A session is handing off due to CoBloat, lag or tenure limits.
- One role (for example CoPre) needs to brief another role (for example Co1 or DrB).
- A sensitive pattern needs to be echoed across sessions without
  copying vault details.
- A new insights couplet or rails pattern needs to be flagged as
  important for other sessions.

Do not use CoBus for:

- Raw design work.
- Full transcripts.
- Secrets or sharp mechanics (GLUKEY, HP57 internals, detailed deal maths).

Those live in vaults and private packs. CoBus only points at them.

## 2. CoBus notice structure

Default sections:

1. Title and scope.
2. Context.
3. What you are receiving.
4. What is likely inside.
5. Immediate asks.
6. Sensitivity and exposure reminders.
7. Role reminder.

See docs/intent/CoBus_Notice_Template_v1.md for the canonical layout.

## 3. Sensitivity rules

CoBus notices MUST:

- Avoid spelling out GLUKEY mechanics, HP57 details or full business
  model spreadsheets.
- Refer to such items only as crown jewel material, GLUKEY aligned
  assets, HP57 vault content or Thursday packs.
- Treat chat and repo as pointers, not as secret stores.

If a draft CoBus notice starts to carry sharp details:

- Move those details into the LAN vault (for example CoCiviumAdmin).
- Replace them in the notice with a vault path reference or a
  qualitative label only.

## 4. Trails and CoAxioms

Important CoBus notices SHOULD:

- Live as markdown in a repo (usually CoSteward or CoCache) or be
  summarised there.
- Link or refer to relevant CoAxioms, for example:
  - CoAxiom1 – Coevolutionary reliance.
  - CoAxiom2 – Trails over tales.
  - CoAxiom7 – Hydrated history promise.

Optional metadata:

```yaml
CoBus:
  from: CoPre
  to: Co1
  uts: 20251210T180000Z
  relates_to:
    - CoCrux
    - CoEvoMetaHandles
    - Thursday_DarrenPack
  CoAxioms:
    - CoAxiom1
    - CoAxiom2
    - CoAxiom7
This enables CoIndex and future tools to discover and cluster CoBus notices.

5. CoTicks on CoBus patterns

Individual CoBus notices are usually not canonical, but CoBus
patterns or templates that prove reliable over multiple handoffs may
earn a CoTick.

When a CoBus template deserves a CoTick:

Add CoTick metadata where the template lives.

Note which CoAxioms it embodies (for example CoAxiom2, CoAxiom6, CoAxiom7).

6. Behaviour for sessions and agents

Seed stage sessions SHOULD:

Use CoBus notices instead of ad hoc paragraphs when:

Handing off to a new CoPrime or Co1 session.

Briefing other roles (including DrB) about sensitive work.

Check existing CoBus examples via CoRetro before inventing new formats.

Keep CoBus texts short, structural and free of vault level secrets.

CoStart and CoRescue flows MAY:

Suggest creating a CoBus notice as part of session wind down.

Point at this BPOE doc when a session is about to cross bloat or
tenure limits.

This BPOE is v1 and SHOULD evolve as CoBus patterns stabilise and
CoIndex and CoCTA begin to automate discovery and routing.
