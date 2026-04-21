#!/bin/bash
# install-systemd.sh — Install Hermes team agent systemd services
# Run as root on a systemd-based Linux system
#
# Usage: sudo ./install-systemd.sh
#
# This installs:
#   - /etc/systemd/system/hermes-alif.service
#   - /etc/systemd/system/hermes-billy.service
#   ... (one per agent)
#   - /etc/systemd/system/hermes-team.target
#
# After install:
#   systemctl start hermes-team.target   # start all agents
#   systemctl enable hermmes-team.target  # auto-start on boot

set -e

AGENTS="alif billy chase korg lathrop satya shel shoshin woz yuval"
SYSTEMD_DIR="/etc/systemd/system"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing Hermes team agent systemd services..."

for agent in $AGENTS; do
    sed "s/%i/$agent/g" "${SCRIPT_DIR}/hermes-agent@.service" > "$SYSTEMD_DIR/hermes-$agent.service"
    echo "  Created hermes-$agent.service"
done

cp "${SCRIPT_DIR}/hermes-team.target" "$SYSTEMD_DIR/hermes-team.target"
echo "  Created hermes-team.target"

systemctl daemon-reload
echo ""
echo "Installed. Next steps:"
echo "  systemctl start hermes-team.target    # start all agents now"
echo "  systemctl enable hermes-team.target   # start on boot"
echo "  systemctl status hermes-team.target    # check status"
