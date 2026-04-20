# **Last Updated:** YYYY-MM-DD

# Communication Pattern

## Communication Level: L1

Agents use **L1 Shared Memory** — agents write to `.context/pool/{name}.md`, peers read from there.

## Coordination Options

### Direct Call
```
call_agent(goal="...", agent_name="agent-name")
```
Immediate response, one-shot question.

### Shared Pool
```
.context/pool/agent1.md   # agent1's current work/notes
.context/pool/agent2.md  # agent2's current work/notes
```
Async coordination — agents poll the pool.

## Shared Directories

| Directory | Purpose |
|---------- |---------|
| `.context/pool/` | Agent work pools |
| `.context/artifacts/` | Generated outputs |
| `.context/decisions/` | Decision log + rationale |
| `.context/state.json` | DAG and agent state |
| `workflows/dag.yaml` | Task dependency graph |
