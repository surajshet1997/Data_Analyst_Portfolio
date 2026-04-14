# Supply Chain Shipment Performance Analysis (SQL Project)

## Project Overview
This project analyzes global shipment performance using SQL.
The objective is to evaluate delivery efficiency, carrier reliability,
route delays, and revenue contribution by region and customers.

## Dataset
The dataset includes 5 tables:

- Customers
- Orders
- Products
- Carriers
- Shipments

Total Records:
- Shipments: 5000
- Orders: 5000
- Customers: 40
- Products: 50
- Carriers: 8

## Key Analysis Performed

1. On-Time Delivery Rate
2. Carrier Delay Analysis
3. Shipment Mode Distribution
4. Route Delay Analysis
5. Revenue by Region
6. Top Customers by Revenue
7. Carrier Reliability Score
8. Monthly Shipment Trends
9. Product Demand Analysis

## Key Insights

- On-time delivery rate is **34.36%**, indicating significant logistics delays.
- Sea transport accounts for **~80% of shipments**, dominating the logistics network.
- The **Shanghai → Los Angeles route** experiences the highest delays.
- **MSC and CMA CGM** show the highest delay counts among carriers.
- **COSCO demonstrates the highest reliability score** among carriers.
- Europe generates the **highest total revenue** among regions.

## Tools Used

- SQL Server (SSMS)
- SQL (Joins, Window Functions, Aggregations)

## Project Structure

sql/
- create_tables.sql
- data_validation.sql
- data_exploration.sql
- supply_chain_analysis.sql

docs/
- insight.md