@echo off
cd database
docker network create pgnetwork 
docker volume create postgres-data 
docker volume create pgadmin-data 
docker-compose up -d
timeout /t 15 /nobreak
docker exec -it database-automatedpostgres-1 /bin/bash -c "bash /sql/firstStart.sh"
docker exec -it database-automatedpostgres-1 /bin/bash -c "bash /sql/entry.sh"
docker exec -it database-automatedpostgres-1 /bin/bash -c "bash /helperScripts/cronStart.sh"