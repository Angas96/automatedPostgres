#!/bin/bash

#set cronjobs which should be executed by the crontab

(crontab -l ; echo "*/5 * * * * /helperScripts/getDataCron.sh") | crontab -
(crontab -l ; echo "0 8 * * * /helperScripts/getDataForecastCron.sh") | crontab -
./helperScripts/getDataFromFiles.sh

# * = any value
# minute hour day(month) month day(week) is the syntax for the cronjob
# */5 means every 5 minutes
# for further reference use this website to make it easier to set cronjobs correctly (https://crontab.guru/#*_*_*_*)
