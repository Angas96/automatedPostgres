@echo off
docker-compose up -d
docker exec -it automatedPostgres /bin/bash -c "bash /sql/entry.sh"