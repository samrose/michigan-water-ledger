-- key: cbpVsQcewReason
-- store: postgres
-- shape: value
-- datasets:
-- about: The registry's stated reason for that verdict
SELECT reason
FROM registry.comparability
WHERE measure_a = 'cbp_employment' AND measure_b = 'qcew_employment'
