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

## The Agents Directory

The `agents/` directory contains templates for building agent SKILL.md files. Each template shows:
- The YAML frontmatter structure
- What sections an SKILL.md needs
- How to write the agent's role, competencies, output format, and pause phrases
- How to document the agent's interaction with the rest of the team

Copy a template, fill in your agent's specifics, and register it in your agent-logs INDEX.

---

## Quick Start

1. **Clone into your Hermes configuration** — typically `~/.hermes/`
2. **Read AGENTS.md** — understand the pattern for building agent teams
3. **Copy agents/ templates** — create your SKILL.md files for your roster
4. **Create your knowledge bases** — use `knowledge-bases/TEMPLATE.md` as the pattern
5. **Define your workflows** — use the configurations in `learning/agent-tuning-notes.md`
6. **Deploy** — run `deploy/setup.sh` on your target Hermes install

---

## Directory Structure

```
hermes-team/
├── README.md              — This file
├── AGENTS.md              — Pattern for building your agent team
├── SKILLS.md              — Skills framework (capability taxonomy)
├── SCRIPTS.md             — Operational scripts reference
├── agents/
│   ├── TEMPLATE-skills.md — Pattern for a SKILL.md file
│   ├── TEMPLATE-overview.md — Pattern for agent overview
│   └── TEMPLATE-memory.md   — Pattern for agent memory
├── knowledge-bases/
│   └── TEMPLATE.md        — Pattern for project knowledge bases
├── commands/
│   └── INTERNAL.md        — Internal command conventions
├── learning/
│   └── agent-tuning-notes.md  — Patterns that work, anti-patterns
├── templates/
│   └── job-template.md    — Cron job pattern
├── cron/
│   └── example-jobs.yaml  — Example job configurations
└── deploy/
    └── setup.sh           — Deploy script template
```

---

## What to Customize

When you deploy this framework for your own work:

| File | What to change |
|------|---------------|
| `agents/*-TEMPLATE*.md` | Copy to new name, fill in your agent specifics |
| `knowledge-bases/TEMPLATE.md` | Rename for your project, fill in context |
| `cron/example-jobs.yaml` | Copy and customize for your scheduled tasks |
| `learning/agent-tuning-notes.md` | Add your own findings as you learn |

---

## Version

**1.0** — Pattern version, 2026-04-14. Adapt this framework for your own agent team.