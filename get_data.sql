CREATE OR REPLACE FUNCTION get_data()
RETURNS VOID
LANGUAGE plpython3u
AS $$
import urllib.request
import json
import psycopg2
import os

# Check if the url is read correctly
url = os.getenv('POSTGRES_OPENWEATHERLINK')
if url is None:
    raise ValueError(f'Enviroment variable POSTGRES_OPENWEATHERLINK not found')

# Open the URL and retrieve the data
with urllib.request.urlopen(url) as response:
    data = json.loads(response.read())

# Connect to the PostgreSQL database
conn = psycopg2.connect(
    dbname='AutomatedPostgres',
    user='postgres',
    password='postgres',
    host='localhost'
)

# Insert the data into the specified table
cur = conn.cursor()
cur.execute("""
    INSERT INTO weatherDataOpenAPI (
        lon, lat, base, temp, feels_like, temp_min, temp_max, pressure, humidity, sea_level,
        grnd_level, visibility, speed, deg, gust, all_clouds, dt, type, sys_id, country,
        sunrise, sunset, timezone, city_id, city_name, cod
    ) VALUES (
        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
        %s, %s, %s, %s, %s, %s
    )
""", (
    data['coord']['lon'], data['coord']['lat'], data['base'], data['main']['temp'], data['main']['feels_like'],
    data['main']['temp_min'], data['main']['temp_max'], data['main']['pressure'], data['main']['humidity'],
    data['main']['sea_level'], data['main']['grnd_level'], data['visibility'], data['wind']['speed'],
    data['wind']['deg'], data['wind']['gust'], data['clouds']['all'], data['dt'], data['sys']['type'],
    data['sys']['id'], data['sys']['country'], data['sys']['sunrise'], data['sys']['sunset'],
    data['timezone'], data['id'], data['name'], data['cod']
))
conn.commit()

# Close the database connection
conn.close()
$$;
