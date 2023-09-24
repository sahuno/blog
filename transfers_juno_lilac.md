#!/bin/bash

#samuel ahuno
#make it easy to transfer files between lilac and juno.
#lilac --> warm_stroage --> juno





#cd /ifs/rtsia01/greenbaum
#warm
function warm() {
    

#    <!-- # Check if tmux session "xfer" exists
#tmux has-session -t xfer 2>/dev/null
#if [ $? != 0 ]; then
#    # Session does not exist, so create it
#    tmux new -s xfer
#fi -->

SCREEN_EXIST=$(screen -list | grep "\.xfer[[:space:]]")

# If it doesn't exist, create it
if [ -z "$SCREEN_EXIST" ]; then
    screen -S xfer
fi

# Get the hostname
HOSTNAME=$(hostname)

# Check for 'lilac' or 'juno' in the hostname
if [[ $HOSTNAME == *lilac* ]]; then
    KEYWORD="lilac"
elif [[ $HOSTNAME == *juno* ]]; then
    KEYWORD="juno"
else
    echo "Hostname doesn't contain 'lilac' or 'juno'. Exiting."
    exit 1
fi

# Construct the SSH command
SSH_TARGET="${KEYWORD}-xfer01"
echo "Connecting to $SSH_TARGET..."
ssh "$SSH_TARGET"

#transfer files 
# $1 is source files 
# $2 is dest
#/ifs/rtsia01/greenbaum/projects
nohup rsync -r --progress $1 $2 &
}

# warm /lila/data/greenbaum/users/ahunos/apps/dorado_ont_wf/results /ifs/rtsia01/greenbaum/users/ahunos/results_modkit
rsync -r --progress /lila/data/greenbaum/users/ahunos/apps/dorado_ont_wf/results /ifs/rtsia01/greenbaum/users/ahunos/results_modkit