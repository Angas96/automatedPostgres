@echo off

REM Define environment variables
set POSTGRES_USER=postgres
set POSTGRES_PASSWORD=postgres
set POSTGRES_DB=AutomatedPostgres
set POSTGRES_PORT=5432
set POSTGRES_CITY=Werfenweng
set POSTGRES_API_KEY_OPEN=9baa53afdf2ddb2f93e029e19ff7e904
set POSTGRES_UNITS_OPEN=metric
set POSTGRES_OPENWEATHERLINK="https://api.openweathermap.org/data/2.5/weather?q=%POSTGRES_CITY%&units=%POSTGRES_UNITS_OPEN%&appid=%POSTGRES_API_KEY_OPEN%"

REM Build the Docker image with the Dockerfile
docker build -t automatedpostgress .

REM Run the Docker container with the specified environment variables
docker run -d -p %POSTGRES_PORT%:5432 -e POSTGRES_USER=%POSTGRES_USER% -e POSTGRES_PASSWORD=%POSTGRES_PASSWORD% -e POSTGRES_DB=%POSTGRES_DB% -e POSTGRES_OPENWEATHERLINK=%POSTGRES_OPENWEATHERLINK% --name automatedPostgres automatedpostgres
