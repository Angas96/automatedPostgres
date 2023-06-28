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
RUN chown -R postgres:postgres \
    /docker-entrypoint-initdb.d \
    /helperScripts \
    /jsonfiles \
    && chmod 755 \
    /docker-entrypoint-initdb.d \
    /helperScripts \
    /jsonfiles