-- key: calls
-- store: postgres
-- shape: objects
-- datasets: port_calls, ais_positions
-- about: Vessel calls AIS saw at each Michigan port over the observed days; cargo = AIS vessel types 70-79 with arrival and departure both seen, as the tons-per-call rate counts them
SELECT port_code AS code,
       regexp_replace(port_name, ', MI$', '') AS name,
       count(*) AS calls,
       count(*) FILTER (WHERE vessel_type BETWEEN 70 AND 79
                         AND arrival_observed AND departure_observed) AS cargo,
       count(DISTINCT mmsi) AS vessels
FROM published.port_calls
WHERE port_name LIKE '%, MI'
GROUP BY port_code, port_name
ORDER BY calls DESC, code
