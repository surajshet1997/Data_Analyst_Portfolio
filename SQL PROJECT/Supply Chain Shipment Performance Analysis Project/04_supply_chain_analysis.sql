
--1)On-Time Delivery %
	SELECT
	ROUND(
	SUM(CASE WHEN Status = 'Delivered' THEN 1 ELSE 0 END)*100.0/COUNT(*),
	2) AS OnTimeDeliveryRate
	FROM Shipments;

--2)Carrier Delay Rate
	SELECT
	c.CarrierName,
	COUNT(*) AS TotalShipments,
	SUM(CASE WHEN Status='Delayed' THEN 1 ELSE 0 END) AS Delayed_Shipments
	FROM Shipments s
	JOIN Carriers c
	ON s.CarrierID = c.CarrierID
	GROUP BY c.CarrierName
	ORDER BY Delayed_Shipments DESC;

--3)Average Transit Time by mode
	SELECT mode, 
	AVG(ActualTransitDays) AS Avg_Transit_Time
	FROM Shipments
	Group by Mode;

--4)Shipment Mode Distribution
	SELECT 
	Mode,
	COUNT(*) AS Total_Shipments
	FROM Shipments
	GROUP BY Mode
	ORDER BY Total_Shipments DESC;

--5)Revenue by Region
	SELECT 
	c.Region,
	SUM(o.Quantity * o.OrderValue) AS Total_Revenue
	FROM Orders o
	JOIN Customers c
	ON o.CustomerID = c.CustomerID
	GROUP BY c.Region
	ORDER BY Total_Revenue DESC;

--6)Top Customers by Revenue
	SELECT 
	c.CustomerName,
	SUM(o.Quantity * o.OrderValue) AS Total_Revenue
	FROM Orders o
	JOIN Customers c
	ON o.CustomerID = c.CustomerID
	GROUP BY c.CustomerName
	ORDER BY Total_Revenue DESC;

--7)Delay Analysis by Route
	SELECT 
	OriginPort,
	DestinationPort,
	SUM(CASE WHEN Status = 'Delayed' THEN 1 ELSE 0 END) AS Delayed_Shipments
	FROM Shipments
	GROUP BY OriginPort, DestinationPort
	ORDER BY Delayed_Shipments DESC;

--8)Average Delay Days
	SELECT 
	AVG(ActualTransitDays - StandardTransitDays) AS Avg_Delay_Days
	FROM Shipments
	WHERE ActualTransitDays > StandardTransitDays;

--9)Shipment Efficiency Score
	SELECT 
	AVG(StandardTransitDays) AS Avg_Standard,
	AVG(ActualTransitDays) AS Avg_Actual
	FROM Shipments;

--10)Top Customers by Revenue
	SELECT
	c.CustomerName,
	SUM(o.Quantity * o.OrderValue) AS Revenue,
	RANK() OVER (ORDER BY SUM(o.Quantity * o.OrderValue) DESC) AS RevenueRank
	FROM Orders o
	JOIN Customers c
	ON o.CustomerID = c.CustomerID
	GROUP BY c.CustomerName;

--11)Most Used Carrier per Route
	SELECT *
	FROM (
	SELECT
	OriginPort,
	DestinationPort,
	c.CarrierName,
	COUNT(*) AS ShipmentCount,
	ROW_NUMBER() OVER(PARTITION BY OriginPort, DestinationPort
	ORDER BY COUNT(*) DESC) AS CarrierRank
	FROM Shipments s
	JOIN Carriers c
	ON s.CarrierID = c.CarrierID
	GROUP BY OriginPort, DestinationPort, c.CarrierName
	) t
	WHERE CarrierRank = 1;

--12)Monthly Shipment Trend
	SELECT
	YEAR(DepartureDate) AS Year,
	MONTH(DepartureDate) AS Month,
	COUNT(*) AS Shipments,
	SUM(COUNT(*)) OVER(
	ORDER BY YEAR(DepartureDate), MONTH(DepartureDate)
	) AS CumulativeShipments
	FROM Shipments
	GROUP BY YEAR(DepartureDate), MONTH(DepartureDate)
	ORDER BY Year, Month;

--13)Top Product per Category
	SELECT *
	FROM (
		SELECT
		p.Category,
		p.ProductName,
		COUNT(*) AS Orders,
		RANK() OVER(
			PARTITION BY p.Category
			ORDER BY COUNT(*) DESC
		) AS ProductRank
		FROM Orders o
		JOIN Products p
		ON o.ProductID = p.ProductID
		GROUP BY p.Category, p.ProductName
	) t
	WHERE ProductRank = 1;

--14)Carrier Delay Ranking
	SELECT
	c.CarrierName,
	COUNT(*) AS TotalShipments,
	SUM(CASE WHEN Status='Delayed' THEN 1 ELSE 0 END) AS DelayedShipments,
	RANK() OVER(ORDER BY SUM(CASE WHEN Status='Delayed' THEN 1 ELSE 0 END) DESC
	) AS DelayRank
	FROM Shipments s
	JOIN Carriers c
	ON s.CarrierID = c.CarrierID
	GROUP BY c.CarrierName;

--15)What percentage of shipments were delivered within the standard transit time?
	SELECT 
	COUNT(*) AS TotalShipments,
	SUM(CASE WHEN ActualTransitDays <= StandardTransitDays THEN 1 ELSE 0 END) AS OnTimeShipments,
	ROUND(
	SUM(CASE WHEN ActualTransitDays <= StandardTransitDays THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
	2
	) AS OnTimeDeliveryRate
	FROM Shipments;

--16)How much does actual transit time vary compared to standard transit?
	SELECT
	AVG(StandardTransitDays) AS AvgStandardTransit,
	AVG(ActualTransitDays) AS AvgActualTransit,
	AVG(ActualTransitDays - StandardTransitDays) AS AvgTransitVariance
	FROM Shipments;

--17)Carrier Reliability Score
	SELECT
	c.CarrierName,
	COUNT(*) AS TotalShipments,
	SUM(CASE WHEN ActualTransitDays <= StandardTransitDays THEN 1 ELSE 0 END) AS OnTimeShipments,
	ROUND(
	SUM(CASE WHEN ActualTransitDays <= StandardTransitDays THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
	2
	) AS CarrierReliabilityScore
	FROM Shipments s
	JOIN Carriers c
	ON s.CarrierID = c.CarrierID
	GROUP BY c.CarrierName
	ORDER BY CarrierReliabilityScore DESC;