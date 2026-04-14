# 🚚 Real-Time Logistics Tracking System using API

## 📌 Project Overview

This project simulates a **real-time logistics and supply chain tracking system** by integrating live API data with SQL Server. It continuously fetches weather data and uses it to dynamically determine shipment status, delivery time, and delays.

The system mimics real-world logistics operations and provides **end-to-end analytics** using SQL.

---

## 🎯 Objectives

* Build a **real-time data pipeline** using API + Python + SQL
* Simulate **shipment tracking system**
* Analyze delivery performance and delays
* Understand **impact of weather on logistics**
* Generate **business insights using SQL**

---

## ⚙️ Tech Stack

* **Python** → API integration & data ingestion
* **SQL Server** → Data storage & analysis
* **OpenWeather API** → Real-time weather data
* **VS Code / SSMS** → Development tools

---

## 🔄 Data Pipeline Flow

```text
API (Weather Data)
        ↓
Python Script (Transformation + Logic)
        ↓
SQL Server (ShipmentLive Table)
        ↓
Data Cleaning (ShipmentClean Table)
        ↓
SQL Analysis & Insights
```

---

## 🗂️ Database Structure

### 1️⃣ ShipmentLive (Raw Data)

* city
* temperature
* weather_condition
* shipment_status
* recorded_time
* shipment_id
* origin_city
* destination_city
* distance_km
* estimated_delivery_time
* actual_delivery_time

---

### 2️⃣ ShipmentClean (Processed Data)

* Cleaned dataset used for analysis
* Removed null values
* Standardized delivery metrics

---

## 🚀 Key Features

✅ Real-time data ingestion every few minutes
✅ Dynamic shipment status based on weather
✅ Realistic logistics simulation (distance, time, delay)
✅ Automated SQL-based analysis
✅ Business-ready insights

---

## 📊 Key Insights

* 📦 Total Shipments: **1340+**
* ⏱️ Avg Delivery Time: **~19 hours**
* ⚠️ Delay Rate: **~70%**
* 🚚 On-Time Delivery: **~17%**
* 🌦️ Weather significantly impacts shipment status
* 🛣️ Major logistics routes identified

---

## 📈 Analysis Performed

* Total shipment tracking
* On-time vs delayed deliveries
* Average delivery time
* Delay analysis
* City-wise shipment distribution
* Weather impact analysis
* Distance vs delivery time
* Route optimization insights
* Efficiency (km/hour)
* Peak delay hours

---

## 🧠 Business Value

This project helps:

* Identify **delivery bottlenecks**
* Improve **route planning**
* Understand **weather impact on logistics**
* Monitor **real-time operations**
* Optimize **supply chain efficiency**

---

## 💼 Resume Highlights

* Built **real-time data pipeline**
* Integrated **API with SQL Server**
* Designed **logistics data model**
* Performed **advanced SQL analytics**
* Generated **business insights**

---

## ▶️ How to Run the Project

### 1. Clone the Repository

```bash
git clone <your-repo-link>
```

### 2. Install Dependencies

```bash
pip install requests pyodbc
```

### 3. Add API Key

Update in Python file:

```python
API_KEY = "your_api_key"
```

### 4. Run Python Script

```bash
python test.py
```

### 5. Run SQL Scripts

* `01_create_table.sql`
* `02_data_analysis.sql`

## 📣 Conclusion

This project demonstrates how **real-time data + SQL analytics** can be used to simulate and optimize logistics operations.

It bridges the gap between **technical implementation** and **business decision-making**, making it highly valuable for data analyst roles.
