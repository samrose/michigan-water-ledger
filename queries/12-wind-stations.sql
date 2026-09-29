-- key: windStations
-- store: clickhouse
-- shape: column
-- datasets: coops_wind
-- about: Michigan gauges with wind readings
SELECT DISTINCT station_id FROM coops_wind WHERE geo_id = '26' AND speed_ms IS NOT NULL ORDER BY station_id
