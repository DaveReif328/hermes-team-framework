#!/bin/bash
# dag-run.sh — Execute ready DAG steps
# Usage: ./scripts/dag-run.sh

set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DAG="$PROJECT_DIR/workflows/dag.yaml"
STATE="$PROJECT_DIR/.context/state.json"

echo "DAG Runner for: $PROJECT_DIR"
echo "DAG: $DAG"
echo "State: $STATE"
echo ""
echo "TODO: Implement DAG execution loop:"
echo "  1. Read dag.yaml, find steps with status=pending and all deps satisfied"
echo "  2. Spawn agents for each ready step in parallel"
echo "  3. Wait for completion"
echo "  4. Update state.json"
echo "  5. Repeat until all done"
