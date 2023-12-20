SELECT COUNT(*)
FROM divvy_aggregated_uncleaned
WHERE ride_duration_s <= 0 -- 653 rows

-- delete these rows
DELETE FROM divvy_aggregated_uncleaned
WHERE ride_duration_s <= 0;