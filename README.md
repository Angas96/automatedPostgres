# README.md

**Step 1: Install docker (https://www.docker.com/)**
For Linux users install docker.

```bash
brew install --cask docker
```

**Step 2: Make a createEnviromentVariables.bat / createEnviromentVariables.sh (for Linux Users) file which should look like this:**

### Windows

```Batch

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
set POSTGRES_API_KEY_METGIS=INSERT API KEY
set POSTGRES_UNITS_OPEN=metric
set POSTGRES_OPENWEATHERLINK="https://api.openweathermap.org/data/2.5/weather?q=%POSTGRES_CITY%&units=%POSTGRES_UNITS_OPEN%&appid=%POSTGRES_API_KEY_OPEN%"
set POSTGRES_METGISLINK_CURRENT="https://api.metgis.com/forecast?key=%POSTGRES_API_KEY_METGIS%&lat=%POSTGRES_LAT%&lon=%POSTGRES_LON%&lang=en&v=current"
set POSTGRES_OPENWEATHERLINK_FORECAST="https://api.openweathermap.org/data/2.5/forecast?lat=%POSTGRES_LAT%&lon=%POSTGRES_LON%&units=%POSTGRES_UNITS_OPEN%&appid=%POSTGRES_API_KEY_OPEN%"
set POSTGRES_METGISLINK_FORECAST="https://api.metgis.com/forecast?key=%POSTGRES_API_KEY_METGIS%&lat=%POSTGRES_LAT%&lon=%POSTGRES_LON%&lang=en&v=smart"

```
### Linux

```bash
#!/bin/bash

# Define environment variables needed for the database to work properly
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
export POSTGRES_DB=AutomatedPostgres
export POSTGRES_PORT=5432
export POSTGRES_CITY=Werfenweng
export POSTGRES_LAT=13.25
export POSTGRES_LON=47.4667
export POSTGRES_API_KEY_OPEN=INSERT API KEY
export POSTGRES_API_KEY_METGIS=INSERT API KEY
export POSTGRES_UNITS_OPEN=metric
export POSTGRES_OPENWEATHERLINK="https://api.openweathermap.org/data/2.5/weather?q=$POSTGRES_CITY&units=$POSTGRES_UNITS_OPEN&appid=$POSTGRES_API_KEY_OPEN"
export POSTGRES_METGISLINK_CURRENT="https://api.metgis.com/forecast?key=$POSTGRES_API_KEY_METGIS&lat=$POSTGRES_LAT&lon=$POSTGRES_LON&lang=en&v=current"
export POSTGRES_OPENWEATHERLINK_FORECAST="https://api.openweathermap.org/data/2.5/forecast?lat=$POSTGRES_LAT&lon=$POSTGRES_LON&units=$POSTGRES_UNITS_OPEN&appid=$POSTGRES_API_KEY_OPEN"
export POSTGRES_METGISLINK_FORECAST="https://api.metgis.com/forecast?key=$POSTGRES_API_KEY_METGIS&lat=$POSTGRES_LAT&lon=$POSTGRES_LON&lang=en&v=smart"
```
**For Windows Users simply start the createContainer.bat in the Git Folder which is provided.**


**For Linux Users please ensure that the Scripts have the correct permissions to be executed.**


To ensure that simply type: 
```bash
chmod +x createContainer.sh
```
```bash
chmod +x createEnviromentVariables.sh
```
```bash
chmod +x cronStart.sh
```
```bash
chmod +x entry.sh
```
```bash
chmod +x getDataCron.sh
```
```bash
chmod +x getDataForecastCron.sh
```
```bash
chmod +x startDocker.sh
```
To start the shell scripts type: 
```bash
./createContainer.sh
```

if container was already build once and just needs to be started again use
```bash
./startDocker.sh
```

**Step 3: For testing reasons install pgadmin4 via docker (https://hub.docker.com/r/dpage/pgadmin4/)**


```console
docker pull dpage/pgadmin4
docker run --name pgadmin -e "PGADMIN_DEFAULT_EMAIL=name@example.com" -e "PGADMIN_DEFAULT_PASSWORD=admin" -p 5050:80 -d dpage/pgadmin4 
```

