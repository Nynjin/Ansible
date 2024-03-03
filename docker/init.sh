#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <ssh_key>"
    exit 1
fi

export VM_DEV="$2"
export VM_PROD="$3"

chmod 400 /app/.ssh/$1

eval $(ssh-agent -s)
ssh-add /app/.ssh/$1
bash -i