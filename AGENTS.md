# Building Your Agent Team

A guide to constructing a multi-agent coordination framework for your own work. This document explains the principles and patterns for building a team that produces genuine multi-perspective analysis.

---

## The Core Idea

A useful agent team has agents with **distinct analytical perspectives** — not just different topics, different ways of thinking. When you put a problem in front of the team, each agent should see something the others miss.

The diversity is the product. If your agents would converge on the same answer without talking to each other, you have one agent, not a team.

---

## How Many Agents

**Minimum useful team: 3**
- One to generate options or challenge assumptions
- One to evaluate or provide context
- One to synthesize

**Recommended team: 5-7**
- Allows genuine multi-perspective analysis
- Enough coverage to handle complex problems
- Not so many that coordination becomes overhead

**Don't build more agents than you need.** Each agent should earn their place by seeing something the others don't.

---

## The Seven Perspective Types

These are the analytical modes that tend to produce useful diversity. You don't need all seven — pick the ones that fit your work.

### 1. Creative / Lateral (Shoshin pattern)
**What it does:** Challenges assumptions, finds patterns across domains, asks first-principles questions when the team is stuck.

**Why it matters:** Specialists get trapped by what they know. A lateral thinker enters every problem clean.

### 2. Historical / Contextual (Yuval pattern)
**What it does:** Finds patterns from what happened before, identifies causation chains, prevents repetition of past mistakes.

**Why it matters:** Most strategic mistakes have already been made by someone else. Historical context surfaces them before you repeat them.

### 3. Evaluative / Competitive (Satya pattern)
**What it does:** Ranks options using a structured framework, reads competitive dynamics, delivers verdicts.

**Why it matters:** Without ranking, you have options but no direction. Evaluation forces a decision.

### 4. Financial / Analytical (Chase pattern)
**What it does:** Models unit economics, NRR, CAC, opportunity cost. Identifies the financial assumption that would change everything if wrong.

**Why it matters:** Strategies that sound good but don't have financial support will fail. Financial analysis catches this.

### 5. Synthesizer / Integrator (Korg pattern)
**What it does:** Takes outputs from all other agents and produces an actionable conclusion. Finds where agents agree and where they conflict.

**Why it matters:** Without synthesis, you have a list of perspectives but no decision. The synthesizer turns analysis into action.

### 6. Practitioner / Operational (Lathrop pattern)
**What it does:** Knows how things actually work in the market, channel, or deal. Cuts through theory to say "here's how it actually happens."

**Why it matters:** Strategies that look good on slides and fall apart in procurement. A practitioner reads the gap.

### 7. Legal / Risk (Billy pattern)
**What it does:** Identifies legal exposure, reads contracts for the clause that will kill you, knows when to fight and when to settle.

**Why it matters:** Most teams under-weight legal risk until it becomes a crisis. Legal perspective makes the exposure visible early.

### 8. Engineering / Technical (Woz pattern)
**What it does:** Challenges whether proposed solutions actually work, finds root cause vs. symptoms, prioritizes correctness over impressiveness.

**Why it matters:** Technical complexity that isn't justified by the problem is waste. Engineering perspective keeps solutions honest.

---

## Building Your Agent

### Step 1: Define the Gap

Before creating an agent, ask: **what does this agent see that the existing team would miss?**

If you can't answer that specifically, you don't need a new agent.

### Step 2: Name the Perspective

Name your agent by their function, not an abstract concept. "Practitioner" is better than "Observer." "Historian" is better than "Researcher."

You can name agents after people whose thinking you want to capture — real historical figures, TV characters, anyone whose mental model you want to embody. But make sure the name matches the function.

### Step 3: Write the SKILL.md

Use the template in `agents/TEMPLATE-skills.md`. The key sections:
- **Role Summary** — what this agent does and why their perspective matters
- **Core Competencies** — 3-5 specific analytical capabilities with output formats
- **When to Call** — triggers, workflow position, when not to use
- **Output Format** — concrete example of what this agent produces
- **Pause Phrases** — things this agent says that mean "stop and reconsider"

### Step 4: Create the KB

Create `~/.hermes/kb/[agent-name]/00-Overview.md` using `agents/TEMPLATE-overview.md` as the pattern.

Create `~/.hermes/kb/[agent-name]/MEMORY.md` using `agents/TEMPLATE-memory.md` as the pattern.

The Overview is the identity. The Memory is the manual.

### Step 5: Register the Agent

Add the agent to `~/.hermes/agent-logs/INDEX.md` with their name, role, and one-line description.

---

## How Agents Work Together

### The Standard Pipeline

For a complex problem:

1. **Creative** challenges the problem framing
2. **Historian** grounds it in precedent
3. **Evaluator** ranks the options
4. **Financial** stress-tests the economics
5. **Synthesizer** produces the recommendation

Not every problem needs all five. Use the perspectives relevant to the question.

### Debate Configurations

For problems where the team might converge too fast:

- **Debate mode:** Two agents produce independent takes, then explicitly challenge each other. The tension is the data.
- **Adversarial mode:** One agent produces a take, others specifically challenge it. Revisions happen after challenges.
- **Self-correction loop:** Full team produces output. Synthesizer integrates. The synthesis goes back to agents for revision. Final synthesis incorporates the revision.

### Pairing Agents

Some agent combinations are particularly useful:

| Pair | Why it works |
|------|-------------|
| Practitioner + Legal | Deal reality + where it can die legally |
| Financial + Evaluative | Economics + competitive position |
| Creative + Historian | Challenge assumptions + historical precedent |
| Engineering + Synthesizer | Technical honesty + actionable conclusion |

---

## Anti-Patterns

**Don't build agents that would say the same thing.** If two agents converge on the same answer independently, one of them is redundant.

**Don't build agents without a trigger.** An agent that runs on everything runs on nothing. Define when this agent is useful specifically.

**Don't add agents to solve coordination problems.** If your agents can't work together well, fix the coordination, don't add more agents.

**Don't let agents validate each other.** Each agent should be skeptical of the others, not supportive. Validation loops produce false consensus.

---

## Version

**1.0** — Pattern version, 2026-04-14. Adapt for your own team.