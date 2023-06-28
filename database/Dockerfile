# Importing the lastest version of postgres to ensure stability 
FROM postgres:15.3-bullseye

# Installing required Packages for the Database to ensure everything works as intended
RUN apt-get update \
    && apt-get install -y postgresql-plpython3-15 python3-pip cron \
    && pip3 install psycopg2-binary

# Creating Folder for Scripts
RUN mkdir helperScripts jsonfiles sql

# Changing the Ownership and Permissions of the copied Files
RUN chown -R 1000:1000 \
    /sql \
    /helperScripts \
    /jsonfiles \
    && chmod 755 -R \
    /sql \
    /helperScripts \
    /jsonfiles