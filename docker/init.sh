#!/bin/bash

# Check if correct number of arguments
if [ ! $# -eq 6 ]; then
    echo "Missing environment values"
    exit 1
fi

export VM_DEV="$3"
export VM_PROD="$4"
export DB_NAME="$5"
export DB_PASSWORD="$6"

chmod 400 /app/.ssh/$2

# Add ssh key to agent
eval $(ssh-agent -s)
ssh-add /app/.ssh/$2

# Launches playbooks
if [ $1 = "AUTO" ]; then
    ansible-playbook main.yml -i inventories
fi

# for ssh agent to use the same environment as the user shell
bash -i