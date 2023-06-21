@echo off

REM Setting up enviroment variables
CALL createEnvironmentVariables.bat

REM Build the Docker image with the Dockerfile
docker build -t automatedpostgres . 

REM Run the Docker container with the specified environment variables
docker run -d -p %POSTGRES_PORT%:5432 -e POSTGRES_USER=%POSTGRES_USER% -e POSTGRES_PASSWORD=%POSTGRES_PASSWORD% -e POSTGRES_DB=%POSTGRES_DB% -e POSTGRES_OPENWEATHERLINK_FORECAST=%POSTGRES_OPENWEATHERLINK_FORECAST% -e POSTGRES_OPENWEATHERLINK=%POSTGRES_OPENWEATHERLINK% -e POSTGRES_METGISLINK_CURRENT=%POSTGRES_METGISLINK_CURRENT% -e POSTGRES_METGISLINK_FORECAST=%POSTGRES_METGISLINK_FORECAST% --name automatedPostgres automatedpostgres 

REM Starting the Script inside of the docker container to ensure automatic data collection
docker exec -it automatedPostgres /bin/bash -c "bash /docker-entrypoint-initdb.d/entry.sh"
docker exec -it automatedPostgres /bin/bash -c "bash /helperScripts/cronStart.sh"
