-- key: sbaByYear
-- store: postgres
-- shape: objects
-- datasets: sba_loan_detail
-- about: SBA loans to Michigan water businesses by approval year since 2010: loans and dollars approved
SELECT year, count(*) AS n, sum(gross_approval) AS usd
FROM published.sba_loan_detail
WHERE level = 'county' AND geo_id LIKE '26%' AND year >= 2010
  AND (naics = '713930' OR naics LIKE '3366%' OR naics LIKE '483%' OR naics LIKE '4883%'
       OR naics LIKE '4872%' OR naics LIKE '1141%' OR naics LIKE '3117%' OR naics LIKE '2213%')
GROUP BY year
ORDER BY year
