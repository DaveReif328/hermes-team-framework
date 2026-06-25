# Changelog

## [1.3] — 2026-06-25

### Changed
- `AGENTS.md` — Woz promoted from footnote (#8) to first-class perspective type alongside the other seven
- `AGENTS.md` — port map updated to 10 agents: added `8650=woz`, `8651=lathrop`, `8652=billy`
- `AGENTS.md` — standard pipeline now includes Woz as step 5 between Financial and Synthesizer
- `AGENTS.md` — added "Don't ship engineering claims without Woz" anti-pattern
- `AGENTS.md` — added "Engineering + Evaluative" pair row to pairing table
- `learning/agent-tuning-notes.md` — appended operational lessons from April→June (kything, PAT rotation, subagent 401, dream KB, port-binding fallback)
- `templates/job-template.md` — header note redirecting to the `cronjob` tool as source of truth; template kept for reference only

### Pointers (no file changes)
- `deploy/setup.sh` — historical; the active pattern is the `hermes-team-agent-systemd-setup` skill, not this script
- `commands/INTERNAL.md` — superseded by the `team-agent-call`, `kything-prototype`, and `memory-source-attribution` skills
- New perspectives beyond the eight listed (e.g. domain-specific agents like Alif for KB building) are out of scope for this repo

### Notes
- This is a **doc-only** release. No code or schema changes.
- Repo remains a *pattern repository*. It documents the framework shape; your installed agents and skills are the source of truth for current operation.

## [1.2] — 2026-04-21

### Added
- `deploy/systemd/` — systemd service files for auto-start and restart-on-failure
  - `hermes-agent@.service` — template service unit (one per agent)
  - `hermes-team.target` — groups all agents together
  - `hermes-team-ctl.sh` — PIDfile-based supervisor for non-systemd environments
  - `install.sh` — standalone install script
- `deploy/systemd/install_systemd_services()` added to `deploy/setup.sh`
- `templates/project/scripts/health-check.sh` now verifies agent gateway ports are up

### Changed
- Updated `README.md` with systemd auto-start instructions

### Fixed
- Team agent gateways no longer fail silently after session restart

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