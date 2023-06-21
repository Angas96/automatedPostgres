# Importing the lastest version of postgres to ensure stability 
FROM postgres:latest

# Installing required Packages for the Database to ensure everything works as intended
RUN apt-get update \
    && apt-get install -y postgresql-plpython3-15 python3-pip cron \
    && pip3 install psycopg2-binary

# Creating Folder for Scripts
RUN mkdir helperScripts jsonfiles

# Copying Files from the git repo to the Docker Container
COPY extension.sql createTable.sql getDataOpenAPI.sql getDataMetgisCurrent.sql readFiles.sql entry.sh /docker-entrypoint-initdb.d/
COPY wetter /jsonfiles
COPY getDataCron.sh cronStart.sh getDataFromFiles.sh getDataForecastCron.sh /helperScripts/

# Changing the Ownership and Permissions of the copied Files
RUN chown postgres:postgres \
    /docker-entrypoint-initdb.d/extension.sql \
    /docker-entrypoint-initdb.d/createTable.sql \
    /docker-entrypoint-initdb.d/getDataOpenAPI.sql \
    /docker-entrypoint-initdb.d/getDataMetgisCurrent.sql \
    /helperScripts/getDataCron.sh \
    /helperScripts/getDataForecastCron.sh \
    /helperScripts/cronStart.sh \
    /helperScripts/getDataFromFiles.sh \
    /docker-entrypoint-initdb.d/entry.sh \
    && chmod 755 \
    /docker-entrypoint-initdb.d/extension.sql \
    /docker-entrypoint-initdb.d/createTable.sql \
    /docker-entrypoint-initdb.d/getDataOpenAPI.sql \
    /docker-entrypoint-initdb.d/getDataMetgisCurrent.sql \
    /helperScripts/getDataCron.sh \
    /helperScripts/getDataForecastCron.sh \
    /helperScripts/cronStart.sh \
    /helperScripts/getDataFromFiles.sh \
    /docker-entrypoint-initdb.d/entry.sh
