#!/usr/bin/env bash

batConfigFile=~/.config/bat/config
# bat (cat replacement)
sed --in-place --expression 's/Solarized (dark)/Solarized (light)/g' "${batConfigFile}"
