
--STEP 1: Basic KPIs

--1)Total Shipments
	SELECT COUNT(*) AS total_shipments
	FROM ShipmentClean;

--2)On-Time vs Delayed Shipments
	SELECT 
    shipment_status,
    COUNT(*) AS total
	FROM ShipmentClean
	GROUP BY shipment_status;

--3)Average Delivery Time
	SELECT 
	AVG(actual_delivery_time) AS avg_delivery_time
	FROM ShipmentClean;

--STEP 2: Delay Analysis

--4)Delay per Shipment
	SELECT 
	shipment_id,
	actual_delivery_time - estimated_delivery_time AS delay_hours
	FROM ShipmentClean;

--5)Average Delay
	SELECT 
	AVG(actual_delivery_time - estimated_delivery_time) AS avg_delay
	FROM ShipmentClean;

--6)Delayed Shipments Only
	SELECT *
	FROM ShipmentClean
	WHERE actual_delivery_time > estimated_delivery_time;

--STEP 3: City-Level Analysis

--7)Shipments by Origin City
	SELECT 
	origin_city,
	COUNT(*) AS total_shipments
	FROM ShipmentClean
	GROUP BY origin_city
	ORDER BY total_shipments DESC;

--8)Avg Delivery Time per City
	SELECT 
	origin_city,
	AVG(actual_delivery_time) AS avg_delivery_time
	FROM ShipmentClean
	GROUP BY origin_city;

--9)Most Delayed Cities
	SELECT 
	origin_city,
	AVG(actual_delivery_time - estimated_delivery_time) AS avg_delay
	FROM ShipmentClean
	GROUP BY origin_city
	ORDER BY avg_delay DESC;

--STEP 4: Weather Impact

--10)Weather vs Shipment Status
	SELECT 
	weather_condition,
	shipment_status,
	COUNT(*) AS total
	FROM ShipmentClean
	GROUP BY weather_condition, shipment_status
	ORDER BY weather_condition;

--11)Weather Impact on Delivery Time
	SELECT 
	weather_condition,
	AVG(actual_delivery_time) AS avg_delivery_time
	FROM ShipmentClean
	GROUP BY weather_condition;

--12)Rain Impact
	SELECT *
	FROM ShipmentClean
	WHERE weather_condition IN ('Rain', 'Thunderstorm');

--STEP 5: Distance vs Delivery Time

--13)Distance vs Time
	SELECT 
	distance_km,
	actual_delivery_time
	FROM ShipmentClean
	ORDER BY distance_km;

--14)Efficiency Check
	SELECT 
	distance_km,
	estimated_delivery_time,
	actual_delivery_time,
	(actual_delivery_time - estimated_delivery_time) AS delay
	FROM ShipmentClean;

--STEP 6: Real Business Insights

--15)Top 5 Delayed Shipments
	SELECT TOP 5 *
	FROM ShipmentClean
	ORDER BY (actual_delivery_time - estimated_delivery_time) DESC;

--16)Fastest Deliveries
	SELECT TOP 5 *
	FROM ShipmentClean
	ORDER BY actual_delivery_time ASC;

--17)Real-Time Dashboard Query
	SELECT TOP 20 *
	FROM ShipmentClean
	ORDER BY recorded_time DESC;

--STEP 7: Advanced SQL

--18)Delivery Efficiency Score
	SELECT 
	shipment_id,
	distance_km,
	actual_delivery_time,
	(distance_km * 1.0 / actual_delivery_time) AS efficiency_km_per_hour
	FROM ShipmentClean;

--19)Delay Percentage
	SELECT 
	COUNT(CASE WHEN actual_delivery_time > estimated_delivery_time THEN 1 END) * 100.0 / COUNT(*) AS delay_percentage
	FROM ShipmentClean;

--20)On-Time Delivery Rate
	SELECT 
	COUNT(CASE WHEN shipment_status = 'On Time' THEN 1 END) * 100.0 / COUNT(*) AS on_time_percentage
	FROM ShipmentClean;

--21)Peak Delay Hours
	SELECT 
	DATEPART(HOUR, recorded_time) AS hour_of_day,
	AVG(actual_delivery_time - estimated_delivery_time) AS avg_delay
	FROM ShipmentClean
	GROUP BY DATEPART(HOUR, recorded_time)
	ORDER BY avg_delay DESC;

--22)Route Analysis
	SELECT 
	origin_city,
	destination_city,
	COUNT(*) AS shipments,
	AVG(actual_delivery_time) AS avg_time
	FROM ShipmentClean
	GROUP BY origin_city, destination_city
	ORDER BY shipments DESC;

-- STEP 8: Create Views
--View 1: Delay View
	CREATE VIEW vw_DelayAnalysis AS
	SELECT 
		shipment_id,
		origin_city,
		destination_city,
		actual_delivery_time - estimated_delivery_time AS delay
	FROM ShipmentClean;

--View 2: City Performance
	CREATE VIEW vw_CityPerformance AS
	SELECT 
		origin_city,
		COUNT(*) AS total_shipments,
		AVG(actual_delivery_time) AS avg_time
	FROM ShipmentClean
	GROUP BY origin_city;

