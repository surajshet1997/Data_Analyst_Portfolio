
--1)Customers Table

CREATE TABLE Customers(
CustomerID VARCHAR(10) PRIMARY KEY,
CustomerName VARCHAR(100),
Region VARCHAR(50),
Country VARCHAR(50)
);

--2)Products Table

CREATE TABLE Products(
ProductID VARCHAR(10) PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50)
);

--3)Orders Table

CREATE TABLE Orders (
OrderID VARCHAR(10) PRIMARY KEY,
CustomerID VARCHAR(10),
ProductID VARCHAR(10),
OrderDate DATE,
Quantity INT,
OrderValue DECIMAL(10,2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--4)Carriers Table

CREATE TABLE Carriers (
CarrierID VARCHAR(10) PRIMARY KEY,
CarrierName VARCHAR(100),
CarrierType VARCHAR(50)
);

--5)Shipments Table

CREATE TABLE Shipments (
ShipmentID VARCHAR(10) PRIMARY KEY,
OrderID VARCHAR(10),
OriginPort VARCHAR(50),
DestinationPort VARCHAR(50),
Carrier VARCHAR(100),
Mode VARCHAR(20),
DepartureDate DATE,
ArrivalDate DATE,
StandardTransitDays INT,
ActualTransitDays INT,
Status VARCHAR(20),

FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

select * from Customers
select * from Products
select * from Carriers
select * from Shipments
select * from Orders