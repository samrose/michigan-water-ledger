-- key: cbpVsQcew
-- store: postgres
-- shape: object
-- datasets: measure_comparability
-- about: Whether the two job counts (Census CBP and BLS QCEW) may share a sentence, and whether that verdict was asserted or computed
SELECT verdict, source
FROM published.measure_comparability
WHERE measure_a = 'cbp_employment' AND measure_b = 'qcew_employment'
