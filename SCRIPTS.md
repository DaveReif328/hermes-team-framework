# Hermes Team Scripts Reference

> **Note (v1.3):** Some scripts in this file reference patterns that have moved to skills. See the bottom of this file for the current pointers. The `deploy/setup.sh` script in particular is historical — see the redirect at the bottom.

Operational scripts for managing the Hermes Team Framework.

## Script Categories

### 1. Deployment Scripts

**Location:** `deploy/setup.sh`

**Purpose:** Initial environment setup and configuration

**Usage:**
```bash
./deploy/setup.sh [environment] [options]
```

**Parameters:**
- `environment` - Target environment (dev|staging|prod)
- `--skip-checks` - Skip pre-flight validation
- `--verbose` - Enable detailed output

**Operations:**
- Environment variable validation
- Dependency verification
- Configuration file generation
- Agent initialization
- Health check execution

---

### 2. Cron Jobs

**Location:** `cron/jobs-configured.yaml`

**Purpose:** Scheduled task automation

**Job Categories:**

#### Health Monitoring
- Agent heartbeat verification (every 5 minutes)
- Resource utilization tracking (hourly)
- Log rotation management (daily)

#### Maintenance
- Knowledge base cleanup (weekly)
- Temporary file purge (daily)
- Certificate rotation (monthly)

#### Reporting
- Activity summary generation (daily)
- Performance metrics aggregation (hourly)
- Security scan scheduling (daily at 2 AM)

**Configuration Format:**
```yaml
jobs:
  - name: heartbeat
    schedule: "*/5 * * * *"
    script: health-check.sh
    timeout: 60
    retries: 3
```

---

### 3. Utility Scripts

**Standard Locations:**
- `scripts/` - User-facing utilities
- `internal/` - Internal coordination scripts

**Common Utilities:**

| Script | Purpose |
|--------|---------|
| `agent-status.sh` | Check agent health and availability |
| `task-queue.sh` | Manage task distribution |
| `knowledge-sync.sh` | Synchronize knowledge bases |
| `log-archive.sh` | Archive and compress logs |
| `config-validate.sh` | Validate configuration files |

---

### 4. Job Templates

**Location:** `templates/job-template.md`

**Purpose:** Standardized job definition format

**Template Structure:**
```markdown
# Job Name

## Overview
Brief description of job purpose

## Schedule
Cron expression or triggering condition

## Steps
1. Step description
2. Step description

## Success Criteria
- Criterion 1
- Criterion 2

## Rollback
Procedure if job fails
```

---

## Script Development Standards

### Requirements

1. **Shebang**: Use `#!/bin/bash` or appropriate interpreter
2. **Error Handling**: Exit on first error unless explicitly handling
3. **Logging**: Use structured logging format
4. **Documentation**: Include usage/help output
5. **Testing**: Provide test coverage

### Best Practices

```bash
# Good pattern
set -euo pipefail
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

main() {
    # Main logic
}

main "$@"
```

### Security Considerations

- Never hardcode credentials
- Validate all inputs
- Use least-privilege principles
- Log all sensitive operations
- Implement proper cleanup

---

## Cron Configuration

**File:** `cron/jobs-configured.yaml`

**Syntax:**
```yaml
version: "1.0"
timezone: "UTC"

jobs:
  - name: unique-job-name
    description: What the job does
    schedule: cron-expression
    command: path/to/script
    environment:
      VAR: value
    timeout: seconds
    retry:
      max: attempts
      delay: seconds
    notification:
      on_failure: email|webhook
      on_success: boolean
```

---

## Running Scripts

### Prerequisites

1. Scripts must be executable:
   ```bash
   chmod +x scripts/*.sh
   ```

2. Required environment variables must be set:
   ```bash
   export HERMES_ROOT=/path/to/hermes-team
   export AGENT_MODE=production
   ```

### Execution

```bash
# Run single script
./scripts/agent-status.sh

# Run with environment
AGENT_MODE=development ./scripts/task-queue.sh list

# Debug mode
bash -x ./scripts/knowledge-sync.sh
```

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Script fails silently | Run with `bash -x` for trace |
| Permission denied | Check file permissions |
| Environment missing | Source `.env` file first |
| Timeout failures | Increase timeout in config |

---

## Adding New Scripts

1. Create script in appropriate directory
2. Follow development standards
3. Add documentation to this file
4. Submit for review via PR

---

## Status of Scripts (v1.3)

| Script | Status | Use instead |
|--------|--------|-------------|
| `deploy/setup.sh` | **Historical** | `hermes-team-agent-systemd-setup` skill — installs and troubleshoots the systemd gateway target end-to-end |
| `cron/jobs-configured.yaml` (referenced in this file) | **Historical format** | The `cronjob` tool writes to `~/.hermes/cron/jobs.json`; see `templates/job-template.md` for the redirect |
| `scripts/agent-status.sh` | **Historical** | Inline: `for p in 8643..8652; do nc -z 127.0.0.1 $p 2>/dev/null && echo "UP  :$p" || echo "DOWN :$p"; done` |
| `scripts/health-check.sh` | **Active** (port-checking) | Still useful; verifies gateway ports are up before a team project |
| `deploy/systemd/*` | **Active** | Pattern is correct — `hermes-agent@.service`, `hermes-team.target`, `hermes-team-ctl.sh` are all still the standard install |

The skills superseding the historical scripts are loaded by name from `~/.hermes/skills/` — they include `hermes-team-agent-systemd-setup`, `team-agent-call`, `cron-skill-check`, and `kything-prototype`.
