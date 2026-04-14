
--1)Validate Row Counts
	SELECT COUNT(*) AS Customers_Count FROM Customers;
	SELECT COUNT(*) AS Products_Count FROM Products;
	SELECT COUNT(*) AS Carriers_Count FROM Carriers;
	SELECT COUNT(*) AS Orders_Count FROM Orders;
	SELECT COUNT(*) AS Shipments_Count FROM Shipments;

--2)Check NULL values
	-- Orders NULL validation
	SELECT *
	FROM Orders
	WHERE CustomerID IS NULL
	OR ProductID IS NULL
	OR OrderDate IS NULL;

	-- Shipments NULL validation
	SELECT *
	FROM Shipments
	WHERE OrderID IS NULL
	OR DepartureDate IS NULL
	OR ArrivalDate IS NULL
	OR Status IS NULL;

--3)Check Duplicate Primary Keys
	SELECT OrderID, COUNT(*)
	FROM Orders
	GROUP BY OrderID
	HAVING COUNT(*) > 1;

	SELECT ShipmentID, COUNT(*)
	FROM Shipments
	GROUP BY ShipmentID
	HAVING COUNT(*) > 1;

--4)Validate foreign key relationships
	SELECT *
	FROM Shipments s
	LEFT JOIN Orders o
	ON s.OrderID = o.OrderID
	WHERE o.OrderID IS NULL;

--5)Validate Customer References
	SELECT *
	FROM Orders o
	LEFT JOIN Customers c
	ON o.CustomerID = c.CustomerID
	WHERE c.CustomerID IS NULL;

--6)Validate Product References
	SELECT *
	FROM Orders o
	LEFT JOIN Products p
	ON o.ProductID = p.ProductID
	WHERE p.ProductID IS NULL;

--7)Validate Shipment Date Logic
	SELECT *
	FROM Shipments
	WHERE ArrivalDate < DepartureDate;

--8)Validate Transit Time Logic
	SELECT *
	FROM Shipments
	WHERE ActualTransitDays < 0;

--9)Validate Transit Time Consistency
	SELECT *,
	DATEDIFF(DAY, DepartureDate, ArrivalDate) AS CalculatedTransit
	FROM Shipments
	WHERE DATEDIFF(DAY, DepartureDate, ArrivalDate) <> ActualTransitDays;

--10)Validate Status Logic
	SELECT *
	FROM Shipments
	WHERE Status = 'Delivered'
	AND ActualTransitDays > StandardTransitDays;