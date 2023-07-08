/* explain short meanings!*/

CREATE VIEW weatherHistoryDataView AS
SELECT
    w.date,
    w.lon,
    w.lat,
    w.alt,
    w.hrp,
    r.rh,
    t.tmp,
    d.wdir,
    d.wspd
FROM
    weatherDataMetgisPrecipitationHistory w
    JOIN weatherDataMetgisRelHumidityHistory r ON w.date = r.date
    JOIN weatherDataMetgisTemperatureHistory t ON w.date = t.date
    JOIN weatherDataMetgisWindHistory d ON w.date = d.date;


CREATE VIEW forecastDataView AS
WITH
hour_0 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 0
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_1 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 1
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_2 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 2
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_3 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 3
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_4 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 4
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_5 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 5
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_6 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 6
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_7 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 7
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_8 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 8
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_9 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 9
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_10 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 10
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_11 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 11
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_12 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 12
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_13 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 13
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_14 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 14
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_15 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 15
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_16 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 16
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_17 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 17
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_18 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 18
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_19 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 19
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_20 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 20
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_21 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 21
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_22 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 22
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
),
hour_23 AS (
    SELECT
		wdoaf.id AS wdoaf_id,
		wdmf.id AS wdmf_id,
        DATE_TRUNC('hour', wdoaf.dt_txt) AS date,
        wdoaf.city_name,
        ROUND(AVG((wdoaf.temp + wdmf.temperature) / 2), 2) AS avg_temp,
		ROUND(AVG((wdoaf.wind_speed + wdmf.windSpeed) / 2), 2) AS avg_windspeed,
		wdoaf.humidity,
		wdoaf.pressure,
		CONCAT(wdoaf.weather_description, ' - ', wdmf.weatherDescription) AS weather_description
    FROM
        weatherDataOpenAPIForecast AS wdoaf
    JOIN
        weatherDataMetgisAPIForecast AS wdmf ON DATE_TRUNC('hour', wdoaf.dt_txt) = DATE_TRUNC('hour', wdmf.forecastTimes_LocalTime)
    WHERE
        EXTRACT(HOUR FROM wdoaf.dt_txt) = 23
    GROUP BY
        date,
		wdoaf_id,
		wdmf_id,
        wdoaf.city_name,
		wdoaf.pressure,
		wdoaf.humidity,
        wdoaf.weather_description,
        wdmf.weatherDescription
)

Select * from hour_0
UNION ALL
Select * from hour_1
UNION ALL
Select * from hour_2
UNION ALL
Select * from hour_3
UNION ALL
Select * from hour_4
UNION ALL
Select * from hour_5
UNION ALL
Select * from hour_6
UNION ALL
Select * from hour_7
UNION ALL
Select * from hour_8
UNION ALL
Select * from hour_9
UNION ALL
Select * from hour_10
UNION ALL
Select * from hour_11
UNION ALL
Select * from hour_12
UNION ALL
Select * from hour_13
UNION ALL
Select * from hour_14
UNION ALL
Select * from hour_15
UNION ALL
Select * from hour_16
UNION ALL
Select * from hour_17
UNION ALL
Select * from hour_18
UNION ALL
Select * from hour_19
UNION ALL
Select * from hour_20
UNION ALL
Select * from hour_21
UNION ALL
Select * from hour_22
UNION ALL
Select * from hour_23;
