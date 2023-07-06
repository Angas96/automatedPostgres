CREATE OR REPLACE FUNCTION get_data_openapi_current()
RETURNS VOID
LANGUAGE plpython3u
AS $$
import urllib.request
import json
import psycopg2
import os
import datetime

# Check if the url is read correctly
url = os.getenv('POSTGRES_OPENWEATHERLINK')
if url is None:
    raise ValueError(f'Enviroment variable POSTGRES_OPENWEATHERLINK not found')

# Open the URL and retrieve the data
with urllib.request.urlopen(url) as response:
    data = json.loads(response.read())

# Connect to the PostgreSQL database
conn = psycopg2.connect(
    dbname=os.getenv('POSTGRES_DB'),
    user=os.getenv('POSTGRES_USER'),
    password=os.getenv('POSTGRES_PASSWORD'),
    host='localhost'
)

# Insert the data into the specified table
cur = conn.cursor()
min_temp = float(os.environ.get('MIN_TEMP', -273.15))
max_temp = float(os.environ.get('MAX_TEMP', 100.0))
min_humidity = float(os.environ.get('MIN_HUMIDITY', 0))
max_humidity = float(os.environ.get('MAX_HUMIDITY', 100))
min_pressure = float(os.environ.get('MIN_PRESSURE', 100))
max_pressure = float(os.environ.get('MAX_PRESSURE', 1050))
min_wind_speed = float(os.environ.get('MIN_WIND_SPEED', 0.0))
max_wind_speed = float(os.environ.get('MAX_WIND_SPEED', 20.0))

if not (min_temp <= data['main']['temp'] <= max_temp):
    data['main']['temp']=4471.1

if not (min_pressure <= data['main']['pressure'] <= max_pressure):
    data['main']['pressure']=4471.1

if not (min_humidity <= data['main']['humidity'] <= max_humidity):
    data['main']['humidity']=4471.1

if not (min_wind_speed <= data['wind']['speed'] <= max_wind_speed):
    data['wind']['speed']=4471.1

cur.execute("""
    INSERT INTO weatherDataOpenAPICurrent (
        lon, lat, base, temp, feels_like, temp_min, temp_max, pressure, humidity, sea_level,
        grnd_level, visibility, speed, deg, gust, all_clouds, dt, type, sys_id, country,
        sunrise, sunset, timezone, city_id, city_name, cod, currentDate
    ) VALUES (
        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
        %s, %s, %s, %s, %s, %s, %s
    )
""", (
    data['coord']['lon'], data['coord']['lat'], data['base'], data['main']['temp'], data['main']['feels_like'],
    data['main']['temp_min'], data['main']['temp_max'], data['main']['pressure'], data['main']['humidity'],
    data['main']['sea_level'], data['main']['grnd_level'], data['visibility'], data['wind']['speed'],
    data['wind']['deg'], data['wind']['gust'], data['clouds']['all'], data['dt'], data['sys']['type'],
    data['sys']['id'], data['sys']['country'], data['sys']['sunrise'], data['sys']['sunset'],
    data['timezone'], data['id'], data['name'], data['cod'], datetime.datetime.fromtimestamp(data['dt'])
))
conn.commit()

# Close the database connection
conn.close()
$$;


CREATE OR REPLACE FUNCTION get_data_openapi_forecast()
RETURNS VOID
LANGUAGE plpython3u
AS $$
import urllib.request
import json
import psycopg2
import os

# Check if the url is read correctly
url = os.getenv('POSTGRES_OPENWEATHERLINK_FORECAST')
if url is None:
    raise ValueError(f'Enviroment variable POSTGRES_OPENWEATHERLINK_FORECAST not found')

# Open the URL and retrieve the data
with urllib.request.urlopen(url) as response:
    data = json.loads(response.read())

# Connect to the PostgreSQL database
conn = psycopg2.connect(
    dbname=os.getenv('POSTGRES_DB'),
    user=os.getenv('POSTGRES_USER'),
    password=os.getenv('POSTGRES_PASSWORD'),
    host='localhost'
)

# Insert the data into the specified table
cur = conn.cursor()
cod = data.get('cod')
message = data.get('message')
cnt = data.get('cnt')
city_id = data.get('city').get('id')
city_name = data.get('city').get('name')
city_lat = data.get('city').get('coord').get('lat')
city_lon = data.get('city').get('coord').get('lon')
city_country = data.get('city').get('country')
city_population = data.get('city').get('population')
city_timezone = data.get('city').get('timezone')
city_sunrise = data.get('city').get('sunrise')
city_sunset = data.get('city').get('sunset')

if cod is None or cod == "":
    cod = ''

if message is None:
    message = 'Message was empty'

if cnt is None:
    cnt = 0

if city_id is None:
    city_id = 0

if city_name is None or city_name == "":
    city_name = 'City Name was empty'

if city_lat is None:
    city_lat = 0.0

if city_lon is None:
    city_lon = 0.0

if city_country is None:
    city_country = 'City Country was empty'

if city_population is None:
    city_population = 0

if city_timezone is None:
    city_timezone = 0

if city_sunrise is None:
    city_sunrise = 0

if city_sunset is None:
    city_sunset = 0

for record in data['list']:
    dt = record.get('dt')

    mainHelp = record.get('main')
    temp = mainHelp.get('temp')
    feels_like = mainHelp.get('feels_like')
    temp_min = mainHelp.get('temp_min')
    temp_max = mainHelp.get('temp_max')
    pressure = mainHelp.get('pressure')
    sea_level = mainHelp.get('sea_level')
    grnd_level = mainHelp.get('grnd_level')
    humidity = mainHelp.get('humidity')
    temp_kf = mainHelp.get('temp_kf')

    weatherHelp = record.get('weather')[0]
    weather_id = weatherHelp.get('id')
    weather_main = weatherHelp.get('main')
    weather_description = weatherHelp.get('description')
    weather_icon = weatherHelp.get('icon')
    clouds_all = mainHelp.get('all')

    windHelp = record.get('wind')
    wind_speed = windHelp.get('speed')
    wind_deg = windHelp.get('deg')
    wind_gust = windHelp.get('gust')

    visibility = record.get('visibility')
    pop = record.get('pop')
    sys_pod = record.get('sys').get('pod')
    dt_txt = record.get('dt_txt')
    # Insert the record into the table
    cur.execute("""
    INSERT INTO weatherDataOpenAPIForecast (
        cod, message, cnt, city_id, city_name, city_lat, city_lon, city_country, city_population, city_timezone, city_sunrise, city_sunset,
        dt, temp, feels_like, temp_min, temp_max, pressure, sea_level, grnd_level, humidity, temp_kf,
        weather_id, weather_main, weather_description, weather_icon, clouds_all,
        wind_speed, wind_deg, wind_gust, visibility, pop, sys_pod, dt_txt
    ) VALUES (
        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
        %s, %s
    )
    """, (
    cod, message, cnt, city_id, city_name, city_lat, city_lon, city_country, city_population, city_timezone, city_sunrise, city_sunset,
    dt, temp, feels_like, temp_min, temp_max, pressure, sea_level, grnd_level, humidity, temp_kf,
    weather_id, weather_main, weather_description, weather_icon, clouds_all,
    wind_speed, wind_deg, wind_gust, visibility, pop, sys_pod, dt_txt
    ))
    conn.commit()
# Close the database connection
conn.close()
$$;
