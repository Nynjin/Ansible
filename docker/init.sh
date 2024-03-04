#!/bin/bash

# Check if correct number of arguments
if [ ! $# -eq 5 ]; then
    echo "Missing environment values"
    exit 1
fi

export VM_DEV="$2"
export VM_PROD="$3"
export DB_NAME="$4"
export DB_PASSWORD="$5"

chmod 400 /app/.ssh/$1

# Add ssh key to agent
eval $(ssh-agent -s)
ssh-add /app/.ssh/$1

# Launches playbooks
ansible-playbook main.yml -i inventories

# for ssh agent to use the same environment as the user shell
bash -i