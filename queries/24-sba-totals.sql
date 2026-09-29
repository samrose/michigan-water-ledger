-- key: sbaTotals
-- store: postgres
-- shape: object
-- datasets: sba_loan_detail
-- about: Every SBA loan to a Michigan water business on file: loans, dollars approved, jobs estimated, first and last year, dollars SBA guaranteed
SELECT count(*) AS n, sum(gross_approval) AS usd, sum(jobs_supported) AS jobs,
       min(year) AS "from", max(year) AS "to", sum(sba_guaranteed) AS guaranteed
FROM published.sba_loan_detail
WHERE level = 'county' AND geo_id LIKE '26%'
  AND (naics = '713930' OR naics LIKE '3366%' OR naics LIKE '483%' OR naics LIKE '4883%'
       OR naics LIKE '4872%' OR naics LIKE '1141%' OR naics LIKE '3117%' OR naics LIKE '2213%')
