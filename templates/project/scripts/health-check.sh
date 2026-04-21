#!/bin/bash
# health-check.sh — Verify project readiness and team agent health
# Usage: ./scripts/health-check.sh
# Exit 0 if all checks pass, non-zero if any fail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "Project Health Check"
echo "===================="
echo ""

# ---------------------------------------------------------------------------
# 1. Project scaffold checks
# ---------------------------------------------------------------------------
echo "Scaffold:"
FAILED=0
for dir in workflows config kb agents .context; do
    if [[ -d "$PROJECT_DIR/$dir" ]]; then
        echo "  ✓ $dir/"
    else
        echo "  ✗ $dir/ — MISSING"
        FAILED=1
    fi
done

# ---------------------------------------------------------------------------
# 2. Agent gateway health (systemd-managed)
# ---------------------------------------------------------------------------
echo ""
echo "Team Agent Gateways:"
AGENT_PORTS="
alif:8648
billy:8652
chase:8647
korg:8646
lathrop:8651
satya:8649
shel:8643
shoshin:8644
woz:8650
yuval:8645
"

for line in $AGENT_PORTS; do
    name="${line%%:*}"
    port="${line##*:}"
    if nc -z 127.0.0.1 "$port" 2>/dev/null; then
        echo "  ✓ $name (port $port)"
    else
        echo "  ✗ $name (port $port) — DOWN"
        FAILED=1
    fi
done

# ---------------------------------------------------------------------------
# 3. Context state
# ---------------------------------------------------------------------------
echo ""
echo "Context state:"
if [[ -f "$PROJECT_DIR/.context/state.json" ]]; then
    echo "  ✓ state.json exists"
else
    echo "  ✗ state.json MISSING"
    FAILED=1
fi

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
echo ""
if [[ $FAILED -eq 0 ]]; then
    echo "All checks passed. Ready to run."
else
    echo "WARNING: Some checks failed."
    echo ""
    echo "To bring agents up:"
    echo "  systemctl start hermes-team.target    # systemd"
    echo "  /usr/local/bin/hermes-team-ctl start  # manual"
fi

exit $FAILED
