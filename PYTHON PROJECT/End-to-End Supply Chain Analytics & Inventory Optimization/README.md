# End-to-End Supply Chain Analytics & Inventory Optimization Using Python

## Project Overview

This project applies Python-based analytics to supply chain planning and inventory management. It covers demand forecasting, inventory classification, safety stock calculation, reorder point optimization, replenishment recommendations, supplier analysis, and warehouse operations.

The objective is to transform daily supply chain data into actionable recommendations that support better inventory decisions, demand planning, and replenishment prioritization.

## Business Problem

Supply chain teams need to balance product availability with inventory holding costs. Poor demand estimates, inappropriate reorder points, long supplier lead times, and uneven inventory allocation can increase the risk of stockouts or unnecessary inventory.

This project addresses these challenges by combining historical demand analysis, forecasting models, inventory optimization techniques, and supplier and warehouse analytics.

## Project Objectives

- Forecast demand at SKU–warehouse level.
- Evaluate inventory health and demand patterns.
- Classify products using ABC and XYZ analysis.
- Calculate safety stock and optimized reorder points.
- Generate SKU–warehouse replenishment recommendations.
- Analyze supplier lead times, product coverage, and supplier concentration.
- Evaluate warehouse inventory, demand, and replenishment risk.
- Produce structured reporting datasets for further business intelligence analysis.

## Dataset Overview

The cleaned dataset contains:

| Attribute | Details |
|---|---|
| Records | 91,250 |
| Columns | 34 |
| SKUs | 50 |
| Warehouses | 5 |
| Suppliers | 10 |
| Data period | January 1–December 30, 2024 |
| Granularity | Daily SKU–warehouse observations |

Key fields include date, SKU, warehouse, supplier, units sold, inventory level, supplier lead time, reorder point, order quantity, unit cost, and demand forecast.

*Note: The original dataset source and license should be documented before redistribution.*

## Technology Stack

- **Python:** Analysis, calculations, and forecasting
- **Pandas:** Data manipulation, aggregation, and validation
- **NumPy:** Numerical calculations and classification logic
- **Statsmodels:** Time-series forecasting
- **Jupyter Notebook:** Exploratory analysis and project workflow
- **Excel:** Exporting recommendations and reporting datasets
- **GitHub:** Project version control and portfolio presentation

## Project Workflow

### 1. Data Understanding and Cleaning

- Examined dataset structure, columns, and date coverage.
- Reviewed missing values and data quality.
- Prepared the dataset for exploratory analysis and forecasting.

### 2. Exploratory Data Analysis

- Analyzed demand and inventory patterns.
- Examined SKU and warehouse-level characteristics.
- Reviewed supplier lead times and inventory-related variables.

### 3. Demand Forecasting

Developed and compared five forecasting approaches:

- Naive Forecast
- Seasonal Naive
- Holt's Linear Trend
- Damped Holt's Trend
- Holt-Winters Exponential Smoothing

Used rolling validation with four folds and 30-day validation windows to evaluate model performance at SKU–warehouse level.

Selected the best-performing model for each of the 250 SKU–warehouse combinations and generated a 30-day demand forecast.

### 4. Inventory Analytics and Classification

- Calculated average inventory, inventory value, inventory coverage, inventory turnover, and demand-to-inventory ratio.
- Applied ABC analysis using cumulative consumption value.
- Applied XYZ classification using demand variability.
- Combined both classifications to support inventory prioritization.

### 5. Safety Stock and Reorder Point Optimization

Calculated safety stock and optimized reorder points using forecast demand, supplier lead time, historical demand variability, and a 95% target service-level assumption.

Compared optimized reorder points against existing reorder points to identify where replenishment policies may require review.

### 6. Supply and Replenishment Planning

Combined the latest inventory observation with forecast demand, lead time, safety stock, and optimized reorder points.

Generated replenishment recommendations for each SKU–warehouse combination, including:

- Hold
- Reorder
- Urgent

Exported the final recommendations to Excel for operational review.

