# Importing the lastest version of postgres to ensure stability 
FROM postgres:15.3-bullseye

# Installing required Packages for the Database to ensure everything works as intended
RUN apt-get update \
    && apt-get install -y postgresql-plpython3-15 python3-pip cron \
    && pip3 install psycopg2-binary

# Creating Folder for Scripts
RUN mkdir helperScripts jsonfiles

# Copying Files from the git repo to the Docker Container
COPY extension.sql createTable.sql getDataOpenAPI.sql getDataMetgisCurrent.sql getDataMetgisForecast.sql readFiles.sql entry.sh /docker-entrypoint-initdb.d/
COPY wetter /jsonfiles
COPY getDataCron.sh cronStart.sh getDataFromFiles.sh getDataForecastCron.sh /helperScripts/

# Changing the Ownership and Permissions of the copied Files
RUN chown postgres:postgres \
    /docker-entrypoint-initdb.d/extension.sql \
    /docker-entrypoint-initdb.d/createTable.sql \
    /docker-entrypoint-initdb.d/getDataOpenAPI.sql \
    /docker-entrypoint-initdb.d/getDataMetgisForecast.sql \
    /docker-entrypoint-initdb.d/getDataMetgisCurrent.sql \
    /docker-entrypoint-initdb.d/readFiles.sql \
    /helperScripts/getDataCron.sh \
    /helperScripts/getDataForecastCron.sh \
    /helperScripts/cronStart.sh \
    /helperScripts/getDataFromFiles.sh \
    /docker-entrypoint-initdb.d/entry.sh \
    /jsonfiles/Werfenweng_MetGIS_Precipitation_hourly_20200901-20201101.json \
    /jsonfiles/Werfenweng_MetGIS_Precipitation_hourly_20211201-20220301.json \
    /jsonfiles/Werfenweng_MetGIS_RelHumidity_hourly_20200901-20201101.json \
    /jsonfiles/Werfenweng_MetGIS_RelHumidity_hourly_20211201-20220301.json \
    /jsonfiles/Werfenweng_MetGIS_Temperature_hourly_20200901-20201101.json \
    /jsonfiles/Werfenweng_MetGIS_Temperature_hourly_20211201-20220301.json \
    /jsonfiles/Werfenweng_MetGIS_Wind_hourly_20200901-20201101.json \
    /jsonfiles/Werfenweng_MetGIS_Wind_hourly_20211201-20220301.json \
    && chmod 755 \
    /docker-entrypoint-initdb.d/extension.sql \
    /docker-entrypoint-initdb.d/createTable.sql \
    /docker-entrypoint-initdb.d/getDataOpenAPI.sql \
    /docker-entrypoint-initdb.d/getDataMetgisForecast.sql \
    /docker-entrypoint-initdb.d/getDataMetgisCurrent.sql \
    /docker-entrypoint-initdb.d/readFiles.sql \
    /helperScripts/getDataCron.sh \
    /helperScripts/getDataForecastCron.sh \
    /helperScripts/cronStart.sh \
    /helperScripts/getDataFromFiles.sh \
    /docker-entrypoint-initdb.d/entry.sh \
    /jsonfiles/Werfenweng_MetGIS_Precipitation_hourly_20200901-20201101.json \
    /jsonfiles/Werfenweng_MetGIS_Precipitation_hourly_20211201-20220301.json \
    /jsonfiles/Werfenweng_MetGIS_RelHumidity_hourly_20200901-20201101.json \
    /jsonfiles/Werfenweng_MetGIS_RelHumidity_hourly_20211201-20220301.json \
    /jsonfiles/Werfenweng_MetGIS_Temperature_hourly_20200901-20201101.json \
    /jsonfiles/Werfenweng_MetGIS_Temperature_hourly_20211201-20220301.json \
    /jsonfiles/Werfenweng_MetGIS_Wind_hourly_20200901-20201101.json \
    /jsonfiles/Werfenweng_MetGIS_Wind_hourly_20211201-20220301.json 
