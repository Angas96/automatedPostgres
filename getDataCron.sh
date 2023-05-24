#!/bin/bash

psql -U postgres -d AutomatedPostgres -c "SELECT get_data()"
psql -U postgres -d AutomatedPostgres -c "SELECT get_data_metgis_current()"


