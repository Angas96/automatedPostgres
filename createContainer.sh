#!/bin/bash

# Setting up environment variables
source createEnvironmentVariables.sh

# Build the Docker image with the Dockerfile
docker build -t automatedpostgres .

# Run the Docker container with the specified environment variables
docker run -d -p $POSTGRES_PORT:5432 -e POSTGRES_USER=$POSTGRES_USER -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD -e POSTGRES_DB=$POSTGRES_DB -e POSTGRES_OPENWEATHERLINK=$POSTGRES_OPENWEATHERLINK -e POSTGRES_METGISLINK_CURRENT=$POSTGRES_METGISLINK_CURRENT -e POSTGRES_METGISLINK_FORECAST=$POSTGRES_METGISLINK_FORECAST --name automatedPostgres automatedpostgres

# Start the script inside the Docker container to ensure automatic data collection
docker exec -it automatedPostgres /bin/bash -c "bash /docker-entrypoint-initdb.d/entry.sh"
docker exec -it automatedPostgres /bin/bash -c "bash /helperScripts/cronStart.sh"

