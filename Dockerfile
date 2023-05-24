FROM postgres:latest

RUN apt-get update \
    && apt-get install -y postgresql-plpython3-15 python3-pip cron

RUN pip3 install psycopg2-binary

RUN mkdir helperScripts

COPY extension.sql /docker-entrypoint-initdb.d/
COPY createTable.sql /docker-entrypoint-initdb.d/
COPY get_data.sql /docker-entrypoint-initdb.d/
COPY get_data_metgis_current.sql /docker-entrypoint-initdb.d/
COPY getDataCron.sh /helperScripts/
COPY cronStart.sh /helperScripts/

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

# code documentation should be better!