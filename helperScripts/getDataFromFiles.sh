#!/bin/bash

sleep 5

psql -U postgres -d AutomatedPostgres -c "select import_percipitation('/jsonfiles/Werfenweng_MetGIS_Precipitation_hourly_20200901-20201101.json')" >> status.txt
psql -U postgres -d AutomatedPostgres -c "select import_percipitation('/jsonfiles/Werfenweng_MetGIS_Precipitation_hourly_20211201-20220301.json')" >> status.txt
psql -U postgres -d AutomatedPostgres -c "select import_relhumidity('/jsonfiles/Werfenweng_MetGIS_RelHumidity_hourly_20200901-20201101.json')" >> status.txt
psql -U postgres -d AutomatedPostgres -c "select import_relhumidity('/jsonfiles/Werfenweng_MetGIS_RelHumidity_hourly_20211201-20220301.json')" >> status.txt
psql -U postgres -d AutomatedPostgres -c "select import_temperature('/jsonfiles/Werfenweng_MetGIS_Temperature_hourly_20200901-20201101.json')" >> status.txt
psql -U postgres -d AutomatedPostgres -c "select import_temperature('/jsonfiles/Werfenweng_MetGIS_Temperature_hourly_20211201-20220301.json')" >> status.txt
psql -U postgres -d AutomatedPostgres -c "select import_wind('/jsonfiles/Werfenweng_MetGIS_Wind_hourly_20200901-20201101.json')" >> status.txt
psql -U postgres -d AutomatedPostgres -c "select import_wind('/jsonfiles/Werfenweng_MetGIS_Wind_hourly_20211201-20220301.json')" >> status.txt
psql -U postgres -d AutomatedPostgres -c "select import_country('/jsonfiles/zipcodes.at.json')" >> status.txt
psql -U postgres -d AutomatedPostgres -c "select import_country('/jsonfiles/zipcodes.de.json')" >> status.txt
psql -U postgres -d AutomatedPostgres -c "select import_country('/jsonfiles/zipcodes.ch.json')" >> status.txt

#If you want to change the data inserted for the History Tables from Metgis simply change the file names here.