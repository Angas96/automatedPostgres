#!/bin/bash

psql -U postgres -d AutomatedPostgres -c "SELECT get_data_openapi_forecast()"
psql -U postgres -d AutomatedPostgres -c "SELECT get_data_metgis_forecast()"


