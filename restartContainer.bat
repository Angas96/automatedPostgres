@echo off
cd database
docker-compose up -d
docker exec -it database-automatedpostgres-1 /bin/bash -c "bash /sql/entry.sh"
cd ..