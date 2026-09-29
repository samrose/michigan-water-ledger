-- key: soo
-- store: capture_clickhouse
-- shape: rows
-- datasets: lpms_lock_transits
-- about: Soo Locks (St. Marys Falls, lock H7-SM-01), each day: [day, lockages, median wait to enter (min), 90th-percentile wait (min), both interpolated, distinct vessels]
SELECT toString(toDate(arrived_at)) AS day,
       count() AS lockages,
       toInt32(round(quantileExactInclusive(0.5)(queue_minutes))) AS wait_median,
       toInt32(round(quantileExactInclusive(0.9)(queue_minutes))) AS wait_p90,
       uniqExact(vessel_no) AS vessels
FROM lpms_lock_transits FINAL
WHERE eroc = 'H7' AND river_code = 'SM' AND lock_no = '01'
GROUP BY day
ORDER BY day
