-- 1. What are the Types of Vehicles in the stolen_vehicles table?

SELECT vehicle_type, COUNT(*) 
FROM stolen_vehicles
GROUP BY vehicle_type;

-- 2. What are the Date Ranges for this dataset?

(SELECT 'Start Date' AS ' ', MIN(date_stolen) AS 'Date'
FROM stolen_vehicles)
UNION
(SELECT 'End Date', MAX(date_stolen) AS 'Date'
FROM stolen_vehicles)
UNION
(SELECT 'Number of Days', datediff(MAX(date_stolen), MIN(date_stolen))
FROM stolen_vehicles);

-- 3. What is the count of vehicles stolen by model_year?

SELECT model_year, COUNT(*) 
FROM stolen_vehicles
GROUP BY model_year
ORDER BY model_year DESC;

-- 4. What is the count of vehicles stolen by location and region?

SELECT sv.location_id, region, COUNT(*)
FROM stolen_vehicles sv
LEFT JOIN locations l
ON sv.location_id = l.location_id
GROUP BY sv.location_ID, region
ORDER BY COUNT(*) DESC;
