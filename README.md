# README.md

**Install docker (https://www.docker.com/)**
```batch
run.bat
```
For Linux users install docker from this guide (https://docs.docker.com/engine/install/ubuntu/).
Docker Compose from this Guide (https://docs.docker.com/compose/install/linux/).

```bash
brew install --cask docker
```


insert the .env file into the database folder which needs to look like this
```batch
POSTGRES_API_KEY_OPEN=[API_KEY_NEEDED]
POSTGRES_API_KEY_METGIS=[API_KEY_NEEDED]
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DB=AutomatedPostgres
POSTGRES_PORT=5432
POSTGRES_CITY=Werfenweng
POSTGRES_LAT=13.25
POSTGRES_LON=47.4667
POSTGRES_UNITS_OPEN=metric
POSTGRES_OPENWEATHERLINK="https://api.openweathermap.org/data/2.5/weather?q=$POSTGRES_CITY&units=$POSTGRES_UNITS_OPEN&appid=$POSTGRES_API_KEY_OPEN"
POSTGRES_METGISLINK_CURRENT="https://api.metgis.com/forecast?key=$POSTGRES_API_KEY_METGIS&lat=$POSTGRES_LAT&lon=$POSTGRES_LON&lang=en&v=current"
POSTGRES_OPENWEATHERLINK_FORECAST="https://api.openweathermap.org/data/2.5/forecast?lat=$POSTGRES_LAT&lon=$POSTGRES_LON&units=$POSTGRES_UNITS_OPEN&appid=$POSTGRES_API_KEY_OPEN"
POSTGRES_METGISLINK_FORECAST="https://api.metgis.com/forecast?key=$POSTGRES_API_KEY_METGIS&lat=$POSTGRES_LAT&lon=$POSTGRES_LON&lang=en&v=smart"
PGADMIN_DEFAULT_EMAIL=name@example.com
PGADMIN_DEFAULT_PASSWORD=admin
```