-- key: tonnage
-- store: postgres
-- shape: objects
-- datasets: wcsc_port_tonnage
-- about: Michigan's principal ports by 2023 cargo tonnage, split domestic and foreign (short tons)
SELECT port_code AS code,
       regexp_replace(port_name, ', MI$', '') AS name,
       total_tons AS total,
       domestic_tons AS domestic,
       foreign_tons AS foreign,
       rank
FROM published.wcsc_port_tonnage
WHERE port_name LIKE '%, MI' AND year = 2023
ORDER BY total_tons DESC
