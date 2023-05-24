CREATE OR REPLACE FUNCTION import_percipitation(json_file text)
RETURNS void AS $$
import json
import os

def import_data(json_file):
    if os.path.exists(json_file):
        with open(json_file, 'r') as file:
            data = json.load(file)
            if 'data' in data:
                info = data.get('Info')
                info_hrp = data.get('Info_hrp')
                info_lat = data.get('Info_lat')
                info_lon = data.get('Info_lon')
                info_alt = data.get('Info_alt')
                for record in data['data']:
                    lon = record.get('lon')
                    lat = record.get('lat')
                    alt = record.get('alt')
                    date = record.get('date')
                    hrp = record.get('hrp')
                    if date is not None and temperature is not None and humidity is not None and wind_speed is not None:
                        # Insert the record into the table
                        plpy.execute("INSERT INTO weatherDataMetgisPrecipitationHistory (info, lon, lat, alt, date, hrp, info_hrp, info_lat, info_lon, info_alt) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                                     (info, lon, lat, alt, date, hrp, info_hrp, info_lat, info_lon, info_alt))
            else:
                plpy.error("Invalid JSON format. 'data' key not found.")
    else:
        plpy.error("JSON file does not exist.")

import_data(json_file)
$$ LANGUAGE plpython3u;

CREATE OR REPLACE FUNCTION import_RelHumidity(json_file text)
RETURNS void AS $$
import json
import os

def import_data(json_file):
    if os.path.exists(json_file):
        with open(json_file, 'r') as file:
            data = json.load(file)
            if 'data' in data:
                info = data.get('Info')
                info_rh = data.get('Info_rh')
                info_lat = data.get('Info_lat')
                info_lon = data.get('Info_lon')
                info_alt = data.get('Info_alt')
                for record in data['data']:
                    lon = record.get('lon')
                    lat = record.get('lat')
                    alt = record.get('alt')
                    date = record.get('date')
                    rh = record.get('rh')
                    if date is not None and temperature is not None and humidity is not None and wind_speed is not None:
                        # Insert the record into the table
                        plpy.execute("INSERT INTO weatherDataMetgisPrecipitationHistory (info, lon, lat, alt, date, rh, info_rh, info_lat, info_lon, info_alt) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                                     (info, lon, lat, alt, date, rh, info_rh, info_lat, info_lon, info_alt))
            else:
                plpy.error("Invalid JSON format. 'data' key not found.")
    else:
        plpy.error("JSON file does not exist.")

import_data(json_file)
$$ LANGUAGE plpython3u;

CREATE OR REPLACE FUNCTION import_Temperature(json_file text)
RETURNS void AS $$
import json
import os

def import_data(json_file):
    if os.path.exists(json_file):
        with open(json_file, 'r') as file:
            data = json.load(file)
            if 'data' in data:
                info = data.get('Info')
                info_tmp = data.get('Info_tmp')
                info_lat = data.get('Info_lat')
                info_lon = data.get('Info_lon')
                info_alt = data.get('Info_alt')
                for record in data['data']:
                    lon = record.get('lon')
                    lat = record.get('lat')
                    alt = record.get('alt')
                    date = record.get('date')
                    tmp = record.get('tmp')
                    if date is not None and temperature is not None and humidity is not None and wind_speed is not None:
                        # Insert the record into the table
                        plpy.execute("INSERT INTO weatherDataMetgisPrecipitationHistory (info, lon, lat, alt, date, tmp, info_tmp, info_lat, info_lon, info_alt) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                                     (info, lon, lat, alt, date, tmp, info_tmp, info_lat, info_lon, info_alt))
            else:
                plpy.error("Invalid JSON format. 'data' key not found.")
    else:
        plpy.error("JSON file does not exist.")

import_data(json_file)
$$ LANGUAGE plpython3u;

CREATE OR REPLACE FUNCTION import_Wind(json_file text)
RETURNS void AS $$
import json
import os

def import_data(json_file):
    if os.path.exists(json_file):
        with open(json_file, 'r') as file:
            data = json.load(file)
            if 'data' in data:
                info = data.get('Info')
                info_wdir = data.get('Info_wdir')
                info_wspd = data.get('Info_wspd')
                info_lat = data.get('Info_lat')
                info_lon = data.get('Info_lon')
                info_alt = data.get('Info_alt')
                for record in data['data']:
                    lon = record.get('lon')
                    lat = record.get('lat')
                    alt = record.get('alt')
                    date = record.get('date')
                    tmp = record.get('tmp')
                    if date is not None and temperature is not None and humidity is not None and wind_speed is not None:
                        # Insert the record into the table
                        plpy.execute("INSERT INTO weatherDataMetgisPrecipitationHistory (info, lon, lat, alt, date, wdir, wspd, info_wdir, info_wspd, info_lat, info_lon, info_alt) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                                     (info, lon, lat, alt, date, wdir, wspd, info_wdir, info_wspd, info_lat, info_lon, info_alt))
            else:
                plpy.error("Invalid JSON format. 'data' key not found.")
    else:
        plpy.error("JSON file does not exist.")

import_data(json_file)
$$ LANGUAGE plpython3u;