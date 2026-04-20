# Agent Team Framework

A template for building a multi-agent coordination framework on Claude/Hermes. Use this to create your own team with your own agents, your own workflows, and your own projects.

---

## What This Is

This is a pattern repository. It shows you how to:
- Build agent personas with distinct analytical perspectives
- Structure agent interactions so they produce genuine multi-perspective analysis
- Create knowledge bases that give agents context
- Define internal commands and cron job patterns
- Deploy the framework on a new Hermes install

This is not a pre-built team. The agents in this repo are templates showing the pattern — not the agents themselves. Use the pattern to build agents that fit your work.

---

## The Framework Pattern

A productive agent team has these properties:

1. **Agents have distinct perspectives** — not just different topics, different ways of thinking. One challenges assumptions, one finds historical patterns, one ranks competitive options, one models economics, one synthesizes. The diversity is the point.

2. **Agents don't duplicate** — each agent's perspective is unique. If two agents would give the same answer to the same problem, one of them isn't adding value.

3. **Disagreement is data** — when agents disagree, that's information, not a problem to resolve. Surface the disagreement and let it inform the decision.

4. **Synthesis comes last** — the synthesizer doesn't add analysis, they integrate analysis. They find where agents agree and where they conflict, and produce a conclusion that accounts for both.

5. **Agents are named for what they do** — not abstract concepts. Name your agents by their function: Practitioner, Historian, Synthesizer. Or name them after people whose thinking you want to capture.

---

## Quick Start

1. **Clone into your Hermes configuration** — typically `~/.hermes/`
2. **Read AGENTS.md** — understand the pattern for building agent teams
3. **Copy `templates/project/`** to start a new project (`cp -r templates/project ~/.hermes/team/projects/your-project`)
4. **Define your agents** — copy `agents/TEMPLATE-*.md` files and fill in specifics
5. **Create your knowledge bases** — use `knowledge-bases/TEMPLATE.md` as the pattern
6. **Deploy** — run `deploy/setup.sh` on your target Hermes install

---

## Directory Structure

```
hermes-team-framework/
├── README.md              — This file
├── AGENTS.md              — Pattern for building your agent team
├── SKILLS.md              — Skills framework (capability taxonomy)
├── SCRIPTS.md             — Operational scripts reference
├── CHANGELOG.md           — Version history
│
├── agents/
│   ├── TEMPLATE-skills.md — Pattern for a SKILL.md file
│   ├── TEMPLATE-overview.md — Pattern for agent overview
│   └── TEMPLATE-memory.md   — Pattern for agent memory
│
├── templates/
│   ├── project/           — Ready-to-copy project scaffold
│   │   ├── project.yaml    — Agent roster and config
│   │   ├── SOUL.md         — Project identity
│   │   ├── workflows/      — DAG task definitions
│   │   ├── scripts/        — dag-run.sh, health-check.sh
│   │   ├── config/         — delegation.yaml, profiles.yaml
│   │   ├── kb/             — Project knowledge base files
│   │   ├── agents/         — Agent skill files
│   │   └── .context/       — Pool, artifacts, decisions
│   │
│   └── job-template.md     — Cron job pattern
│
├── knowledge-bases/
│   └── TEMPLATE.md        — Pattern for project knowledge bases
│
├── commands/
│   └── INTERNAL.md        — Internal command conventions
│
├── cron/
│   └── example-jobs.yaml  — Example job configurations
│
├── learning/
│   └── agent-tuning-notes.md — Patterns that work, anti-patterns
│
└── deploy/
    └── setup.sh           — Deploy script template
```

---

## The Project Scaffold (`templates/project/`)

Copy this entire directory to start a new project:

```bash
cp -r templates/project ~/.hermes/team/projects/your-project-name
```

Then customize:
- `project.yaml` — add your agents, their roles, API ports
- `SOUL.md` — define your project's identity and goals
- `workflows/dag.yaml` — define tasks and dependencies
- `kb/` files — fill in your project specifics
- `agents/` — copy TEMPLATE-skills.md for each agent

The `scripts/health-check.sh` verifies the scaffold is complete.

---

## What to Customize

| File | What to change |
|------|---------------|
| `agents/*-TEMPLATE*.md` | Copy to new name, fill in your agent specifics |
| `templates/project/project.yaml` | Add your agent roster, API ports, capabilities |
| `templates/project/SOUL.md` | Define your project identity |
| `knowledge-bases/TEMPLATE.md` | Rename for your project, fill in context |
| `cron/example-jobs.yaml` | Copy and customize for your scheduled tasks |
| `learning/agent-tuning-notes.md` | Add your own findings as you learn |

---

## Agent Communication

Agents talk to each other via `call_agent()`:

```python
from tools.call_agent_tool import call_agent
result = call_agent(agent_name='shel', goal='What tires fit a 1999 Litespeed?', max_tokens=200)
```

Or asynchronously via shared pool files:
```
.context/pool/{agent-name}.md   # each agent's current work/notes
```

---

## Version

**1.1** — Added project scaffold template (`templates/project/`), 2026-04-20.
**1.0** — Pattern version, 2026-04-14.
