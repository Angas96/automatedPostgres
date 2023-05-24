/*code for creating tables which are needed for insertion and handling of data*/

CREATE TABLE weatherDataOpenAPI(
    id SERIAL PRIMARY KEY,
    lon NUMERIC,
    lat NUMERIC,
    base VARCHAR(50),
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
    country VARCHAR(10),
    sunrise NUMERIC,
    sunset NUMERIC,
    timezone NUMERIC,
    city_id NUMERIC,
    city_name VARCHAR(50),
    cod NUMERIC
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
    wind_strength TEXT
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
    info_alt TEXT
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
    info_alt TEXT
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
    info_alt TEXT
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
    info_alt TEXT
);
