-- key: temp
-- store: clickhouse
-- shape: rows
-- datasets: coops_water_temperature
-- about: Monthly water temperature at each Michigan gauge that has a thermometer: [gauge, month, mean °C, minimum °C]
SELECT station_id,
       toString(toStartOfMonth(t)) AS month,
       round(avg(value_c), 2) AS mean_c,
       round(min(value_c), 1) AS min_c
FROM coops_water_temperature
WHERE geo_id = '26' AND value_c IS NOT NULL
GROUP BY station_id, month
ORDER BY station_id, month
