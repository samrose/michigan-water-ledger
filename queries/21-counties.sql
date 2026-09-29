-- key: counties
-- store: postgres
-- shape: map
-- datasets: geography
-- about: Michigan county names by FIPS code
SELECT geo_id, regexp_replace(name, ' County, MI$', '') AS name
FROM published.geography
WHERE level = 'county' AND state_fips = '26'
