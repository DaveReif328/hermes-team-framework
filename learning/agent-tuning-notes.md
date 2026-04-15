# Agent Tuning Notes

A pattern for documenting what you learn about your agent team as you operate it. This is a living document — add entries as you discover what works, what doesn't, and how to improve coordination patterns.

---

## Why Keep Tuning Notes

Agent teams don't come fully optimized. You'll discover things through operation that you couldn't predict at design time:
- Which agent combinations produce better outputs
- Which configurations work for which problem types
- Where agents tend to converge too fast or miss perspectives
- How to frame requests to get better agent responses

Without documented tuning notes, you rediscover the same lessons every session. With them, you build institutional knowledge.

---

## The Tuning Log

Keep a running log of changes and their effects:

```
| Date | What changed | Why | Observed effect | Notes |
```

Update this after any significant adjustment to prompts, configurations, or agent definitions.

---

## What to Track

### 1. Prompt Calibrations

When you adjust how you frame requests to an agent:

```
**Change:** [What you added or modified]
**Agent:** [Which agent]
**Context:** [The problem type where this mattered]
**Result:** [What happened vs. what you expected]
```

Example:
```
**Change:** Added framing: "Remember this is a new problem space, not a familiar one"
**Agent:** Creative/Lateral agent
**Context:** When exploring unfamiliar territory
**Result:** More genuinely challenging assumptions, less default to convention
```

### 2. Configuration Discoveries

When you find a team configuration that works well:

```
**Configuration:** [Name or description of the configuration]
**Problem type:** [What this works best for]
**Why it works:** [The mechanism — what's happening that produces good output]
**Example use:** [When you've used this successfully]
```

Example:
```
**Configuration:** Two-wave debate
**Problem type:** When the team converges too quickly
**Why it works:** Wave 1 produces initial positions. Wave 2 has a random agent 
                 challenge the synthesis. The challenge forces revision.
**Example use:** C1 competitive analysis — prevented false consensus on 
                market entry decision
```

### 3. Anti-Patterns

When something doesn't work:

```
**Anti-pattern:** [Description]
**Problem type:** [When this tends to occur]
**What happens:** [What goes wrong]
**Correction:** [What to do instead]
```

Example:
```
**Anti-pattern:** Parallel first, then synthesize
**Problem type:** When agents have very different expertise levels
**What happens:** Stronger agents anchor the discussion; weaker agents defer
**Correction:** Run agents sequentially when expertise asymmetry is high
```

### 4. Pair Effectiveness

Which agent combinations work well:

```
| Agent A | Agent B | Works well for | Less effective for |
```

Document combinations that produce genuine multi-perspective analysis vs. combinations that tend to converge.

---

## Configuration Patterns That Work

These are reusable team configurations — copy and adapt for your own agents.

### Sequential Pipeline
**Flow:** Agent 1 → Agent 2 → Agent 3 → ... → Synthesizer

**Best for:** Problems where each layer builds on the previous. Linear clarity, traceable reasoning.

**Don't use when:** You need agents to challenge each other, not just add layers.

### Parallel + Synthesize
**Flow:** [Agent A + Agent B] in parallel → [Agent C + Agent D] in parallel → Synthesizer

**Best for:** When the problem has two distinct analytical phases (situation analysis + solution evaluation).

**Don't use when:** Agents need to see each other's outputs before producing their own.

### Debate Mode
**Flow:** Agent A and Agent B produce independent takes → explicitly challenge each other → Evaluator judges → Financial models → Synthesizer

**Best for:** When the team might converge too fast. The challenge forces both agents to defend or revise.

**Don't use when:** The problem is time-sensitive. Debate takes longer than pipeline.

### Adversarial Review
**Flow:** Agent A produces → Agent B challenges → Agent C challenges → each revises → Synthesizer

**Best for:** When a strong initial take might unchallenged dominate the discussion.

**Don't use when:** You have fewer than 4 agents. Adversarial needs critical mass to work.

### Self-Correction Loop
**Flow:** Full team → Synthesizer → agents revise based on synthesis → Synthesizer final

**Best for:** When the first pass produces something close but not quite right.

**Don't use when:** The problem is already well-solved. Self-correction on good outputs produces noise.

### Straw Man Build
**Flow:** Creative builds → Historian tears down → Evaluator rebuilds → Financial validates → Synthesizer

**Best for:** When you need to stress-test an initial plan. The straw man exists to be destroyed.

**Don't use when:** The team is already skeptical of the initial plan. Straw man adds noise.

---

## Agent Addition Patterns

When you discover you need a new perspective (gaps in coverage):

**Step 1:** Name the gap specifically — what does this agent see that the current team misses?

**Step 2:** Define the perspective type:
- Creative/Lateral — challenges assumptions
- Historical/Contextual — patterns from precedent
- Evaluative/Competitive — ranks options
- Financial/Analytical — models economics
- Practitioner/Operational — deal/channel reality
- Legal/Risk — exposure assessment
- Engineering/Technical — correctness vs. impressiveness

**Step 3:** Write the agent definition using templates in `agents/`.

**Step 4:** Test the new agent against the problems where the gap existed.

**Step 5:** Document the gap and the resolution in this file.

---

## Quality Indicators

How to tell if your team is working:

**Good signs:**
- Agents produce genuinely different perspectives on the same problem
- Disagreements are surfaced and explored, not smoothed over
- Korg's synthesis adds something the individual agents didn't say
- The team's recommendation is more accurate than any single agent's

**Warning signs:**
- Agents converge on the same answer without debate
- Korg's synthesis is just a summary of what agents said
- One agent dominates the others (their answer becomes the team's answer)
- The team produces a recommendation without genuine tension

---

## Adding Your Own Notes

When you learn something new about your team, add it here:

### Prompt Calibrations
*[Add your own prompt discoveries]*

### Configuration Discoveries
*[Add configurations that work for your problem types]*

### Anti-Patterns
*[Add what doesn't work and how you corrected it]*

### Pair Effectiveness
*[Add what agent combinations work for your team]*

---

## Template for New Entries

```markdown
**[Type]:** [Prompt calibration / Configuration / Anti-pattern / Pair]

**[Date]:** YYYY-MM-DD

**[Context]:** What problem or situation triggered this

**[Change or Observation]:** What you did or what you noticed

**[Result]:** What happened

**[Conclusion]:** What this means for how you use the team
```

---

*This document is a living record. Update it as you learn.*