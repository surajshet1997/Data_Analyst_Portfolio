
--1)Shipment Distribution by Mode
	SELECT 
	Mode,
	COUNT(*) AS Total_Shipments
	FROM Shipments
	GROUP BY Mode
	ORDER BY Total_Shipments DESC;

--2)Shipment Distribution by Status
	SELECT 
	Status,
	COUNT(*) AS Shipment_Count
	FROM Shipments
	GROUP BY Status;

--3)Shipments by Carrier
	SELECT 
	c.CarrierName,
	COUNT(*) AS Total_Shipments
	FROM Shipments s
	JOIN Carriers c
	ON s.CarrierID = c.CarrierID
	GROUP BY c.CarrierName
	ORDER BY Total_Shipments DESC;

--4)Top Shipping Routes
	SELECT 
	OriginPort,
	DestinationPort,
	COUNT(*) AS Shipment_Count
	FROM Shipments
	GROUP BY OriginPort, DestinationPort
	ORDER BY Shipment_Count DESC;

--5)Shipments by Origin Port
	SELECT 
	OriginPort,
	COUNT(*) AS Total_Shipments
	FROM Shipments
	GROUP BY OriginPort
	ORDER BY Total_Shipments DESC;

--6)Shipments by Destination Port
	SELECT 
	DestinationPort,
	COUNT(*) AS Total_Shipments
	FROM Shipments
	GROUP BY DestinationPort
	ORDER BY Total_Shipments DESC;

--7)Orders by Customer
	SELECT 
	c.CustomerName,
	COUNT(*) AS Total_Orders
	FROM Orders o
	JOIN Customers c
	ON o.CustomerID = c.CustomerID
	GROUP BY c.CustomerName
	ORDER BY Total_Orders DESC;

--8)Product Demand
	SELECT 
	p.ProductName,
	COUNT(*) AS Total_Orders
	FROM Orders o
	JOIN Products p
	ON o.ProductID = p.ProductID
	GROUP BY p.ProductName
	ORDER BY Total_Orders DESC;
	
--9)Orders by region
	SELECT 
	c.Region,
	COUNT(*) AS Total_Orders
	FROM Orders o
	JOIN Customers c
	ON o.CustomerID = c.CustomerID
	GROUP BY c.Region
	ORDER BY Total_Orders DESC;

--10)Monthly Shipment Trend
	SELECT 
	YEAR(DepartureDate) AS Year,
	MONTH(DepartureDate) AS Month,
	COUNT(*) AS Shipment_Count
	FROM Shipments
	GROUP BY YEAR(DepartureDate), MONTH(DepartureDate)
	ORDER BY Year, Month;

