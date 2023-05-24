# importing the lastest version of postgres to ensure stability 
FROM postgres:latest

# installing required packages for the database to ensure everything works as intended
RUN apt-get update \
    && apt-get install -y postgresql-plpython3-15 python3-pip cron

RUN pip3 install psycopg2-binary

# creating folder for scripts
RUN mkdir helperScripts

# copying files from the git repo to the docker container
COPY extension.sql /docker-entrypoint-initdb.d/
COPY createTable.sql /docker-entrypoint-initdb.d/
COPY get_data.sql /docker-entrypoint-initdb.d/
COPY get_data_metgis_current.sql /docker-entrypoint-initdb.d/
COPY getDataCron.sh /helperScripts/
COPY cronStart.sh /helperScripts/

# changing the ownership and permissions of the copied files
RUN chown postgres:postgres /docker-entrypoint-initdb.d/extension.sql \
    && chmod 755 /docker-entrypoint-initdb.d/extension.sql

RUN chown postgres:postgres /docker-entrypoint-initdb.d/createTable.sql \
    && chmod 755 /docker-entrypoint-initdb.d/createTable.sql

RUN chown postgres:postgres /docker-entrypoint-initdb.d/get_data.sql \
    && chmod 755 /docker-entrypoint-initdb.d/get_data.sql

RUN chown postgres:postgres /docker-entrypoint-initdb.d/get_data_metgis_current.sql \
    && chmod 755 /docker-entrypoint-initdb.d/get_data_metgis_current.sql

RUN chown postgres:postgres /helperScripts/getDataCron.sh \
    && chmod 755 /helperScripts/getDataCron.sh 

RUN chown postgres:postgres /helperScripts/cronStart.sh \
    && chmod 755 /helperScripts/cronStart.sh 
