# CoEmergence Harness (v1)

This harness is used to run repeatable experiment windows that probe for
emergent structure in AI behavior. It supports multiple concurrent
evolution lines:

- ProbeEvo (01): evolve prompts and scenarios.
- HarnessEvo (02): evolve metrics and rubrics.
- ProtocolEvo (03): evolve loop and window structure.
- PopulationEvo (04): evolve which models/agents we test.
- MetaTheoryEvo (05): evolve our theory of emergence.

## Windows

Each experiment window should create a new folder under:

  windows/CoEmergence_Window_YYYYMMDDTHHMMSSZ/

with at least:

- window_meta.md
- prompts_used.md (or link to a tracked prompt set)
- rubric_used.md (or link)
- transcript.md
- notes.md (including any discovery potential observations)

