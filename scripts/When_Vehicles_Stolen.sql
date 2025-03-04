-- 1. Find the number of vehicles stolen each year.
	SELECT 
		YEAR(date_stolen) AS 'Year Stolen',
		COUNT(YEAR(date_stolen)) AS 'Number of stolen vehicles'
	FROM
		stolen_vehicles
	GROUP BY
		YEAR(date_stolen);

-- 2. Find the number of vehicles stolen each month
	SELECT
		YEAR(date_stolen) AS 'Year Stolen',
		MONTH(date_stolen) AS 'Month Stolen',
		COUNT(*) AS 'Number of stolen vehicles'
	FROM
		stolen_vehicles
	GROUP BY
		YEAR(date_stolen),
		MONTH(date_stolen)
	ORDER BY
		YEAR(date_stolen);

-- 3. Find the number of vehicles stolen each day of the week
	SELECT 
		DAYOFWEEK(date_stolen) AS 'Day of Week',
		COUNT(*) AS 'Number of stolen vehicles'
	FROM
		stolen_vehicles
	GROUP BY
		DAYOFWEEK(date_stolen)
	ORDER BY
		DAYOFWEEK(date_stolen);

-- 4. Replace the numeric day of the week values with the full name of each day of the week
	SELECT
		DAYOFWEEK(date_stolen) AS 'Day of Week',
		CASE
			WHEN DAYOFWEEK(date_stolen) = 1 THEN 'Sunday'
            WHEN DAYOFWEEK(date_stolen) = 2 THEN 'Monday'
            WHEN DAYOFWEEK(date_stolen) = 3 THEN 'Tuesday'
            WHEN DAYOFWEEK(date_stolen) = 4 THEN 'Wednesday'
            WHEN DAYOFWEEK(date_stolen) = 5 THEN 'Thursday'
            WHEN DAYOFWEEK(date_stolen) = 6 THEN 'Friday'
            ELSE 'Saturday' 
		END AS Day_of_Week,
		COUNT(*) AS 'Number of stolen vehicles'
	FROM
		stolen_vehicles
	GROUP BY
		DAYOFWEEK(date_stolen), Day_of_Week
	ORDER BY
		DAYOFWEEK(date_stolen);