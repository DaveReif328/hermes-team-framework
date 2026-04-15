# Skills Framework

A skill in the Hermes context is a reusable capability that can be attached to a cron job or loaded on demand. Skills provide the agent with domain-specific knowledge and operational patterns.

---

## What a Skill Is

A skill is:
- A directory under `~/.hermes/skills/` or embedded in a KB
- A set of instructions and references the agent loads when the skill is triggered
- A way to give the agent context without having to rebuild it from scratch each time

Skills are not agents. An agent is a perspective (creative, financial, etc.). A skill is a knowledge domain (markdown-kb, fresh-aire, etc.). Skills give the agent information; agents give the agent thinking modes.

---

## Skill Structure

A skill directory contains:

```
skill-name/
├── SKILL.md              — The skill definition (required)
├── references/          — Supporting files (optional)
│   ├── api.md            — API documentation, patterns
│   ├── commands.md       — Specific commands this skill uses
│   └── examples/         — Example outputs, templates
├── scripts/             — Executable scripts (optional)
│   └── run.sh            — Script called by the skill
└── templates/           — Reusable templates (optional)
    └── output.md         — Output format templates
```

---

## SKILL.md Format

Every skill needs a `SKILL.md` with:

```yaml
---
name: [skill-name]
description: [one line on what this skill does]
version: 1.0
last_updated: [YYYY-MM-DD]
---
```

**Sections:**
1. **What this skill does** — specific domain, what it knows
2. **When to load this skill** — triggers, use cases
3. **How to use it** — operational pattern
4. **Output format** — what this skill produces
5. **Pitfalls** — common mistakes, what to avoid
6. **References** — what files in this skill are available

---

## Skill Taxonomy

### Information Skills
Provide the agent with domain knowledge. Examples: market research, competitive intelligence, product documentation.

### Operational Skills
Give the agent patterns for performing specific tasks. Examples: markdown-kb (how to build a knowledge base), fresh-aire (Microsoft Copilot ecosystem monitoring).

### Integration Skills
Connect the agent to external systems. Examples: homeassistant (control smart home), email (send/receive), github (repo management).

---

## Building a New Skill

1. **Identify the gap** — what does the agent need to know that isn't in their KB?
2. **Define the trigger** — when should this skill load?
3. **Write the SKILL.md** — be specific about what it knows and how to use it
4. **Add references** — supporting docs, examples, templates
5. **Test it** — load the skill and verify it produces what's expected

---

## Attaching Skills to Cron Jobs

When you create a cron job, you can attach skills:

```
skill: fresh-aire     # Single skill
skills: [fresh-aire, markdown-kb]  # Multiple skills
```

The skill loads at job start, giving the agent domain context before the job runs.

---

## Skill vs. Agent

| Aspect | Agent | Skill |
|--------|-------|-------|
| What it provides | Thinking mode / perspective | Knowledge domain |
| Loaded | On demand via delegation | Attached to job or loaded explicitly |
| Purpose | Analyze, challenge, evaluate | Inform, execute, integrate |
| Example | "Ask Shoshin to challenge the assumptions" | "Load fresh-aire for Microsoft Copilot news" |

---

*For use with the Hermes Team Framework pattern*