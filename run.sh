#!/bin/bash

init_dir=$(dirname "$0")

# Check if .env file exists
if [ ! -f "$init_dir/.env" ]; then
    echo "Error: No .env file found in the project directory"
    exit 1
fi
source "$init_dir/.env"

# Required env variables
required_vars=(
    "SSH_KEY"
    "VM_DEV"
    "VM_PROD"
    "DB_NAME"
    "DB_ROOT_PASSWORD"
    "DB_USER"
    "DB_PASSWORD"
    "HTTP_ROOT"
)

# Check if each required variable is defined
missing_vars=()
for var in "${required_vars[@]}"; do
    if [ -z "${!var}" ]; then
        missing_vars+=("$var")
    fi
done

# If there are missing variables, echo them
if [ ${#missing_vars[@]} -gt 0 ]; then
    echo "Error: The following environment variables are not defined:"
    for missing_var in "${missing_vars[@]}"; do
        echo "$missing_var"
    done
    exit 1
fi

# Check if should auto run playbooks
mode=$1
if [ -z $1 ]; then
    echo "No mode given, checking for default mode in environment"
    if [ -z $DEFAULT_MODE ]; then
        echo "Error: No mode setup"
        exit 1
    fi
    mode=$DEFAULT_MODE
fi

# Check if mode is either "AUTO" or "MANUAL"
if [ "$mode" != "AUTO" ] && [ "$mode" != "MANUAL" ]; then
    echo "Error: Mode must be either 'AUTO' or 'MANUAL'."
    exit 1
fi

# Launch docker container
docker compose -f "$init_dir/docker-compose.yml" up --build -d
docker-compose exec ansible bash -c "bash /app/docker/init.sh $mode $SSH_KEY $VM_DEV $VM_PROD $HTTP_ROOT $DB_NAME $DB_ROOT_PASSWORD $DB_USER $DB_PASSWORD"