#!/bin/bash
# hermes-team-ctl — PIDfile-based supervisor for team agent gateways
# start/stop/restart/status all team agents
#
# This script manages the Hermes team agent gateways independently of systemd.
# Use this for manual operations or environments without systemd.
#
# For systemd-based systems, individual service files are in ./systemd/

set -e

HERMES_BASE="/root/.hermes"
PIDDIR="/run/hermes-team"
LOGDIR="/var/log/hermes-team"
SUPERVISE_DIR="$HERMES_BASE/team/supervise"

# Agent port map — update when agents are added/removed
AGENTS="alif:8648 billy:8652 chase:8647 korg:8646 lathrop:8651 satya:8649 shel:8643 shoshin:8644 woz:8650 yuval:8645"

mkdir -p "$PIDDIR" "$LOGDIR" "$SUPERVISE_DIR"

HERMES_BIN=$(which hermes 2>/dev/null || echo "$HERMES_BASE/hermes-agent/venv/bin/hermes")

start_agent() {
    local name=$1 port=$2
    local pidfile="$PIDDIR/$name.pid"
    local logfile="$LOGDIR/$name.log"

    if [[ -f "$pidfile" ]] && kill -0 "$(cat "$pidfile")" 2>/dev/null; then
        echo "  $name: already running (PID $(cat $pidfile))"
        return 0
    fi

    echo "  Starting $name (port $port)..."
    cd "$HERMES_BASE"
    nohup hermes -p "$name" gateway run >> "$logfile" 2>&1 &
    echo $! > "$pidfile"

    for i in $(seq 1 15); do
        nc -z 127.0.0.1 "$port" 2>/dev/null && { echo "  $name: UP (port $port)"; return 0; }
        sleep 1
    done
    echo "  WARNING: $name may have failed to start — check $logfile"
}

stop_agent() {
    local name=$1
    local pidfile="$PIDDIR/$name.pid"
    if [[ -f "$pidfile" ]]; then
        pid=$(cat "$pidfile")
        if kill -0 "$pid" 2>/dev/null; then
            kill "$pid" 2>/dev/null && echo "  Stopped $name (PID $pid)"
            rm -f "$pidfile"
        else
            rm -f "$pidfile"
        fi
    fi
}

status_agent() {
    local name=$1 port=$2
    local pidfile="$PIDDIR/$name.pid"
    if [[ -f "$pidfile" ]] && kill -0 "$(cat "$pidfile")" 2>/dev/null; then
        nc -z 127.0.0.1 "$port" 2>/dev/null \
            && echo "  $name: UP (port $port, PID $(cat $pidfile))" \
            || echo "  $name: STALE (PID $(cat $pidfile) but port $port not listening)"
    else
        echo "  $name: DOWN"
    fi
}

CMD="${1:-status}"

case "$CMD" in
    start)
        echo "Starting all hermes team agents..."
        for entry in $AGENTS; do
            name="${entry%%:*}"; port="${entry##*:}"
            start_agent "$name" "$port"
        done
        ;;
    stop)
        echo "Stopping all hermes team agents..."
        for entry in $AGENTS; do
            name="${entry%%:*}"
            stop_agent "$name"
        done
        ;;
    restart)
        "$0" stop; sleep 2; "$0" start
        ;;
    status)
        echo "Hermes team agent status:"
        for entry in $AGENTS; do
            name="${entry%%:*}"; port="${entry##*:}"
            status_agent "$name" "$port"
        done
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        ;;
esac
