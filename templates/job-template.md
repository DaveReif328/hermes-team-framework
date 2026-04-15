# Hermes Job Template

Standard template for defining jobs within the Hermes Team Framework.

---

## Job Definition

**Job Name:** `{{JOB_NAME}}`

**Job ID:** `{{JOB_ID}}`

**Version:** `{{VERSION}}`

**Created:** `{{DATE}}`

**Last Modified:** `{{DATE}}`

**Owner:** `{{OWNER}}`

**Agent Assignment:** `{{ASSIGNED_AGENT}}`

---

## Overview

### Purpose
[Clear, concise statement of what this job accomplishes]

### Scope
[What is included in this job]
[What is explicitly excluded]

### Trigger Type
- [ ] **Scheduled**: Cron expression: `{{CRON_EXPRESSION}}`
- [ ] **Manual**: Triggered by `{{TRIGGER_SOURCE}}`
- [ ] **Event-Based**: Triggered by `{{EVENT_NAME}}`
- [ ] **Dependency**: After job `{{DEPENDENT_JOB_ID}}` completes

---

## Job Steps

### Step 1: `{{STEP_NAME}}`

**Purpose:** [What this step does]

**Action:** [Specific commands or operations]

**Expected Duration:** [time estimate]

**Failure Handling:** [what to do on failure]

```
# Step 1 commands
{{COMMAND_OR_SCRIPT}}
```

### Step 2: `{{STEP_NAME}}`

**Purpose:** [What this step does]

**Action:** [Specific commands or operations]

**Expected Duration:** [time estimate]

**Failure Handling:** [what to do on failure]

```
# Step 2 commands
{{COMMAND_OR_SCRIPT}}
```

### Step N: `{{STEP_NAME}}`

[Additional steps as needed]

---

## Input Specification

### Required Inputs
| Input | Type | Source | Validation |
|-------|------|--------|------------|
| `{{INPUT_NAME}}` | `{{TYPE}}` | `{{SOURCE}}` | `{{RULE}}` |

### Optional Inputs
| Input | Type | Default | Description |
|-------|------|---------|-------------|
| `{{INPUT_NAME}}` | `{{TYPE}}` | `{{DEFAULT}}` | `{{DESCRIPTION}}` |

### Environment Variables
| Variable | Required | Value | Description |
|----------|----------|-------|-------------|
| `{{VAR_NAME}}` | Yes/No | `{{VALUE}}` | `{{DESCRIPTION}}` |

---

## Output Specification

### Primary Outputs
| Output | Destination | Format |
|--------|-------------|--------|
| `{{OUTPUT_NAME}}` | `{{DESTINATION}}` | `{{FORMAT}}` |

### Side Effects
- [Side effect 1]
- [Side effect 2]

### Artifacts
- `{{ARTIFACT_PATH}}`: [Description]
- `{{ARTIFACT_PATH}}`: [Description]

---

## Success Criteria

### Completion Conditions
- [ ] Criterion 1: [specific measurable outcome]
- [ ] Criterion 2: [specific measurable outcome]
- [ ] Criterion 3: [specific measurable outcome]

### Quality Gates
| Gate | Threshold | Verification |
|------|-----------|--------------|
| `{{GATE_NAME}}` | `{{THRESHOLD}}` | `{{VERIFICATION_METHOD}}` |

---

## Failure Handling

### Retry Policy
- **Max Retries:** `{{MAX_RETRIES}}`
- **Retry Delay:** `{{DELAY_BETWEEN_RETRIES}}`
- **Backoff Strategy:** `{{EXPONENTIAL|FIXED}}`

### Rollback Procedure
```
1. [Rollback step 1]
2. [Rollback step 2]
3. [Rollback step 3]
```

### Notification
- **On Failure:** Notify `{{NOTIFICATION_TARGET}}`
- **On Success:** [ ] Yes [ ] No
- **Channels:** `{{EMAIL|WEBHOOK|PAGERDUTY|etc}}`

---

## Monitoring

### Health Checks
- **Liveness:** `{{ENDPOINT_OR_CHECK}}`
- **Readiness:** `{{ENDPOINT_OR_CHECK}}`

### Metrics
| Metric | Type | Alert Threshold |
|--------|------|------------------|
| `{{METRIC_NAME}}` | `{{GAUGE|COUNTER|HISTOGRAM}}` | `{{VALUE}}` |

### Logging
- **Log Level:** `{{DEBUG|INFO|WARN|ERROR}}`
- **Log Destination:** `{{PATH|SEVICE}}`
- **Retention:** `{{DURATION}}`

---

## Dependencies

### External Services
| Service | Required | Connection | Health Check |
|---------|----------|------------|--------------|
| `{{SERVICE}}` | Yes/No | `{{CONNECTION_STRING}}` | `{{HEALTH_ENDPOINT}}` |

### File Dependencies
- `{{FILE_PATH}}`: [Purpose]
- `{{FILE_PATH}}`: [Purpose]

### Job Dependencies
| Job ID | Dependency Type | Required |
|--------|-----------------|----------|
| `{{JOB_ID}}` | `{{blocks|feeds|precedes}}` | Yes/No |

---

## Security Considerations

### Access Control
- **Execution Role:** `{{ROLE_NAME}}`
- **Permissions:** [Specific permissions needed]
- **Secrets:** [Secret management approach]

### Data Handling
- **Classification:** `{{PUBLIC|INTERNAL|CONFIDENTIAL|RESTRICTED}}`
- **Encryption:** [At rest / In transit / Both / None]
- **PII Handling:** [Yes / No - procedures if yes]

### Audit Trail
- [ ] All executions logged
- [ ] Input/outputs recorded
- [ ] Changes tracked

---

## Configuration

### Environment-Specific Settings

**Development:**
```yaml
{{KEY}}: {{VALUE}}
```

**Staging:**
```yaml
{{KEY}}: {{VALUE}}
```

**Production:**
```yaml
{{KEY}}: {{VALUE}}
```

---

## History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | {{DATE}} | {{AUTHOR}} | Initial version |

---

## Related Documentation

- [Related Job](../cron/{{JOB_FILE}}) - [Relationship]
- [Runbook](../runbooks/{{RUNBOOK}}) - [Purpose]
- [Architecture](../docs/{{ARCH_DOC}}) - [Context]

---

*Template Version: 1.0*
*Hermes Team Framework*
