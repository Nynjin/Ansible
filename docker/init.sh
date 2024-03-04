#!/bin/bash

# Check if correct number of arguments
if [ ! $# -eq 9 ]; then
    echo "Missing environment values"
    exit 1
fi

export VM_DEV="$3"
export VM_PROD="$4"
export HTTP_ROOT="$5"
export DB_NAME="$6"
export DB_ROOT_PASSWORD="$7"
export DB_USER="$8"
export DB_PASSWORD="$9"

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