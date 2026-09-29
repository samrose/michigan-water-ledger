-- key: sbirTotals
-- store: postgres
-- shape: object
-- datasets: sbir_award_detail
-- about: Freshwater SBIR/STTR awards: Michigan's count, dollars and companies, the national count, and Michigan's awards since 2020
SELECT count(*) FILTER (WHERE mi) AS n,
       sum(amount) FILTER (WHERE mi) AS usd,
       count(DISTINCT company) FILTER (WHERE mi) AS companies,
       count(*) AS national_n,
       count(*) FILTER (WHERE mi AND year >= 2020) AS recent_n
FROM (SELECT *, geo_id LIKE '26%' AS mi FROM published.sbir_award_detail WHERE topic = 'freshwater') s
