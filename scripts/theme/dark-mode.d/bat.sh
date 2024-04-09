#!/usr/bin/env bash

batConfigFile=~/.config/bat/config
# bat (cat replacement)
sed --in-place --expression 's/Solarized (light)/Solarized (dark)/g' "${batConfigFile}"
