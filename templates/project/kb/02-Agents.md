# **Last Updated:** YYYY-MM-DD

# Agent Directory

## Conventions

- Copy `agents/TEMPLATE-skills.md` for each new agent
- Register new agents in `project.yaml`
- API ports must be unique — see `config/profiles.yaml`

## Agent Registry

Add agents here once created:

| Agent | Role | Profile | API Port | Capabilities |
|-------|------|---------|----------|--------------|
| | | | | |

## How to Add a New Agent

1. Copy `agents/TEMPLATE-skills.md` → `agents/{name}.md`
2. Create `~/.hermes/kb/{name}/00-Overview.md` and `MEMORY.md`
3. Register in `project.yaml` with unique API port
4. Add to `config/profiles.yaml`
5. Verify with `call_agent(agent_name='{name}', goal='Reply with your name')`
