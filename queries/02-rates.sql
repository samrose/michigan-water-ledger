-- key: rates
-- store: postgres
-- shape: objects
-- datasets: port_call_rates, port_calls, ais_positions
-- about: Tons per cargo-vessel call at each Michigan port, from the AIS days observed; a floor, not an annual figure
SELECT port_code AS code,
       regexp_replace(port_name, ', MI$', '') AS name,
       cargo_calls AS calls,
       observed_days AS days,
       round(tons_per_call::numeric, 1) AS tpc,
       round(median_dwell_hours::numeric, 2) AS dwell,
       dwell_implausible AS implausible
FROM published.port_call_rates
WHERE port_name LIKE '%, MI' AND year = 2023
ORDER BY tons_per_call DESC
