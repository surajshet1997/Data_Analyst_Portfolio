# 📊 Real-Time Logistics Performance Tracking – Insights

## 🧩 Project Overview

This project simulates a real-time logistics system where shipment data is continuously ingested using API-based weather inputs. The dataset is stored in SQL Server and analyzed to extract operational insights such as delivery performance, delays, route efficiency, and weather impact.

---

# 🚀 1. Overall Shipment Summary

* **Total Shipments:** 1340
* **On-Time Deliveries:** 225 (~16.8%)
* **In-Transit / Delayed:** 1115 (~83.2%)

### 🔍 Key Insight:

* A **very high percentage of shipments are delayed or still in transit**, indicating inefficiencies in delivery operations.

---

# ⏱️ 2. Delivery Performance

* **Average Delivery Time:** ~19 hours

### 🔍 Key Insight:

* Delivery time is relatively consistent across shipments.
* However, consistency does not guarantee efficiency due to high delay rate.

---

# ⚠️ 3. Delay Analysis

* **Average Delay:** ~1 hour
* **Delay Percentage:** ~69.9%

### 🔍 Key Insight:

* Nearly **70% of shipments experience delays**, which is a major operational concern.
* Indicates issues in planning, routing, or external conditions (e.g., weather).

---

# 🚚 4. City-Level Shipment Distribution

### Top Origin Cities:

* Mumbai (144 shipments)
* Jaipur (143)
* Hyderabad (140)
* Pune (138)
* Bangalore (136)

### 🔍 Key Insight:

* Major metro cities dominate shipment volume.
* These locations likely act as **logistics hubs**.

---

# 🏙️ 5. City-Level Delivery Performance

* Average delivery time across cities: ~17–20 hours

### 🔍 Key Insight:

* No significant variation between cities.
* Suggests delays are **system-wide**, not location-specific.

---

# 🧭 6. Most Delayed Cities

* Ahmedabad, Bangalore, Pune, Kolkata, Delhi, Jaipur → Avg delay ~1 hour
* Hyderabad, Mumbai, Chennai, Lucknow → Minimal delays

### 🔍 Key Insight:

* Certain cities consistently experience delays.
* Could be due to:

  * Traffic congestion
  * Weather conditions
  * Route inefficiencies

---

# 🌦️ 7. Weather Impact on Shipments

### Shipment Status by Weather:

* Clear → Mostly On Time
* Clouds / Haze / Smoke → Mostly In Transit

### 🔍 Key Insight:

* Weather has a **direct impact on delivery performance**.
* Poor visibility conditions (Haze, Smoke) lead to delays.

---

# 🌧️ 8. Weather vs Delivery Time

* Clear weather → ~20 hours
* Clouds → ~18 hours
* Haze / Smoke → ~19 hours

### 🔍 Key Insight:

* Surprisingly, delivery time variation is minimal.
* However, **status (On-Time vs Delayed)** is heavily affected.

---

# 📏 9. Distance vs Delivery Time

* Short distances (100–150 km) → 2–5 hours
* Medium distances (500–1000 km) → 10–20 hours
* Long distances (1000+ km) → 20–30 hours

### 🔍 Key Insight:

* Delivery time increases proportionally with distance.
* Indicates **realistic simulation of logistics behavior**.

---

# ⚡ 10. Delivery Efficiency

* Efficiency ranges: **30–60 km/hour**

### 🔍 Key Insight:

* Efficient shipments operate around **50–60 km/h**
* Lower efficiency indicates:

  * Delays
  * Poor route planning
  * External disruptions

---

# 🕒 11. Peak Delay Hours

* Highest delays observed around:

  * 22:00 (10 PM)

### 🔍 Key Insight:

* Night operations show slightly higher delays.
* Could be due to:

  * Reduced workforce
  * Operational constraints

---

# 🛣️ 12. Route Analysis

### Top Routes:

* Bangalore → Hyderabad (23 shipments)
* Pune → Bangalore (23 shipments)
* Delhi → Hyderabad (21 shipments)

### 🔍 Key Insight:

* High-frequency routes indicate **key logistics corridors**
* Optimization of these routes can significantly improve performance

---

# 🏆 13. Top Delayed Shipments

* Maximum delay observed: ~2 hours

### 🔍 Key Insight:

* No extreme delays, but **consistent small delays accumulate**
* Indicates need for process optimization

---

# ⚡ 14. Fastest Deliveries

* Short routes completed in **2–5 hours**

### 🔍 Key Insight:

* System is capable of efficient delivery under ideal conditions

---

# 📡 15. Real-Time Monitoring Capability

* Latest shipments can be tracked using:

```sql
SELECT TOP 20 * 
FROM ShipmentClean
ORDER BY recorded_time DESC;
```

### 🔍 Key Insight:

* Enables **live operational monitoring**
* Useful for dashboards and alerts

---

# 🎯 Final Business Insights

✅ High delay rate (~70%) → Major improvement opportunity
✅ Weather significantly impacts delivery status
✅ Key cities act as logistics hubs
✅ Route optimization can improve efficiency
✅ System successfully simulates real-world logistics behavior

---

# 💼 Resume Value

This project demonstrates:

* Real-time data pipeline (API → SQL)
* Data cleaning and transformation
* Advanced SQL analytics
* Business KPI development
* Supply chain domain understanding

---

# 🔥 Conclusion

This project simulates a **real-world logistics analytics system**, providing actionable insights into delivery performance, operational bottlenecks, and external impacts like weather.

👉 It showcases both **technical skills (SQL + Python)** and **business understanding (Supply Chain Analytics)**.
