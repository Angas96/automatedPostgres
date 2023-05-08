@echo off

REM Define environment variables
set POSTGRES_USER=postgres
set POSTGRES_PASSWORD=postgres
set POSTGRES_DB=AutomatedPostgres
set POSTGRES_PORT=5433

REM Build the Docker image with the Dockerfile
docker build -t automatedpostgres .

REM Run the Docker container with the specified environment variables
docker run -d -p %POSTGRES_PORT%:5432 -e POSTGRES_USER=%POSTGRES_USER% -e POSTGRES_PASSWORD=%POSTGRES_PASSWORD% -e POSTGRES_DB=%POSTGRES_DB% --name automatedPostgres automatedpostgres

