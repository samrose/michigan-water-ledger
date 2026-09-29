-- key: awardsTotals
-- store: postgres
-- shape: object
-- datasets: fed_assistance_awards
-- about: FY2025 freshwater awards: Michigan's count, dollars and recipients, the national count and dollars, and the agencies that made Michigan's
SELECT count(*) FILTER (WHERE mi) AS n,
       sum(amount) FILTER (WHERE mi) AS usd,
       count(DISTINCT recipient_name) FILTER (WHERE mi) AS recipients,
       count(*) AS national_n,
       sum(amount) AS national_usd,
       array_agg(DISTINCT agency ORDER BY agency) FILTER (WHERE mi) AS agencies
FROM (SELECT *, geo_id LIKE '26%' AS mi FROM published.fed_assistance_awards
      WHERE topic = 'freshwater' AND year = 2025) a
