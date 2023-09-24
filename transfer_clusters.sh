function warm() {

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
rsync -r --progress $1 $2
}

warm /ifs/rtsia01/greenbaum/users/ahunos/results_modkit /juno/work/greenbaum/users/ahunos/sandbox/
# rsync -r --progress /ifs/rtsia01/greenbaum/users/ahunos/results_modkit /juno/work/greenbaum/users/ahunos/sandbox/