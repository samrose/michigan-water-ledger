-- key: wind
-- store: clickhouse
-- shape: rows
-- datasets: coops_wind
-- about: Monthly wind at each Michigan gauge that has an anemometer: [gauge, month, mean speed m/s, peak gust m/s, share of readings at or above 10.8 m/s, the Small Craft Advisory threshold]
SELECT station_id,
       toString(toStartOfMonth(t)) AS month,
       round(avg(speed_ms), 2) AS mean_ms,
       round(max(gust_ms), 1) AS peak_gust_ms,
       round(countIf(speed_ms >= 10.8) / count(speed_ms), 3) AS small_craft_share
FROM coops_wind
WHERE geo_id = '26' AND speed_ms IS NOT NULL
GROUP BY station_id, month
ORDER BY station_id, month
