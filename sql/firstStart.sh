#!/bin/bash
psql -U postgres -d AutomatedPostgres < sql/createTable.sql
psql -U postgres -d AutomatedPostgres < sql/extension.sql
psql -U postgres -d AutomatedPostgres < sql/getDataMetgisCurrent.sql
psql -U postgres -d AutomatedPostgres < sql/getDataMetgisForecast.sql
psql -U postgres -d AutomatedPostgres < sql/getDataOpenAPI.sql
psql -U postgres -d AutomatedPostgres < sql/readFiles.sql
psql -U postgres -d AutomatedPostgres < sql/views.sql
psql -U postgres -d AutomatedPostgres -c "INSERT INTO countryMapping (lat, lon, zipcode, place) VALUES ($POSTGRES_LAT, $POSTGRES_LON, $POSTGRES_ZIPCODE, '$POSTGRES_CITY')"
# change the .env file for inserting a countryMapping entry