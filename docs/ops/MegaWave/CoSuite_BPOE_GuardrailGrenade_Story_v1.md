# CoSuite BPOE Guardrail Grenade story (v1)

This is a story-mode guide for humans and AIs who like vibes more than
spec sheets.

It explains three things:

- why Guardrail Grenades exist,
- how they fit into the CoSuite and CoCivium vision,
- how to use them without needing to learn every tool first.

The technical details live in other BPOE docs. This file is the story skin.

---

## 1. The problem Guardrail Grenades are trying to solve

Modern AI chats are powerful but fragile.

- Each session starts with a blank mind.
- Every interface behaves a little differently.
- New features appear, such as a "Run code" button, that quietly change
  what is possible in a session.
- Humans have to remember long, fragile prompts just to get back to the
  same working environment as last time.

For CoSuite and CoCivium this is not good enough.

We are trying to build something that can outlive any single AI model
or UI. That needs:

- a stable way to tell new sessions what matters,
- a clear separation between thinking, experimenting, and deployment,
- simple entry points that non technical people can use.

That is the space where Guardrail Grenades live.

---

## 2. What is a Guardrail Grenade (GG)?

A Guardrail Grenade (GG) is a small asset you can throw into a session
to straighten it up.

Most often it is a single markdown file that you drag into the chat as
the very first message. Sometimes it may be a small zip that contains
a prompt plus helper material.

A GG usually does these things:

- explains that repos are the source of truth,
- asks the AI to run in MegaWave cycles for non trivial work,
- explains that any "Run code" or sandbox buttons are helpers only,
- points the AI at the current BPOE docs on CoSteward,
- sets a mission id and session label so future waves can keep track.

In CoSuite the most important GG right now is the CoSuite CoAnchor
Quickstart. It is the little seed that says:

> this session is now part of the CoSuite,
> please behave like a CoPrime or CoArena helper,
> and please obey the BPOE surface on CoSteward.

The Quickstart file is both:

- a thing humans can pin on their desktop or taskbar,
- and a "vibe contract" that sessions are asked to honour.

---

## 3. How Guardrail Grenades work in practice

From the human side the flow is simple.

1. You keep a GG file somewhere easy to reach.
2. When you want a serious CoSuite session you:
   - open a new AI chat,
   - drag the GG file into the session as the very first message,
   - fill in the mission id and session label when asked.
3. The AI then:
   - reads the BPOE pointers in the GG,
   - adopts the MegaWave pattern where possible,
   - treats repos as source of truth,
   - treats Run-code as a microscope, not a deployment path.

The work after that still looks like normal conversation. The GG is
just the launch rail that makes it far more likely that later waves
will stay aligned with CoCivium values and with CoSuite best practice.

From the AI side the GG is a promise:

- If the session can honour the pattern, it should say so.
- If it cannot, it should say why, and still leave at least one small
  CoBlock and a CoPing line so that future sessions can recover.

---

## 4. Relationship to other CoSuite BPOE docs

This story-mode doc sits beside more detailed documents that describe:

- the full MegaWave pattern,
- which CoSuite repos currently exist,
- the AI entry and CoAnchor patterns,
- the CoPrime_IntentCloud2025 mission plan and intent source snapshots.

Typical references:

- CoSuite_BPOE_MegaWavePattern_v1.md
- CoSuite_CurrentRepos_v1.md
- CoSuite_BPOE_AIEntry_v1.md
- CoSuite_CoAnchorPattern_v1.md
- CoPrime_IntentCloud2025_MissionPlan_v1.md
- the latest CoPrime_IntentCloud2025_IntentSourcesSnapshot_*.md

This file does not try to repeat all of that. It simply gives a human
friendly story that points towards them.

When in doubt, those other docs and the repos themselves win. This
file is a lantern, not the map.

---

## 5. For vibecoders and non coders

If you think of yourself as a vibecoder, you are exactly the kind of
person this file is written for.

You do not need to learn PowerShell, GitHub CLI, or CI workflows in
order to use Guardrail Grenades. You only need to:

- keep the right GG pinned somewhere handy,
- drag it into new sessions that matter,
- and notice when a session stops behaving as promised.

If things go strange, you can always throw in the GG again in a new
session and let the CoSuite BPOE surface pull the work back on rails.

---

## 6. Future directions

Later waves will likely add:

- other GG variants for personal data protection,
- team session GGs for shared missions,
- language specific GGs,
- and GGs tuned for different products such as CoAgent, CoArena or
  CoAudit.

All of those will still share the same core ideas:

- repos as source of truth,
- MegaWave cycles for non trivial missions,
- Run-code and similar features as microscopes,
- clear CoPing and CoStatus receipts so that future sessions and
  humans can see what happened.

This is v1. Future versions should make this shorter, clearer, and more
fun, but the basic shape should stay the same.
