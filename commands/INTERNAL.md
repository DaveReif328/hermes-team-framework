# Internal Commands

Custom commands that extend the Hermes agent's functionality. Internal commands are simple phrases you can say in a session to trigger specific behaviors.

---

## How Internal Commands Work

Internal commands are triggered by a single word or phrase in your message. When you use one, the agent interprets it as a request to perform a specific operational action rather than a conversational response.

**Format:** Just say the command word in your message. The agent recognizes it and executes the associated action.

---

## refresh

**What it does:**
1. Detects the most recent project from conversation context
2. Compacts the session — replaces raw history with a compressed summary
3. Refreshes memory for the detected project — searches past sessions for relevant context, updates memory with current state

**When to use it:**
- At the start of a new session
- When you want to ensure memory is current for the project you're working on
- After a long session before ending

**Usage:**
```
refresh
```

**Result:** Takes about 30 seconds. The agent handles compaction and memory refresh silently.

---

## Adding Custom Commands

To add a new internal command:

1. **Define the trigger** — a single word or short phrase
2. **Define the action** — what the agent should do when triggered
3. **Document it** — add it to this file so you remember it exists

Example custom command structure:

```markdown
## mycommand

**What it does:** [Description]

**When to use it:** [Triggers]

**Usage:**
```
mycommand
```

**What happens:** [Step-by-step what occurs]
```

---

## Command Naming Guidelines

- Use lowercase, single words when possible
- Avoid commands that might appear in normal conversation
- Make the command name clearly distinct from regular vocabulary
- Document clearly what the command does so you remember to use it

---

## Managing Internal Commands

Internal commands live in this file. As you build more custom behaviors, add them here so you have a single reference point for what commands exist and what they do.

---

*For use with the Hermes Team Framework pattern*