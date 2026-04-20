# Changelog

## [1.1] — 2026-04-20

### Added
- `templates/project/` — complete project scaffold ready to copy and customize
  - `project.yaml` — agent roster and configuration
  - `SOUL.md` — project identity template
  - `workflows/dag.yaml` — DAG task dependency graph template
  - `scripts/dag-run.sh` + `health-check.sh` — operational scripts
  - `config/delegation.yaml` + `profiles.yaml` — config templates
  - `kb/` — 6 knowledge base files (Overview, Tasks, Agents, Artifacts, Communication, Resilience) + KB-REFERENCE
  - `.context/` — pool, artifacts, decisions, state.json
- `scripts/health-check.sh` — verifies project scaffold is complete
- Updated `README.md` with project scaffold documentation

### Changed
- README reorganized to show `templates/project/` as the primary quick-start

---

## [1.0] — 2026-04-14

### Added
- Initial release
- `AGENTS.md` — 8 agent perspective types and team-building guide
- `SKILLS.md` — skill taxonomy
- `SCRIPTS.md` — operational scripts reference
- `agents/TEMPLATE-skills.md`, `TEMPLATE-overview.md`, `TEMPLATE-memory.md` — agent templates
- `knowledge-bases/TEMPLATE.md` — KB entry template
- `commands/INTERNAL.md` — internal command conventions
- `cron/example-jobs.yaml` — job configuration examples
- `learning/agent-tuning-notes.md` — patterns and anti-patterns
- `deploy/setup.sh` — framework deploy script
