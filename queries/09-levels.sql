-- key: levels
-- store: clickhouse
-- shape: rows
-- datasets: coops_water_levels
-- about: Monthly mean water level at each Michigan gauge, metres on the International Great Lakes Datum: [gauge, month, mean]
SELECT station_id,
       toString(toStartOfMonth(t)) AS month,
       round(avg(value_m), 3) AS mean_m
FROM coops_water_levels
WHERE geo_id = '26' AND datum = 'IGLD' AND value_m IS NOT NULL
GROUP BY station_id, month
ORDER BY station_id, month
