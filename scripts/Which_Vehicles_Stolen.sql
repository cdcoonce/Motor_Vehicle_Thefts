-- 1. Find the vehicle types that are most often and least often stolen
	(SELECT vehicle_type, COUNT(*)
	FROM stolen_vehicles
    GROUP BY vehicle_type
    ORDER BY COUNT(*) DESC
    LIMIT 5)
    UNION
	(SELECT vehicle_type, COUNT(*)
	FROM stolen_vehicles
    GROUP BY vehicle_type
    ORDER BY COUNT(*)
    LIMIT 2);
    
-- 2. For each vehicle type, find the average age of the cars that are stolen
	SELECT vehicle_type, AVG(YEAR(date_stolen) - model_year) AS Average_Age
	FROM stolen_vehicles
    GROUP BY vehicle_type
    ORDER BY Average_Age DESC;

-- 3. For each vehicle type, find the percent of vehicles stolen that are luxury versus standard
	WITH lux_standard AS
		(SELECT 
			vehicle_type,
			CASE
				WHEN make_type = 'Luxury' THEN 1 
				ELSE 0
			END AS luxury,
			1 AS all_cars
		FROM stolen_vehicles sv
		LEFT JOIN make_details md
		ON sv.make_id = md.make_id)
        
	SELECT vehicle_Type, SUM(luxury)/ SUM(all_cars) * 100 AS percent_luxury
    FROM lux_standard
    GROUP BY vehicle_type
    ORDER BY percent_luxury DESC;


-- 4. Create a table where the rows represent the top 10 vehicle types, the columns represent the top 7 vehicle colors (plus 1 column for all other colors) and the values are the number of vehicles stolen
SELECT color, COUNT(color)
FROM stolen_vehicles
GROUP BY color
ORDER BY COUNT(color) DESC;


SELECT 
	vehicle_type,
    COUNT(vehicle_type) as num_vehicles,
    SUM(CASE WHEN color = 'Silver' THEN 1 ELSE 0 END) AS Silver,
	SUM(CASE WHEN color = 'White' THEN 1 ELSE 0 END) AS White,
    SUM(CASE WHEN color = 'Black' THEN 1 ELSE 0 END) AS Black,
    SUM(CASE WHEN color = 'Blue' THEN 1 ELSE 0 END) AS Blue,
    SUM(CASE WHEN color = 'Red' THEN 1 ELSE 0 END) AS Red,
    SUM(CASE WHEN color = 'Grey' THEN 1 ELSE 0 END) AS Grey,
    SUM(CASE WHEN color = 'Green' THEN 1 ELSE 0 END) AS Green,
    SUM(CASE WHEN color NOT IN ('Silver', 'White', 'Black', 'Blue', 'Red', 'Grey', 'Green') THEN 1 ELSE 0 END) AS Other
FROM stolen_vehicles
GROUP BY vehicle_type
ORDER BY num_vehicles DESC
LIMIT 10;