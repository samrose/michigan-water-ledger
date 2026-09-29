-- key: iceBasin
-- store: clickhouse
-- shape: rows
-- datasets: glerl_ice_cover
-- about: Percent of the whole Great Lakes basin under ice on each charted day: [day, percent]
SELECT toString(date), round(ice_pct, 2)
FROM glerl_ice_cover
WHERE lake = 'Great Lakes' AND ice_pct IS NOT NULL
ORDER BY date
