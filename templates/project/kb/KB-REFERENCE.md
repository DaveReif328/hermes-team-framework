# **Last Updated:** YYYY-MM-DD

# TEAM KB Reference

Quick reference for the knowledge base structure.

## File Index

| File | Purpose |
|------|---------|
| `00-Overview.md` | Project summary, team roles, status |
| `01-Tasks.md` | Task board / sprint tracking |
| `02-Agents.md` | Agent roster and setup guide |
| `03-Artifacts.md` | Generated outputs library |
| `04-Communication.md` | How agents coordinate |
| `05-Resilience.md` | Failure handling, retry policy |

## Wiki Link Syntax

Use `[[filename|Display Name]]` for cross-references:
```
[[01-Tasks|Task Board]]
[[02-Agents|Agent Directory]]
```

## KB Conventions

- All files begin with `Last Updated:` metadata line
- Use `**bold**` for key terms on first introduction
- Checklists (`- [ ]`) for actionable items
- Tables for structured reference data

## Accessing KB From Agents

Agents read the project KB at:
```
~/.hermes/team/projects/{project-name}/kb/
```

Each agent also has their own KB at:
```
~/.hermes/kb/{agent-name}/
```
