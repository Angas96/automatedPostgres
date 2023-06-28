#!/bin/bash

psql -U postgres -d AutomatedPostgres -c "SELECT get_data_openapi_current()"
psql -U postgres -d AutomatedPostgres -c "SELECT get_data_metgis_current()"


