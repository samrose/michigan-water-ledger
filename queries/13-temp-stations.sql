-- key: tempStations
-- store: clickhouse
-- shape: column
-- datasets: coops_water_temperature
-- about: Michigan gauges with water-temperature readings
SELECT DISTINCT station_id FROM coops_water_temperature WHERE geo_id = '26' AND value_c IS NOT NULL ORDER BY station_id
