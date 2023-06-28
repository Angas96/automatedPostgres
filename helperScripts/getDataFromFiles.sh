#!/bin/bash

sleep 5

psql -U postgres -d AutomatedPostgres -c "select import_percipitation('/jsonfiles/Werfenweng_MetGIS_Precipitation_hourly_20200901-20201101.json')"
psql -U postgres -d AutomatedPostgres -c "select import_percipitation('/jsonfiles/Werfenweng_MetGIS_Precipitation_hourly_20211201-20220301.json')"
psql -U postgres -d AutomatedPostgres -c "select import_relhumidity('/jsonfiles/Werfenweng_MetGIS_RelHumidity_hourly_20200901-20201101.json')"
psql -U postgres -d AutomatedPostgres -c "select import_relhumidity('/jsonfiles/Werfenweng_MetGIS_RelHumidity_hourly_20211201-20220301.json')"
psql -U postgres -d AutomatedPostgres -c "select import_temperature('/jsonfiles/Werfenweng_MetGIS_Temperature_hourly_20200901-20201101.json')"
psql -U postgres -d AutomatedPostgres -c "select import_temperature('/jsonfiles/Werfenweng_MetGIS_Temperature_hourly_20211201-20220301.json')"
psql -U postgres -d AutomatedPostgres -c "select import_wind('/jsonfiles/Werfenweng_MetGIS_Wind_hourly_20200901-20201101.json')"
psql -U postgres -d AutomatedPostgres -c "select import_wind('/jsonfiles/Werfenweng_MetGIS_Wind_hourly_20211201-20220301.json')"
