-- 1. Find the number of vehicles that were stolen in each region
	SELECT region, COUNT(vehicle_type) AS num_vehicles
    FROM stolen_vehicles sv
    LEFT JOIN locations l
    ON sv.location_id = l.location_id
    GROUP BY region;

-- 2. Combine the previous output with the population and density statistics for each region
	SELECT region,  population, density, COUNT(vehicle_type) AS num_vehicles
    FROM stolen_vehicles sv
    LEFT JOIN locations l
    ON sv.location_id = l.location_id
    GROUP BY region, population, density;

-- 3. Do the types of vehicles in the three most dense regions differ from the three least dense regions?
	SELECT region,  population, density, COUNT(vehicle_type) AS num_vehicles
    FROM stolen_vehicles sv
    LEFT JOIN locations l
    ON sv.location_id = l.location_id
    GROUP BY region, population, density
    ORDER BY density DESC;
    
-- 'Auckland','1695200','343.09','1626'
-- 'Nelson','54500','129.15','92'
-- 'Wellington','543500','67.52','417'

-- 'Otago','246000','7.89','137'
-- 'Gisborne','52100','6.21','175'
-- 'Southland','102400','3.28','26'

	(SELECT 'High Density', vehicle_type, COUNT(vehicle_id) AS num_vehicles
    FROM stolen_vehicles sv
    LEFT JOIN locations l
    ON sv.location_id = l.location_id
    WHERE region IN ('Auckland', 'Nelson', 'Wellington')
    GROUP BY vehicle_type
    ORDER BY num_vehicles DESC
    LIMIT 5)
    UNION
	(SELECT 'Low Density', vehicle_type, COUNT(vehicle_id) AS num_vehicles
    FROM stolen_vehicles sv
    LEFT JOIN locations l
    ON sv.location_id = l.location_id
    WHERE region IN ('Otago', 'Gisborne', 'Southland')
    GROUP BY vehicle_type
    ORDER BY num_vehicles DESC
    LIMIT 5);
