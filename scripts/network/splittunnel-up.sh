#!/bin/bash

# This script parses the default route and replaces the metric of 600 to 42

echo "VPN connection established."

set -e # die on error

openvpn_rule=$(ip route | awk '/default/ && /metric 600/')

if [[ -n "${openvpn_rule}" ]]; then
  # parse parts into array
  read -ra rule <<<"${openvpn_rule}"
  # delete old rule
  sudo ip route delete "${rule[@]}"
  # change metric
  rule[-1]=42
  # add new rule
  sudo ip route add "${rule[@]}"

fi
