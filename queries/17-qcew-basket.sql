-- key: qcewBasket
-- store: clickhouse
-- shape: rows
-- datasets: qcew_annual
-- about: Private employment in each water industry, 2023, for Michigan, each county and the no-county area: [area, NAICS, establishments, jobs, withheld]
SELECT area_fips,
       industry_code,
       annual_avg_estabs,
       annual_avg_emplvl,
       suppressed
FROM qcew_annual
WHERE year = 2023 AND own_code = '5' AND startsWith(area_fips, '26')
  AND industry_code IN ('1141', '2213', '3117', '3339', '3345', '3366', '483', '4872', '4883', '713930')
ORDER BY area_fips, industry_code
