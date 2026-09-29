-- key: cbpBasket
-- store: postgres
-- shape: objects
-- datasets: cbp_annual
-- about: Census County Business Patterns for the water industries, 2023, Michigan and its counties: establishments, jobs (with Census's noise flag) and establishments by employee-size class. Water transportation is its two 4-digit parts (4831 Great Lakes and coastal, 4832 inland), never also the 483 total, which the page would double-count
SELECT geo_id AS geo, segment AS seg,
       establishments AS est, employment AS emp, emp_flag AS flag, emp_suppressed AS sup,
       est_lt5 AS lt5, est_5_9 AS s5, est_10_19 AS s10, est_20_49 AS s20, est_50_99 AS s50,
       est_100_249 AS s100, est_250_499 AS s250, est_500_999 AS s500
FROM published.cbp_annual
WHERE year = 2023 AND (geo_id = '26' OR geo_id LIKE '26___')
  AND segment IN ('1141', '2213', '3117', '3339', '3345', '3366', '4831', '4832', '4872', '4883', '713930')
ORDER BY geo_id, segment
