-- key: sooTotals
-- store: capture_clickhouse
-- shape: row
-- datasets: lpms_lock_transits, lpms_vessels
-- about: Soo Locks over the whole capture: [lockages, distinct vessels, median lockage time (min), lockages that waited over an hour, first day, last day]
SELECT count(),
       uniqExact(vessel_no),
       toInt32(round(quantileExactInclusive(0.5)(lockage_minutes))),
       countIf(queue_minutes > 60),
       toString(min(toDate(arrived_at))),
       toString(max(toDate(arrived_at)))
FROM lpms_lock_transits FINAL
WHERE eroc = 'H7' AND river_code = 'SM' AND lock_no = '01'
