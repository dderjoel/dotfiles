#!/bin/bash
set -o vi

# start the networkmanager and ethernetconnection
systemctl start NetworkManager.service 
ip link set enp0s25 up

source ~/.bash_aliases
