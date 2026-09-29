-- key: docksByCounty
-- store: postgres
-- shape: map
-- datasets: usace_docks
-- about: Docks on the Army Corps list in each Michigan county
SELECT geo_id, count(*) AS n
FROM published.usace_docks
WHERE state = 'MI' AND geo_id <> ''
GROUP BY geo_id
