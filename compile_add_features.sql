CREATE TABLE divvy_aggregated_uncleaned AS
WITH
	temp_data AS (        -- consolidate data
		SELECT *
		FROM "202101_divvy_tripdata"
		UNION ALL 
		SELECT *
		FROM "202102_divvy_tripdata"
		UNION ALL 
		SELECT *
		FROM "202103_divvy_tripdata"
		UNION ALL 
		SELECT *
		FROM "202104_divvy_tripdata"
		UNION ALL 
		SELECT *
		FROM "202105_divvy_tripdata"
		UNION ALL
		SELECT *
		FROM "202106_divvy_tripdata"
		UNION ALL 
		SELECT *
		FROM "202107_divvy_tripdata"
		UNION ALL 
		SELECT *
		FROM "202108_divvy_tripdata"
		UNION ALL 
		SELECT *
		FROM "202109_divvy_tripdata"
		UNION ALL 
		SELECT *
		FROM "202110_divvy_tripdata"
		UNION ALL 
		SELECT *
		FROM "202111_divvy_tripdata"
		UNION ALL 
		SELECT *
		FROM "202112_divvy_tripdata"
		),
	features AS (
	    SELECT  
	      ride_id,
	      strftime('%s', ended_at) - strftime('%s', started_at) AS ride_duration_s,
	      ROUND((strftime('%s', ended_at) - strftime('%s', started_at)) / 60.0) AS ride_duration_m,
	      CASE
            WHEN strftime('%w', started_at) = '0' THEN 'Sunday'
            WHEN strftime('%w', started_at) = '1' THEN 'Monday'
            WHEN strftime('%w', started_at) = '2' THEN 'Tuesday'
            WHEN strftime('%w', started_at) = '3' THEN 'Wednesday'
            WHEN strftime('%w', started_at) = '4' THEN 'Thursday'
            WHEN strftime('%w', started_at) = '5' THEN 'Friday'
            WHEN strftime('%w', started_at) = '6' THEN 'Saturday'
            END AS start_day,
	      CASE
      	    WHEN strftime('%m', started_at) = '01' THEN 'January'
            WHEN strftime('%m', started_at) = '02' THEN 'February'
            WHEN strftime('%m', started_at) = '03' THEN 'March'
            WHEN strftime('%m', started_at) = '04' THEN 'April'
            WHEN strftime('%m', started_at) = '05' THEN 'May'
            WHEN strftime('%m', started_at) = '06' THEN 'June'
            WHEN strftime('%m', started_at) = '07' THEN 'July'
            WHEN strftime('%m', started_at) = '08' THEN 'August'
            WHEN strftime('%m', started_at) = '09' THEN 'September'
            WHEN strftime('%m', started_at) = '10' THEN 'October'
            WHEN strftime('%m', started_at) = '11' THEN 'November'
            WHEN strftime('%m', started_at) = '12' THEN 'December'
	      END AS month_name
	    FROM temp_data
		)
-- join consolidated table with newly created features
SELECT        
  a.ride_id,
  a.rideable_type,
  a.started_at,
  a.ended_at,
  a.start_lat,
  a.start_lng, 
  a.end_lat,
  a.end_lng,
  a.start_station_name,
  a.end_station_name,
  a.member_casual,
  b.ride_duration_s,
  b.ride_duration_m,
  b.start_day,
  b.month_name
FROM
  temp_data AS a       -- consolidated data
JOIN
  features AS b        -- new features
ON a.ride_id = b.ride_id
