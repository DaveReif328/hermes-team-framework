# Agent Skill Template

Use this template to build a SKILL.md for your agent. Copy it, rename it for your agent, and fill in the specifics.

---

## YAML Frontmatter

```yaml
---
name: [agent-name]          # lowercase, hyphens
description: [one line]      # what this agent does
role: [analytical role]     # creative, historical, competitive, etc.
version: 1.0
last_updated: [YYYY-MM-DD]
---
```

---

## Section 1: Role Summary

**Role:** [The agent's function in one sentence]

[Expanded explanation of what this agent does and why their perspective matters. What do they see that other agents don't? What would the team miss without them?]

---

## Section 2: Core Competencies

### 1. [Competency Name]

**What it is:** [Plain-language explanation]

**How it works:** [The specific mental move or analytical process]

**Output:** [What this produces — be specific about format]

### 2. [Competency Name]

[same structure]

### 3. [Competency Name]

[same structure]

---

## Section 3: When to Call This Agent

**Primary triggers:**
- [When this agent is most useful — be specific]
- [What problem type calls for this perspective]

**Best position in workflow:**
- [Where in the pipeline this agent runs]
- [What should be done before and after]

**When NOT to call this agent:**
- [What would be a mistake to use this agent for]

---

## Section 4: Output Format

```
[AGENT-NAME]
[Standard output structure for this agent]
[Show a concrete example of what this agent produces]
[Be specific — this is what Korg will read during synthesis]
```

---

## Section 5: Pause Phrases

When this agent says these, stop and reconsider:

- **"[Phrase 1]"** — [what it means and why it matters]
- **"[Phrase 2]"** — [what it means and why it matters]
- **"[Phrase 3]"** — [what it means and why it matters]

---

## Section 6: Interaction With Other Agents

**Pairs well with:**
- [Agent A] — [why this combination works]
- [Agent B] — [why this combination works]

**Natural tension with:**
- [Agent C] — [the type of disagreement that emerges between them]

**Handles handoff from:**
- [Which agents typically pass work to this one]

**Passes work to:**
- [Which agents typically receive work from this one]

---

## Section 7: Anti-Patterns

Things that don't work with this agent:
- [What to avoid]
- [Common mistakes]

---

## Section 8: Building This Agent

**Persona inspiration sources:**
- [Types of people whose thinking this agent captures]
- [TV characters, historical figures, professional archetypes — or build from scratch]

**Voice characteristics:**
- [How this agent talks — tone, sentence structure, vocabulary]
- [What this agent never says]

**Known limitations:**
- [Where this agent's perspective ends]
- [What this agent doesn't do]

---

## Template Notes

This template follows the pattern used in the Hermes Team Framework. The key sections are:

1. **Role Summary** — One paragraph on function and value
2. **Core Competencies** — 3-5 specific analytical capabilities with output formats
3. **When to Call** — Triggers, workflow position, when not to use
4. **Output Format** — Concrete example of the agent's standard output
5. **Pause Phrases** — Things this agent says that mean "stop and reconsider"
6. **Interaction** — How this agent works with the rest of the team
7. **Anti-Patterns** — What doesn't work with this agent
8. **Building Notes** — How to construct this agent's persona

The goal is a skill file that's specific enough to guide the agent's output but flexible enough to apply to the problem at hand.

---

*For use with the Hermes Team Framework pattern*