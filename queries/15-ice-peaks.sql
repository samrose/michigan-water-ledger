-- key: icePeaks
-- store: clickhouse
-- shape: rows
-- datasets: glerl_ice_cover
-- about: Each winter and lake: [winter (the year it ends), lake, peak percent ice, first day at the peak, charted days at 10% or more]
SELECT winter,
       lake,
       round(max(ice_pct), 1) AS peak_pct,
       toString(argMin(date, (-ice_pct, date))) AS peak_day,
       countIf(ice_pct >= 10) AS days_10pct
FROM (
  SELECT if(toMonth(date) >= 9, toYear(date) + 1, toYear(date)) AS winter, lake, date, ice_pct
  FROM glerl_ice_cover
  WHERE ice_pct IS NOT NULL
)
GROUP BY winter, lake
ORDER BY winter, lake
