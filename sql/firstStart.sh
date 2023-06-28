#!/bin/bash
psql -U postgres -d AutomatedPostgres < sql/createTable.sql
psql -U postgres -d AutomatedPostgres < sql/extension.sql
psql -U postgres -d AutomatedPostgres < sql/getDataMetgisCurrent.sql
psql -U postgres -d AutomatedPostgres < sql/getDataMetgisForecast.sql
psql -U postgres -d AutomatedPostgres < sql/getDataOpenAPI.sql
psql -U postgres -d AutomatedPostgres < sql/readFiles.sql
psql -U postgres -d AutomatedPostgres < sql/views.sql