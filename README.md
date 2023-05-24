# README.md

**Step 1: Install docker (https://www.docker.com/)**

**Step 2: make a createEnviromentVariables.bat file which should look like this:**

```python

@echo off

REM Define environment variables all are needed for the database to work properly
set POSTGRES_USER=postgres
set POSTGRES_PASSWORD=postgres
set POSTGRES_DB=AutomatedPostgres
set POSTGRES_PORT=5432
set POSTGRES_CITY=Werfenweng
set POSTGRES_LAT=13.25
set POSTGRES_LON=47.4667
set POSTGRES_API_KEY_OPEN=INSERT API KEY
set POSTGRES_UNITS_OPEN=metric
set POSTGRES_OPENWEATHERLINK="https://api.openweathermap.org/data/2.5/weather?q=%POSTGRES_CITY%&units=%POSTGRES_UNITS_OPEN%&appid=%POSTGRES_API_KEY_OPEN%"
set POSTGRES_API_KEY_METGIS=INSERT API KEY
set POSTGRES_METGISLINK_CURRENT="https://api.metgis.com/forecast?key=%POSTGRES_API_KEY_METGIS%&lat=%POSTGRES_LAT%&lon=%POSTGRES_LON%&lang=en&v=current"
set POSTGRES_METGISLINK_FORECAST=""

```

add commands how to start all services docker/etc


for testing reasons install pgadmin4 via docker

enter folder of the project
use createContainer.bat

Enjoy!
