#!/usr/bin/env bash

set -e
pushd "$(dirname "${0}")"

../common-scripts/link.sh ~/.config/i3 theme.config light

i3-msg reload
