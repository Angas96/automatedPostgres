CREATE OR REPLACE FUNCTION import_percipitation(json_file text)
RETURNS void AS $$
import json
import os
import psycopg2
import datetime

def import_data(json_file):
    conn = psycopg2.connect(
    dbname=os.getenv('POSTGRES_DB'),
    user=os.getenv('POSTGRES_USER'),
    password=os.getenv('POSTGRES_PASSWORD'),
    host='localhost'
    )
    cur = conn.cursor()
    if os.path.exists(json_file):
        with open(json_file, 'r') as file:
            data = json.load(file)
            if 'data' in data:
                info = data.get('Info')
                info_hrp = data.get('Info_hrp')
                info_lat = data.get('Info_lat')
                info_lon = data.get('Info_lon')
                info_alt = data.get('Info_alt')
                print(info)
                for record in data['data']:
                    lon = record.get('lon')
                    lat = record.get('lat')
                    alt = record.get('alt')
                    date = datetime.datetime.strptime(record.get('date'), "%Y%m%d %H:%M").strftime("%Y-%m-%d %H:%M:%S")
                    hrp = record.get('hrp')
                    # Insert the record into the table
                    cur.execute("INSERT INTO weatherDataMetgisPrecipitationHistory (info, lon, lat, alt, date, hrp, info_hrp, info_lat, info_lon, info_alt) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (info, lon, lat, alt, date, hrp, info_hrp, info_lat, info_lon, info_alt))
                    conn.commit()
                conn.close()
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
import psycopg2
import datetime


def import_data(json_file):
    conn = psycopg2.connect(
    dbname=os.getenv('POSTGRES_DB'),
    user=os.getenv('POSTGRES_USER'),
    password=os.getenv('POSTGRES_PASSWORD'),
    host='localhost'
    )
    cur = conn.cursor()
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
                    date = datetime.datetime.strptime(record.get('date'), "%Y%m%d %H:%M").strftime("%Y-%m-%d %H:%M:%S")
                    rh = record.get('rh')
                    # Insert the record into the table
                    cur.execute("INSERT INTO weatherDataMetgisRelHumidityHistory (info, lon, lat, alt, date, rh, info_rh, info_lat, info_lon, info_alt) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                    (info, lon, lat, alt, date, rh, info_rh, info_lat, info_lon, info_alt))
                    conn.commit()
                conn.close()
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
import psycopg2
import datetime


def import_data(json_file):
    conn = psycopg2.connect(
    dbname=os.getenv('POSTGRES_DB'),
    user=os.getenv('POSTGRES_USER'),
    password=os.getenv('POSTGRES_PASSWORD'),
    host='localhost'
    )
    cur = conn.cursor()
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
                    date = datetime.datetime.strptime(record.get('date'), "%Y%m%d %H:%M").strftime("%Y-%m-%d %H:%M:%S")
                    tmp = record.get('tmp')
                    # Insert the record into the table
                    cur.execute("INSERT INTO weatherDataMetgisTemperatureHistory (info, lon, lat, alt, date, tmp, info_tmp, info_lat, info_lon, info_alt) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                    (info, lon, lat, alt, date, tmp, info_tmp, info_lat, info_lon, info_alt))
                    conn.commit()
                conn.close()
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
import psycopg2
import datetime


def import_data(json_file):
    conn = psycopg2.connect(
    dbname=os.getenv('POSTGRES_DB'),
    user=os.getenv('POSTGRES_USER'),
    password=os.getenv('POSTGRES_PASSWORD'),
    host='localhost'
    )
    cur = conn.cursor()
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
                    date = datetime.datetime.strptime(record.get('date'), "%Y%m%d %H:%M").strftime("%Y-%m-%d %H:%M:%S")
                    wdir = record.get('wdir')
                    wspd = record.get('wspd')
                    # Insert the record into the table
                    cur.execute("INSERT INTO weatherDataMetgisWindHistory (info, lon, lat, alt, date, wdir, wspd, info_wdir, info_wspd, info_lat, info_lon, info_alt) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                    (info, lon, lat, alt, date, wdir, wspd, info_wdir, info_wspd, info_lat, info_lon, info_alt))
                    conn.commit()
                conn.close()
            else:
                plpy.error("Invalid JSON format. 'data' key not found.")
    else:
        plpy.error("JSON file does not exist.")

import_data(json_file)
$$ LANGUAGE plpython3u;

CREATE OR REPLACE FUNCTION import_country(json_file text)
RETURNS void AS $$
import json
import os
import psycopg2

def import_data(json_file):
    conn = psycopg2.connect(
        dbname=os.getenv('POSTGRES_DB'),
        user=os.getenv('POSTGRES_USER'),
        password=os.getenv('POSTGRES_PASSWORD'),
        host='localhost'
    )
    cur = conn.cursor()
    if os.path.exists(json_file):
        with open(json_file, 'r') as file:
            data = json.load(file)
            for record in data:
                zipcode = record.get('zipcode')
                community = record.get('community')
                place = record.get('place')
                latitude = record.get('latitude')
                longitude = record.get('longitude')
                
                # Insert the record into the table
                cur.execute("""
                    INSERT INTO countryMapping (lat, lon, zipcode, place, community)
                    VALUES (%s, %s, %s, %s, %s)
                """, (latitude, longitude, zipcode, place, community))
                
                conn.commit()
                
            conn.close()
    else:
        raise FileNotFoundError("JSON file does not exist.")

import_data(json_file)
$$ LANGUAGE plpython3u;

