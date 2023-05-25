#!/bin/bash

#set cronjobs which should be executed by the crontab
(crontab -l ; echo "*/5 * * * * /helperScripts/getDataCron.sh") | crontab -
./helperScripts/getDataFromFiles.sh

# * = any value
# minute hour day(month) month day(week) is the syntax for the cronjob
# */5 means every 5 minutes

#start cron service to be executed
service cron start