/*code for creating tables which are needed for insertion and handling of data*/

CREATE TABLE weatherDataOpenAPICurrent(
    id SERIAL PRIMARY KEY,
    lon NUMERIC,
    lat NUMERIC,
    base TEXT,
    temp NUMERIC,
    feels_like NUMERIC,
    temp_min NUMERIC,
    temp_max NUMERIC,
    pressure NUMERIC,
    humidity NUMERIC,
    sea_level NUMERIC,
    grnd_level NUMERIC,
    visibility NUMERIC,
    speed NUMERIC,
    deg NUMERIC,
    gust NUMERIC,
    all_clouds NUMERIC,
    dt NUMERIC,
    type NUMERIC,
    sys_id NUMERIC,
    country TEXT,
    sunrise NUMERIC,
    sunset NUMERIC,
    timezone NUMERIC,
    city_id NUMERIC,
    city_name TEXT,
    cod NUMERIC,
    lastmodified TIMESTAMP
);

CREATE TABLE weatherDataOpenAPIForecast(
    id SERIAL PRIMARY KEY,
    cod NUMERIC,
    message TEXT,
    cnt NUMERIC,
    dt NUMERIC,
    temp NUMERIC,
    feels_like NUMERIC,
    temp_min NUMERIC,
    temp_max NUMERIC,
    pressure NUMERIC,
    sea_level NUMERIC,
    grnd_level NUMERIC,
    humidity NUMERIC,
    temp_kf NUMERIC,
    weather_id NUMERIC,
    weather_main TEXT,
    weather_description TEXT,
    weather_icon TEXT,
    clouds_all NUMERIC,
    wind_speed NUMERIC,
    wind_deg NUMERIC,
    wind_gust NUMERIC,
    visibility NUMERIC,
    pop NUMERIC,
    sys_pod TEXT,
    dt_txt TEXT,
    city_id NUMERIC,
    city_name TEXT,
    city_lat NUMERIC,
    city_lon NUMERIC,
    city_country TEXT,
    city_population NUMERIC,
    city_timezone NUMERIC,
    city_sunrise NUMERIC,
    city_sunset NUMERIC,
    lastmodified TIMESTAMP
);

CREATE TABLE weatherDataMetgisAPICurrent(
    id SERIAL PRIMARY KEY,
    description TEXT,
    forecast_calculated_local_time TEXT,
    forecast_calculated_utc TEXT,
    latitude NUMERIC,
    longitude NUMERIC,
    altitude NUMERIC,
    temperature NUMERIC,
    moon_phase TEXT,
    precipitation_total_intensity NUMERIC,
    precipitation_total_intensity_unit TEXT,
    precipitation_snow_intensity_unit TEXT,
    precipitation_rain_intensity_unit TEXT,
    weather_description TEXT,
    moon_rise TEXT,
    wind_speed NUMERIC,
    temperature_unit TEXT,
    sun_set TEXT,
    sun_rise TEXT,
    precipitation_snow_intensity NUMERIC,
    wind_speed_unit TEXT,
    moon_set TEXT,
    icon TEXT,
    wind_direction TEXT,
    precipitation_rain_intensity NUMERIC,
    wind_strength TEXT,
    lastmodified TIMESTAMP
);

CREATE TABLE weatherDataMetgisAPIForecast(
    id SERIAL PRIMARY KEY,
    forecastTimes_LocalTime TEXT,
    precipitationTotal_3hourlySum_Unit TEXT,
    precipitationProbability_Unit TEXT,
    temperature NUMERIC,
    precipitationSnow_3hourlySum_Unit TEXT,
    weatherDescription TEXT,
    totalCloudCover NUMERIC,
    precipitationRain_3hourlySum NUMERIC,
    windSpeed NUMERIC,
    precipitationRain_3hourlySum_Unit TEXT,
    temperature_Unit TEXT,
    precipitationProbability NUMERIC,
    thunderstormProbability TEXT,
    precipitationSnow_3hourlySum NUMERIC,
    windSpeed_Unit TEXT,
    precipitationTotal_3hourlySum NUMERIC,
    icon TEXT,
    windDirection TEXT,
    totalCloudCover_Unit TEXT,
    windStrength TEXT,
    lastmodified TIMESTAMP
);

