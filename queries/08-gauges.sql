-- key: gauges
-- store: postgres
-- shape: objects
-- datasets: coops_stations
-- about: NOAA water-level gauges on the Great Lakes in Michigan
SELECT station_id AS id, name, lat, lon
FROM published.coops_stations
WHERE state = 'MI' AND great_lakes
ORDER BY name
