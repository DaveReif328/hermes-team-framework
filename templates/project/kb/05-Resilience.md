# **Last Updated:** YYYY-MM-DD

# Failure Recovery

## Retry Policy

Before declaring a task failed, try:
1. **Immediate retry** — transient error
2. **Wait 60s, retry** — timeout or temporary unavailability
3. **Wait 5m, retry** — resource contention

After 3 failures → mark as `blocked` and notify.

## Task Timeout

- Simple tasks: 5 minutes
- Research tasks: 15 minutes
- Complex tasks: 30 minutes

## If an Agent Goes Offline

1. Check `agents/{name}/state.json` — last heartbeat
2. Move their pending tasks back to `queue.yaml` (status: pending)
3. Attempt to reassign

## Dead Letter

Tasks that fail after all retries go to:
```
.context/artifacts/dead-letter/{task-id}.md
```

Include: original task, all error messages, what was tried.

## Panic Button

If the project gets stuck:
1. Wipe `.context/pool/` (move to `archive/`)
2. Reset all `in_progress` tasks to `pending`
3. Restart inbox polling
