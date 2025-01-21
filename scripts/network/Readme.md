# How to use

Add an executable script into `/etc/NetworkManager/dispatcher.d/99-splittunnel.sh`
that parses the arguments 'up' and 'down' in a switch/case construct that then call the scripts here from the dotfile repository.
EG:

```bash
!/bin/bash

# Define the paths to your scripts
SPLIT_TUNNEL_DOWN_SCRIPT="$HOME/dotfiles/scripts/network/splittunnel-down.sh"
SPLIT_TUNNEL_UP_SCRIPT="$HOME/dotfiles/scripts/network/splittunnel-up.sh"

# Use a case statement to handle different actions
case "$2" in
    up)
        # Actions to perform when the connection is brought up
        if [ -x "$SPLIT_TUNNEL_UP_SCRIPT" ]; then
            "$SPLIT_TUNNEL_UP_SCRIPT"
        fi
        ;;
    down)
        if [ -x "$SPLIT_TUNNEL_DOWN_SCRIPT" ]; then
            "$SPLIT_TUNNEL_DOWN_SCRIPT"
            echo "Executed split tunnel down script." >> $LOGFILE
        fi
        ;;
    *)
        echo "Unknown action '$2' for connection '$1'." >> $LOGFILE
        ;;
esac

```
