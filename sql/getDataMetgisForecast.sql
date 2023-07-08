CREATE OR REPLACE FUNCTION get_data_metgis_forecast()
RETURNS VOID
LANGUAGE plpython3u
AS $$
import urllib.request
import json
import psycopg2
import os
import datetime

# Check if the url is read correctly
url = os.getenv('POSTGRES_METGISLINK_FORECAST')
if url is None:
    raise ValueError(f'Enviroment variable POSTGRES_METGISLINK_FORECAST not found')

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
forecast_threehourly = data.get('Forecast_3hourly')
helperEnd = len(forecast_threehourly.get('ForecastTimes_LocalTime'))
for i in range(helperEnd):
    datetime_obj = datetime.datetime.fromisoformat(forecast_threehourly.get('ForecastTimes_LocalTime')[i])
    formatted_datetime = datetime_obj.strftime("%Y-%m-%d %H:%M:%S")
    forecastTimes_LocalTime = formatted_datetime
    precipitationTotal_3hourlySum_Unit = forecast_threehourly.get('PrecipitationTotal_3hourlySum_Unit')
    precipitationProbability_Unit = forecast_threehourly.get('PrecipitationProbability_Unit')
    temperature = forecast_threehourly.get('Temperature')[i]
    precipitationSnow_3hourlySum_Unit = forecast_threehourly.get('PrecipitationSnow_3hourlySum_Unit')
    weatherDescription = forecast_threehourly.get('WeatherDescription')[i]
    totalCloudCover = forecast_threehourly.get('TotalCloudCover')[i]
    precipitationRain_3hourlySum = forecast_threehourly.get('PrecipitationRain_3hourlySum')[i]
    windSpeed = forecast_threehourly.get('WindSpeed')[i]
    precipitationRain_3hourlySum_Unit = forecast_threehourly.get('PrecipitationRain_3hourlySum_Unit')
    temperature_Unit = forecast_threehourly.get('Temperature_Unit')
    precipitationProbability = forecast_threehourly.get('PrecipitationProbability')[i]
    thunderstormProbability = forecast_threehourly.get('ThunderstormProbability')[i]
    precipitationSnow_3hourlySum = forecast_threehourly.get('PrecipitationSnow_3hourlySum')[i]
    windSpeed_Unit = forecast_threehourly.get('WindSpeed_Unit')
    precipitationTotal_3hourlySum = forecast_threehourly.get('PrecipitationTotal_3hourlySum')[i]
    icon = forecast_threehourly.get('Icon')[i]
    windDirection = forecast_threehourly.get('WindDirection')[i]
    totalCloudCover_Unit = forecast_threehourly.get('TotalCloudCover_Unit')
    windStrength = forecast_threehourly.get('WindStrength')[i]
    cur.execute("""
    INSERT INTO weatherDataMetgisAPIForecast (
        forecastTimes_LocalTime,
        precipitationTotal_3hourlySum_Unit,
        precipitationProbability_Unit,
        temperature,
        precipitationSnow_3hourlySum_Unit,
        weatherDescription,
        totalCloudCover,
        precipitationRain_3hourlySum,
        windSpeed,
        precipitationRain_3hourlySum_Unit,
        temperature_Unit,
        precipitationProbability,
        thunderstormProbability,
        precipitationSnow_3hourlySum,
        windSpeed_Unit,
        precipitationTotal_3hourlySum,
        icon,
        windDirection,
        totalCloudCover_Unit,
        windStrength
    ) VALUES (
        %s, %s, %s, %s, %s, %s, %s, %s, %s,
        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
        %s
        )
    """, (
            forecastTimes_LocalTime, precipitationTotal_3hourlySum_Unit, precipitationProbability_Unit, temperature, precipitationSnow_3hourlySum_Unit,
            weatherDescription, totalCloudCover, precipitationRain_3hourlySum, windSpeed, precipitationRain_3hourlySum_Unit, temperature_Unit,
            precipitationProbability, thunderstormProbability, precipitationSnow_3hourlySum, windSpeed_Unit, precipitationTotal_3hourlySum,
            icon, windDirection, totalCloudCover_Unit, windStrength
    ))
    conn.commit()
# Close the database connection
conn.close()
$$;
