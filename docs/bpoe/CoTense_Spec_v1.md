# CoTense v1

CoTense is the standard way to describe the time and verification state of any asset or work item.

## States

- `CoStub`  
  Default initial stub. Present at all CoCivium work starts and CoAnchor drags.

- `CoDoing`  
  In progress, not yet ready for reuse.

- `CoDone`  
  Functionally complete but not yet verified by independent routes.

- `CoDoneVerified`  
  Complete and verified through at least one external path, such as:
  - PS7 DO block run and checks ok.
  - Direct repo view via CoIndex or CoGbxx trail.
  - CI or other automated checks.

- `CoPotential`  
  Idea, ambition, or option path (backlog, CoMetaTrain items, CoAmbitions, etc).

## Levels of use

- Session-level (CoSession header).
- Bundle-level (session footer or Advice bundle footer).
- Asset-level (file comments, front-matter, or metadata).

## Example per-file comment

- `# CoTense: CoDoing`
- `# CoTense: CoDoneVerified`
