REM Start Docker Container after it was already running
docker start automatedPostgres
docker exec -it automatedPostgres /bin/bash -c "bash /docker-entrypoint-initdb.d/entry.sh"