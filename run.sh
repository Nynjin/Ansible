#!/bin/bash

init_dir=$(dirname "$0")

# Check if .env file exists
if [ ! -f "$init_dir/.env" ]; then
    echo "No .env file found in the project directory"
    exit 1
fi
source "$init_dir/.env"

# Required env variables
required_vars=(
    "SSH_KEY"
    "VM_DEV"
    "VM_PROD"
    "DB_NAME"
    "DB_PASSWORD"
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
    echo "The following environment variables are not defined:"
    for missing_var in "${missing_vars[@]}"; do
        echo "$missing_var"
    done
    exit 1
fi

# Launch docker container
docker compose -f "$init_dir/docker-compose.yml" up --build -d
docker-compose exec ansible bash -c "bash /app/docker/init.sh $SSH_KEY $VM_DEV $VM_PROD $DB_NAME $DB_PASSWORD"