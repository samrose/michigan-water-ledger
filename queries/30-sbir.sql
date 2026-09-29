-- key: sbir
-- store: postgres
-- shape: objects
-- datasets: sbir_award_detail
-- about: SBIR and STTR research awards to Michigan companies that a freshwater topic rule admits, every year on file
SELECT company, title, agency, segment AS seg, year, amount, matched_rule AS rule, zcta
FROM published.sbir_award_detail
WHERE topic = 'freshwater' AND geo_id LIKE '26%'
ORDER BY year DESC, amount DESC, company
