SELECT *
FROM "divvy_aggregated_uncleaned"
WHERE 
	start_station_name IS NULL
	OR 
	end_station_name IS NULL
	OR 
	start_day IS NULL
	OR
	started_at IS NULL
	OR 
	ended_at IS NULL
	OR
	member_casual IS NULL
-- looks good!