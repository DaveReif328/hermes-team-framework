#!/bin/bash
# health-check.sh — Verify project state
# Usage: ./scripts/health-check.sh

set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "Health Check: $PROJECT_DIR"
echo ""

# Check directories
for dir in "workflows" "config" "kb" "agents" ".context"; do
  if [[ -d "$PROJECT_DIR/$dir" ]]; then
    echo "✓ $dir/"
  else
    echo "✗ $dir/ — MISSING"
  fi
done

echo ""
echo "Agent state files:"
if [[ -d "$PROJECT_DIR/.context/pool" ]]; then
  ls "$PROJECT_DIR/.context/pool/" 2>/dev/null || echo "  (empty)"
else
  echo "  .context/pool/ MISSING"
fi

echo ""
echo "DAG state:"
if [[ -f "$PROJECT_DIR/.context/state.json" ]]; then
  echo "  state.json exists"
else
  echo "  state.json MISSING"
fi

echo ""
echo "Ready to work."
