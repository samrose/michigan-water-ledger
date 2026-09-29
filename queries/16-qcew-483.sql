-- key: qcew483
-- store: clickhouse
-- shape: rows
-- datasets: qcew_annual
-- about: Private water transportation (NAICS 483), 2023, for Michigan, each county, and the establishments BLS assigns to no county (26999): [area, establishments, jobs, withheld]
SELECT area_fips,
       annual_avg_estabs,
       annual_avg_emplvl,
       suppressed
FROM qcew_annual
WHERE year = 2023 AND own_code = '5' AND industry_code = '483' AND startsWith(area_fips, '26')
ORDER BY annual_avg_emplvl DESC, area_fips
