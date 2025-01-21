#!/bin/bash

# This script parses all default routes, and if our own is present (metric 42) it'll be removed.

set -e # die on error

echo "VPN connection shut down."

ownRule=$(ip route | awk '/default/ && /metric 42/')

if [[ -n "${ownRule}" ]]; then
  # parse parts into array
  read -ra rule <<<"${ownRule}"
  # delete own rule
  sudo ip route delete "${rule[@]}"
fi
