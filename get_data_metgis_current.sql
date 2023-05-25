CREATE OR REPLACE FUNCTION get_data_metgis_current()
RETURNS VOID
LANGUAGE plpython3u
AS $$
import urllib.request
import json
import psycopg2
import os

# Check if the url is read correctly
url = os.getenv('POSTGRES_METGISLINK_CURRENT')
if url is None:
    raise ValueError(f'Enviroment variable POSTGRES_METGISLINK_CURRENT not found')

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
cur.execute("""
    INSERT INTO weatherDataMetgisAPICurrent (
        description, forecast_calculated_local_time, forecast_calculated_utc,
        latitude, longitude, altitude, temperature, moon_phase,
        precipitation_total_intensity, precipitation_total_intensity_unit,
        precipitation_snow_intensity_unit, precipitation_rain_intensity_unit,
        weather_description, moon_rise, wind_speed, temperature_unit,
        sun_set, sun_rise, precipitation_snow_intensity, wind_speed_unit,
        moon_set, icon, wind_direction, precipitation_rain_intensity,
        wind_strength
    ) VALUES (
        %s, %s, %s,
        %s, %s, %s, %s, %s,
        %s, %s,
        %s, %s,
        %s, %s, %s, %s,
        %s, %s, %s, %s,
        %s, %s, %s, %s,
        %s
    )
""", (
    data['Info']['Description'],
    data['Info']['Forecast_Calculated_LocalTime'],
    data['Info']['Forecast_Calculated_UTC'],
    data['Info']['Latitude'],
    data['Info']['Longitude'],
    data['Info']['Altitude_[m]'],
    data['Current']['Temperature'],
    data['Current']['MoonPhase'],
    data['Current']['PrecipitationTotal_Intensity'],
    data['Current']['PrecipitationTotal_Intensity_Unit'],
    data['Current']['PrecipitationSnow_Intensity_Unit'],
    data['Current']['PrecipitationRain_Intensity_Unit'],
    data['Current']['WeatherDescription'],
    data['Current']['MoonRise'],
    data['Current']['WindSpeed'],
    data['Current']['Temperature_Unit'],
    data['Current']['SunSet'],
    data['Current']['SunRise'],
    data['Current']['PrecipitationSnow_Intensity'],
    data['Current']['WindSpeed_Unit'],
    data['Current']['MoonSet'],
    data['Current']['Icon'],
    data['Current']['WindDirection'],
    data['Current']['PrecipitationRain_Intensity'],
    data['Current']['WindStrength']
))


conn.commit()

# Close the database connection
conn.close()
$$;