CREATE TABLE weatherDataMetgisPrecipitationHistory(
    id SERIAL PRIMARY KEY,
    info TEXT,
    lon NUMERIC,
    lat NUMERIC,
    alt NUMERIC,
    date TEXT,
    hrp NUMERIC,
    info_hrp TEXT,
    info_lat TEXT,
    info_lon TEXT,
    info_alt TEXT,
    lastmodified TIMESTAMP
);

CREATE TABLE weatherDataMetgisRelHumidityHistory(
    id SERIAL PRIMARY KEY,
    info TEXT,
    lon NUMERIC,
    lat NUMERIC,
    alt NUMERIC,
    date TEXT,
    rh NUMERIC,
    info_rh TEXT,
    info_lat TEXT,
    info_lon TEXT,
    info_alt TEXT,
    lastmodified TIMESTAMP
);

CREATE TABLE weatherDataMetgisTemperatureHistory(
    id SERIAL PRIMARY KEY,
    info TEXT,
    lon NUMERIC,
    lat NUMERIC,
    alt NUMERIC,
    date TEXT,
    tmp NUMERIC,
    info_tmp TEXT,
    info_lat TEXT,
    info_lon TEXT,
    info_alt TEXT,
    lastmodified TIMESTAMP
);

CREATE TABLE weatherDataMetgisWindHistory(
    id SERIAL PRIMARY KEY,
    info TEXT,
    lon NUMERIC,
    lat NUMERIC,
    alt NUMERIC,
    date TEXT,
    wdir NUMERIC,
    wspd NUMERIC,
    info_wdir TEXT,
    info_wspd TEXT,
    info_lat TEXT,
    info_lon TEXT,
    info_alt TEXT,
    lastmodified TIMESTAMP
);

CREATE TABLE countryMapping(
    id SERIAL PRIMARY KEY,
    lat NUMERIC,
    lon NUMERIC,
    zipcode NUMERIC,
    place TEXT,
    lastmodified TIMESTAMP
);

CREATE OR REPLACE FUNCTION lastModifiedTrigger()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        NEW.lastmodified := DATE_TRUNC('second', CURRENT_TIMESTAMP);
        RETURN NEW;
    ELSIF TG_OP = 'UPDATE' THEN
        NEW.lastmodified := DATE_TRUNC('second', CURRENT_TIMESTAMP);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER changeweatherDataOpenAPICurrent
BEFORE INSERT OR UPDATE ON weatherDataOpenAPICurrent
FOR EACH ROW
EXECUTE FUNCTION lastModifiedTrigger();

CREATE TRIGGER changeweatherDataOpenAPIForecast
BEFORE INSERT OR UPDATE ON weatherDataOpenAPIForecast
FOR EACH ROW
EXECUTE FUNCTION lastModifiedTrigger();

CREATE TRIGGER changeweatherDataMetgisAPICurrent
BEFORE INSERT OR UPDATE ON weatherDataMetgisAPICurrent
FOR EACH ROW
EXECUTE FUNCTION lastModifiedTrigger();

CREATE TRIGGER changeweatherDataMetgisAPIForecast
BEFORE INSERT OR UPDATE ON weatherDataMetgisAPIForecast
FOR EACH ROW
EXECUTE FUNCTION lastModifiedTrigger();

CREATE TRIGGER changeweatherDataMetgisPrecipitationHistory
BEFORE INSERT OR UPDATE ON weatherDataMetgisPrecipitationHistory
FOR EACH ROW
EXECUTE FUNCTION lastModifiedTrigger();

CREATE TRIGGER changeweatherDataMetgisRelHumidityHistory
BEFORE INSERT OR UPDATE ON weatherDataMetgisRelHumidityHistory
FOR EACH ROW
EXECUTE FUNCTION lastModifiedTrigger();

CREATE TRIGGER changeweatherDataMetgisTemperatureHistory
BEFORE INSERT OR UPDATE ON weatherDataMetgisTemperatureHistory
FOR EACH ROW
EXECUTE FUNCTION lastModifiedTrigger();

CREATE TRIGGER changeweatherDataMetgisWindHistory
BEFORE INSERT OR UPDATE ON weatherDataMetgisWindHistory
FOR EACH ROW
EXECUTE FUNCTION lastModifiedTrigger();

CREATE TRIGGER changecountryMapping
BEFORE INSERT OR UPDATE ON countryMapping
FOR EACH ROW
EXECUTE FUNCTION lastModifiedTrigger();