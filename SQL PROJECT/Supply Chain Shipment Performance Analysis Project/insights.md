---

# Supply Chain Shipment Performance Insights

## Project Summary

This analysis evaluates **global shipment performance** across carriers, transportation modes, routes, customers, and regions using SQL.

The dataset contains:

* **5000 shipments**
* **40 customers**
* **50 products**
* **8 carriers**
* Multiple global shipping routes

The goal is to identify **logistics inefficiencies, carrier performance, and revenue drivers**.

---

# 1. On-Time Delivery Performance

### Result

* **Total Shipments:** 5000
* **On-Time Shipments:** 1718
* **On-Time Delivery Rate:** **34.36%**

### Insight

Only **34% of shipments meet the expected transit time**, meaning nearly **66% of shipments are delayed**.

### Business Impact

Low on-time delivery can lead to:

* customer dissatisfaction
* inventory shortages
* supply chain disruptions

### Recommendation

Investigate delays related to:

* specific carriers
* congested ports
* inefficient routes
* unrealistic transit time standards

---

# 2. Carrier Delay Performance

### Most Delayed Shipments

| Carrier   | Total Shipments | Delayed |
| --------- | --------------- | ------- |
| MSC       | 700             | 455     |
| CMA CGM   | 683             | 452     |
| Maersk    | 681             | 440     |
| Evergreen | 641             | 433     |

### Insight

MSC and CMA CGM record the **highest number of delayed shipments**, though shipment volume also contributes to higher delay counts.

### Recommendation

Combine this with **reliability score analysis** to determine the most dependable carriers.

---

# 3. Average Transit Time by Mode

| Mode | Average Transit Time |
| ---- | -------------------- |
| Sea  | 25 days              |
| Air  | 4 days               |

### Insight

Air freight is significantly faster than sea freight.

### Business Interpretation

* **Air freight** is used for urgent deliveries.
* **Sea freight** is used for bulk shipments due to lower cost.

This reflects standard global logistics practices.

---

# 4. Shipment Mode Distribution

| Mode | Shipments |
| ---- | --------- |
| Sea  | 3976      |
| Air  | 1024      |

### Insight

Nearly **80% of shipments use sea transport**, confirming sea freight dominates global supply chains.

### Business Interpretation

Sea transport remains the most cost-efficient logistics method for large shipment volumes.

---

# 5. Revenue by Region

| Region        | Total Revenue |
| ------------- | ------------- |
| Europe        | 286M          |
| North America | 220M          |
| Asia Pacific  | 209M          |

### Insight

Europe generates the **highest revenue contribution**.

### Business Implication

The European market represents the **largest demand region** and may require:

* stronger logistics infrastructure
* optimized distribution networks

---

# 6. Top Customers by Revenue

| Customer     | Revenue |
| ------------ | ------- |
| Carrefour    | 21.15M  |
| MediaMarkt   | 21.13M  |
| JD Logistics | 20.94M  |
| Future Group | 20.90M  |

### Insight

A small number of customers contribute a **large share of total revenue**.

### Business Recommendation

These customers should be treated as **strategic accounts** with:

* priority shipments
* dedicated logistics coordination
* improved service agreements

---

# 7. Route Delay Analysis

### Most Delayed Routes

| Route                  | Delayed Shipments |
| ---------------------- | ----------------- |
| Shanghai → Los Angeles | 305               |
| Nhava Sheva → Houston  | 244               |
| Busan → New York       | 226               |
| Hamburg → Antwerp      | 226               |

### Insight

Certain global trade routes consistently experience **high delays**.

### Possible Causes

* port congestion
* customs processing delays
* long-distance maritime routes

### Recommendation

Evaluate alternative routing or carrier selection for these lanes.

---

# 8. Average Delay Duration

### Result

Average delay:

```
3 days
```

### Insight

Delayed shipments exceed the expected delivery time by **approximately 3 days**.

### Business Impact

Even short delays can disrupt:

* warehouse replenishment
* retail supply chains
* inventory planning

---

# 9. Shipment Efficiency

| Metric                   | Days |
| ------------------------ | ---- |
| Average Standard Transit | 19   |
| Average Actual Transit   | 21   |

### Insight

Actual transit time exceeds planned transit time by **2 days on average**.

### Business Interpretation

This indicates **systematic operational inefficiencies** rather than isolated delays.

---

# 10. Customer Revenue Distribution

Customer ranking shows that **top retail chains generate the majority of revenue**.

### Insight

Revenue concentration indicates dependency on a **limited number of key customers**.

### Recommendation

Strengthen partnerships with these customers to maintain stable demand.

---

# 11. Dominant Carrier by Route

Each major route tends to be dominated by **one carrier**.

Examples:

* Busan → New York → COSCO
* Dubai → London → DHL Aviation
* Shanghai → Sydney → Maersk

### Insight

Carriers often specialize in specific trade routes.

### Business Recommendation

Leverage carrier specialization for improved shipping reliability.

---

# 12. Shipment Trend by Month

| Month | Shipments |
| ----- | --------- |
| Jan   | 787       |
| Feb   | 757       |
| Mar   | 736       |
| Apr   | 733       |
| May   | 756       |
| Jun   | 744       |
| Jul   | 487       |

### Insight

Shipment volume is relatively stable from **January to June**, with a noticeable decline in July.

### Possible Causes

* seasonal demand changes
* supply fluctuations
* shipping schedule adjustments

---

# 13. Top Product per Category

| Category       | Product             |
| -------------- | ------------------- |
| Automotive     | Automotive Battery  |
| Electronics    | Router              |
| Consumer Goods | Air Conditioner     |
| Industrial     | Copper Wire         |
| Pharma         | Vitamin Supplements |
| Retail         | Printer Paper       |

### Insight

These products represent the **highest demand within their respective categories**.

### Business Recommendation

Prioritize inventory planning for these high-volume products.

---

# 14. Carrier Delay Ranking

| Carrier | Delay Rank |
| ------- | ---------- |
| MSC     | 1          |
| CMA CGM | 2          |
| Maersk  | 3          |

### Insight

These carriers have the **highest number of delays**, though shipment volume should be considered when interpreting rankings.

---

# 15. Transit Time Variability

| Metric           | Days |
| ---------------- | ---- |
| Standard Transit | 19   |
| Actual Transit   | 21   |
| Variance         | 2    |

### Insight

Actual delivery times exceed expected times by **2 days on average**, indicating a consistent delay trend.

---

# 16. Carrier Reliability Score

| Carrier         | Reliability |
| --------------- | ----------- |
| COSCO           | 36.7%       |
| FedEx Logistics | 35.4%       |
| Maersk          | 35.3%       |
| MSC             | 35.0%       |

### Insight

COSCO demonstrates the **highest on-time reliability among carriers**, though overall reliability across all carriers remains relatively low.

---

# Key Takeaways

Major insights from the analysis:

* On-time delivery performance is **significantly below optimal levels**.
* Sea freight dominates the global logistics network.
* Certain international routes consistently experience higher delays.
* Revenue is heavily concentrated among a few major customers.
* Carrier reliability varies across logistics providers.

---


