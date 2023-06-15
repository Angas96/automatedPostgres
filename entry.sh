#!/bin/bash
#start cron service to be executed
service cron status > status.txt
service cron start