# Hermes Team Scripts Reference

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
