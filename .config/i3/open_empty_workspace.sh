#/bin/bash
# i3-msg workspace $(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1))

#gets numbers of all workspaces which cannot be used (cause their name is not just a number)
occupied=( $(i3-msg -t get_workspaces |jq 'map(.name / ":"  | select(length > 1)[0] ) | unique | join(" ")' | cut -d'"' -f2) )
# now check if there is any number between 1:10 which is not being used already
for candidate in $(seq 1 10)
do
    if [[ ! " ${occupied[@]} " =~ " ${candidate} " ]]; then
        echo ${candidate}
        # if so, open new ws and exit
        i3-msg workspace ${candidate}
        exit 0;
    fi
done



