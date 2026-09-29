-- key: sbaByCounty
-- store: postgres
-- shape: objects
-- datasets: sba_loan_detail
-- about: SBA 7(a) and 504 loans to water businesses by Michigan county and industry group, every year on file: loans, dollars approved, jobs the borrower estimated
WITH water AS (
  SELECT geo_id, gross_approval, jobs_supported,
         CASE
           WHEN naics = '713930' THEN 'marinas'
           WHEN naics LIKE '3366%' THEN 'boat & ship building'
           WHEN naics LIKE '483%' OR naics LIKE '4883%' THEN 'water transport & port services'
           WHEN naics LIKE '4872%' THEN 'scenic & sightseeing water'
           WHEN naics LIKE '1141%' OR naics LIKE '3117%' THEN 'fishing & seafood'
           WHEN naics LIKE '2213%' THEN 'water & sewer utilities'
         END AS grp
  FROM published.sba_loan_detail
  WHERE level = 'county' AND geo_id LIKE '26%'
)
SELECT geo_id AS geo, grp AS "group", count(*) AS n, sum(gross_approval) AS usd, sum(jobs_supported) AS jobs
FROM water
WHERE grp IS NOT NULL
GROUP BY geo_id, grp
ORDER BY geo_id, grp
