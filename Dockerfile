FROM postgres:latest

RUN apt-get update \
    && apt-get install -y postgresql-plpython3-15

COPY extension.sql /docker-entrypoint-initdb.d/

RUN chown postgres:postgres /docker-entrypoint-initdb.d/extension.sql \
    && chmod 755 /docker-entrypoint-initdb.d/extension.sql
