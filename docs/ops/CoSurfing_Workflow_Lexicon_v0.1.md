# CoSurfing workflow lexicon v0.1

This lexicon names the rhythm of AI plus human work in CoSuite.

## Cycles, sets, waves

- Cycle or round  
  One complete back and forth: human prompt, AI reply with CoBlocks, PS7 CoPong, and any repo changes that land.

- Set (CoSet)  
  A cluster of cycles aimed at one coherent outcome, for example "fix the profile README" or "seed CoPermanence docs".

- Wave (CoWave)  
  A set that produces clearly packaged artifacts such as scripts, markdown, and a pull request.  
  CoWaves are where CoStatusCloud usually ticks forward.

- MegaWave  
  A heavy CoWave that deliberately pushes limits, to test BPOE, capacity and CoBloat thresholds.  
  Typical pattern:
  - bundle scripts and docs,
  - run them locally,
  - open a branch and PR,
  - squash merge when CoAudit and human review pass.

## VibeSurfing and CoVibeSurfing

- VibeSurfing  
  The general idea of riding flows of work and information with least effort, like a surfer using the wave instead of fighting it.

- CoVibeSurfing  
  The CoCivium specific version of VibeSurfing.  
  Humans and AIs share:
  - CoBlocks as paddling strokes,
  - CoSets as wave sets,
  - CoWaves and MegaWaves as the big rides where repos actually change.

The teaching story is:

> We do not want users to feel trapped in dry process.  
> We want them to feel like CoSurfers who can read conditions, pick waves, and ride them without drowning in detail.

## CoStatus hooks

- CoStatusCloud reports how the waves are doing at the shared level:
  - repo health,
  - CI,
  - advice inbox,
  - MegaWave counters,
  - usage metrics where available.

- CoStatusLocal reports how the local beach is doing:
  - PS7 profile fit,
  - local repo cleanliness,
  - startup noise,
  - scratchpad hygiene.

CoStatusLocal is a grade for the environment, not for the person.

## CoBlock and DO block format

To make CoPingPong easier to read in PS7, CoBlocks follow this pattern:

```powershell
# [NN] ███ DO <BlockName>
Write-Host ""
Write-Host ""
Write-Host ""

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

# body

# /DO
Rules:

Header is a comment so it shows in green and scrolls well.

NN is a two digit sequence within the current set.

Use three or more block characters for visual impact if desired.

The three Write-Host "" lines give automatic vertical spacing when this is the first block in a cycle.

For mid cycle CoBlocks the user may delete those three lines before running if they want a tighter log.

This format aligns with the CoStyle guide and makes CoPingPong scanning easier.
