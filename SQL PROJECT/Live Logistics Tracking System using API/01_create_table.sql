
CREATE TABLE ShipmentLive (
    id INT IDENTITY(1,1),
    city VARCHAR(50),
    temperature FLOAT,
    weather_condition VARCHAR(50),
    shipment_status VARCHAR(20),
    recorded_time DATETIME DEFAULT GETDATE()
);

ALTER TABLE ShipmentLive
ADD 
    shipment_id VARCHAR(20),
    origin_city VARCHAR(50),
    destination_city VARCHAR(50),
    distance_km INT,
    estimated_delivery_time INT, -- in hours
    actual_delivery_time INT;

SELECT * FROM ShipmentLive;

SELECT COUNT(*) FROM ShipmentLive;

SELECT TOP 20 * FROM ShipmentLive ORDER BY recorded_time DESC;

DELETE FROM ShipmentLive
WHERE shipment_id IS NULL;

SELECT *
INTO ShipmentClean
FROM ShipmentLive
WHERE shipment_id IS NOT NULL;

