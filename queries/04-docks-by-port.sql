-- key: docksByPort
-- store: postgres
-- shape: map
-- datasets: usace_docks
-- about: Docks on the Army Corps list for each Michigan port: how many, how many give a berth depth, how many list commodities
SELECT port_code,
       count(*) AS n,
       count(*) FILTER (WHERE depth_min_ft IS NOT NULL OR depth_max_ft IS NOT NULL) AS depth,
       count(*) FILTER (WHERE coalesce(commodities, '') <> '') AS commodities
FROM published.usace_docks
WHERE state = 'MI' AND port_code IS NOT NULL AND port_code <> ''
GROUP BY port_code
