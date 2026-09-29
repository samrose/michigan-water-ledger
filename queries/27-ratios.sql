-- key: ratios
-- store: postgres
-- shape: objects
-- datasets: water_economy_ratios
-- about: How specialised Michigan and its counties are in each freshwater sector (location quotient, 1.0 = national share), and the 2020-2023 change split into national growth, industry mix and local shift
SELECT geo_id AS geo, level, segment AS seg, cbp_employment AS emp,
       round(location_quotient::numeric, 4) AS lq, employment_change AS change,
       round(national_growth::numeric, 2) AS ng, round(industry_mix::numeric, 2) AS im,
       round(local_shift::numeric, 2) AS ls, shift_complete AS complete
FROM published.water_economy_ratios
WHERE year = 2023 AND (geo_id = '26' OR geo_id LIKE '26___')
ORDER BY level DESC, geo_id, segment
