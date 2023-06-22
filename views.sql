CREATE VIEW weatherDataView AS
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
