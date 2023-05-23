#!/bin/bash

#install cron first
apt-get update
apt-get install -y cron


#set cronjobs which should be executed by the crontab
(crontab -l ; echo "*/1 * * * * /docker-entrypoint-initdb.d/getDataCron.sh") | crontab -

#start cron service to be executed
service cron start