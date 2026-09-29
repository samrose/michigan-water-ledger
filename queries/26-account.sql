-- key: account
-- store: postgres
-- shape: objects
-- datasets: water_economy_account
-- about: The freshwater economy counted, 2023, for Michigan and each county, sector by sector: BLS jobs and wages with their suppression status, the Census CBP count beside it, aquaculture from the Census of Agriculture
SELECT geo_id AS geo, level, year, segment AS seg, sector,
       qcew_establishments AS est, qcew_employment AS emp, qcew_employment_status AS status,
       qcew_withheld_cells AS withheld_cells, qcew_wages AS wages, qcew_wages_status AS wstatus,
       cbp_employment AS cbp, cbp_employment_noise AS noise, cbp_employment_lo AS lo, cbp_employment_hi AS hi,
       aquaculture_farms AS aq_farms, aquaculture_sales AS aq_sales
FROM published.water_economy_account
WHERE year = 2023 AND level IN ('state', 'county') AND (geo_id = '26' OR geo_id LIKE '26___')
ORDER BY level DESC, geo_id, segment
