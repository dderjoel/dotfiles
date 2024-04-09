#!/usr/bin/env bash

set -e
pushd "$(dirname "${0}")"
../common-scripts/link.sh ~/.config/xsettingsd xsettingsd.conf dark

killall -HUP xsettingsd
