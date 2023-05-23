#!/bin/bash

psql -U postgres -d AutomatedPostgres -c "SELECT get_data()"