### 7. Supplier Analytics

Created supplier scorecards to analyze:

- Average, minimum, and maximum lead times
- SKU coverage
- Warehouse coverage
- Total units sold associated with suppliers
- Supplier sales-volume concentration
- Supplier review categories based on volume and lead-time characteristics

### 8. Warehouse and Replenishment Logistics

Analyzed inventory and demand at warehouse level, including:

- Latest inventory position
- Inventory coverage days
- Inventory share versus demand share
- SKU-level stock risk
- Warehouse allocation review
- Replenishment priority

The analysis focuses on the fields available in the dataset and does not claim transportation or carrier KPIs that cannot be measured from these data.

## Key Results

- Processed **91,250 daily observations** across 50 SKUs and 5 warehouses.
- Evaluated five forecasting methods using rolling validation.
- Selected a best-performing model for each of 250 SKU–warehouse combinations.
- Generated **7,500 forecast records** covering a 30-day horizon.
- Produced **250 replenishment recommendations**.
- Identified 9 SKU–warehouse combinations classified as Reorder or Urgent under the project's recommendation rules.
- Created a scorecard for 10 suppliers and a warehouse comparison covering 5 warehouses.
- Validated the reporting datasets for duplicate rows, missing cells, duplicate business keys, and missing key values.

## Business Value

The project demonstrates how analytical methods can help supply chain teams:

- Anticipate future demand.
- Identify products requiring different inventory policies.
- Review reorder points using demand forecasts and supplier lead times.
- Prioritize replenishment activities.
- Identify supplier concentration and lead-time exposure.
- Compare warehouse inventory positions with demand patterns.
- Convert analysis into structured operational recommendations.

These are analytical decision-support outputs; actual cost savings, service-level improvements, and stockout reductions have not been measured in this project.

## Project Structure

```text
Supply-Chain-Analytics-Inventory-Optimization/
│
├── README.md
├── business_insights.md
│
├── notebooks/
│   ├── 01_Data_Understanding.ipynb
│   ├── 02_Data_Cleaning.ipynb
│   ├── 03_EDA.ipynb
│   ├── 04_Demand_Forecasting.ipynb
│   ├── 05_Inventory_Optimization.ipynb
│   └── 06_Supply_Planning.ipynb
│
└── outputs/
    ├── 30_Day_SKU_Warehouse_Forecast.xlsx
    ├── Final_Replenishment_Recommendations.xlsx
    ├── Warehouse_Operations_Analysis.xlsx
    └── PowerBI_Reporting_Datasets.xlsx
```

*The structure above is the proposed organization. Adjust the filenames to match the actual files included in the repository.*

## Limitations and Assumptions

- Forecast accuracy depends on the historical dataset and selected validation method.
- ABC and XYZ classifications depend on the thresholds used in the analysis.
- Safety stock calculations use a 95% target service-level assumption and a simplified demand-variability approach.
- Replenishment recommendations are based on modeled rules and should be reviewed against operational constraints before implementation.
- The analysis uses the latest available inventory observation in the dataset; it does not represent a live inventory feed.
- Financial savings and actual service improvements have not been independently quantified.
- Power BI dashboard development is outside the current completed scope.

## Future Enhancements

- Build an interactive Power BI dashboard.
- Add forecast accuracy and bias monitoring.
- Incorporate supplier reliability and purchase-order data.
- Add order constraints, minimum order quantities, and pack sizes.
- Evaluate inventory policy scenarios and quantify potential cost impacts.

## Skills Demonstrated

Python · Pandas · NumPy · Time-Series Forecasting · Exploratory Data Analysis · Inventory Optimization · ABC–XYZ Analysis · Safety Stock · Reorder Point Planning · Supply Chain Analytics · Supplier Analytics · Warehouse Operations · Data Validation · Business Recommendations

---

**Author:** Suraj Shet

**Portfolio:** [Data Analyst Portfolio](https://github.com/surajshet1997/Data_Analyst_Portfolio)
