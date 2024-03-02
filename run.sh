#!/bin/bash

init_dir=$(dirname "$0")

if [ ! -f "$init_dir/.env" ]; then
    echo "No .env file found in the project directory"
    exit 1
fi
source "$init_dir/.env"

docker compose -f "$init_dir/docker-compose.yml" up --build -d
docker-compose exec ansible bash -c "bash /app/docker/init.sh $SSH_KEY"