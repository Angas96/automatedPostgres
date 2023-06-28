#!/bin/bash
sleep 15
docker exec -it database-automatedpostgres-1 /bin/bash -c "bash /docker-entrypoint-initdb.d/entry.sh"
docker exec -it database-automatedpostgres-1 /bin/bash -c "bash /helperScripts/cronStart.sh"
