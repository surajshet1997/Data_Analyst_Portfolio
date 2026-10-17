# Business Insights — End-to-End Supply Chain Analytics & Inventory Optimization

## 1. Executive Summary

This project analyzes daily supply chain observations across 50 SKUs, 5 warehouses, and 10 suppliers from **January 1 to December 30, 2024**. The workflow covers data quality checks, exploratory data analysis, time-series forecasting, inventory segmentation, safety-stock and reorder-point calculations, replenishment recommendations, supplier scorecards, and warehouse inventory analysis.

The main outputs are decision-support recommendations rather than measured operational outcomes. The dataset contains no recorded stockout events (`stockout_flag` is always 0), so potential risk identified by the project is based on analytical rules and inventory/reorder-point comparisons—not observed historical stockouts.

## 2. Dataset and Data Quality

- **91,250 rows and 15 columns** in the initial dataset.
- **250 SKU–warehouse combinations**: 50 SKUs across 5 warehouses.
- **10 suppliers** and **4 regions**.
- 365 distinct dates from January 1 to December 30, 2024, with no missing dates inside this observed range.
- Initial checks found **0 missing values, 0 duplicate records, and 0 negative values** in the inspected numeric fields.
- `promotion_flag` contains valid binary values 0 and 1. `stockout_flag` contains only 0.

The data quality checks passed for the inspected fields. However, the absence of stockout flags limits the ability to validate stockout-risk rules against actual historical stockout outcomes.

## 3. Demand and Exploratory Analysis

### 3.1 Overall demand

- Total units sold across the observations: **1,829,979**.
- Average units sold per SKU–warehouse–day: **20.05**.
- Average daily network demand: approximately **5,014 units**.
- Existing demand forecast evaluation in the EDA notebook reported **MAE = 2.38 units**, **WAPE = 11.87%**, and forecast bias of approximately **−0.03 units**. These are the metrics reported for the existing forecast in that analysis, not the final model-selection result.

### 3.2 Monthly pattern

Recorded monthly sales vary substantially:

- Highest monthly total: **March, 231,596 units**.
- April: **223,793 units**.
- Lowest monthly total: **September, 76,304 units**.
- October: **79,599 units**.
- Demand rises again in November and December, reaching **131,925 units** in December.

This pattern suggests a meaningful time trend or seasonal/regime pattern in the supplied data. It should be investigated with business context before attributing the changes to a real-world cause. The observation window ends on December 30, 2024.

### 3.3 Demand by SKU and warehouse

Demand is relatively evenly distributed across the network:

- The top 10 SKUs account for **20.17%** of total demand.
- The top 20 SKUs account for **40.22%**.
- The top 25 SKUs account for **50.22%**.
- Total units sold by warehouse range narrowly from **365,114** at WH_5 to **366,902** at WH_1.

This indicates that demand is not concentrated in only a few SKUs or a single warehouse in the historical data.

### 3.4 Promotions

Average units sold per observation were:

- Non-promotion observations: **19.50 units**.
- Promotion observations: **24.91 units**.

Promotion observations therefore had approximately **27.7% higher average demand** in this dataset. This is an association, not proof that promotions caused the difference; promotion timing, product mix, and other factors may contribute.

## 4. Demand Forecasting

Five approaches were evaluated: Naive, Seasonal Naive, Holt, Damped Holt, and Holt–Winters.

The notebook used **four rolling-origin validation windows**, each with a 30-day test horizon. The documented overall backtesting comparison reports:

- Damped Holt: lowest average WAPE at **6.56%** and lower WAPE variability.
- Holt: slightly lower average MAE and RMSE.
- The difference between Holt and Damped Holt was described as small; Damped Holt was retained as the final candidate based on WAPE and consistency.

At SKU–warehouse level, the selected model distribution was:

| Selected model | SKU–warehouse combinations | Share |
|---|---:|---:|
| Damped Holt | 195 | 78.0% |
| Holt | 24 | 9.6% |
| Naive | 18 | 7.2% |
| Holt–Winters | 13 | 5.2% |
| Seasonal Naive | 0 | 0.0% |
| **Total** | **250** | **100%** |

The final forecast contains **7,500 records**: 30 daily forecasts for each of 250 SKU–warehouse combinations, covering **December 31, 2024 to January 29, 2025**. The notebook reports a combined forecast of approximately **159,457 units** and no missing or negative forecast values.

The forecast workbook also reports the highest 30-day SKU-level forecast totals for:

- SKU_48: **3,671.15 units**
- SKU_12: **3,507.20 units**
- SKU_37: **3,494.53 units**
- SKU_36: **3,476.66 units**
- SKU_17: **3,471.87 units**

These SKUs are useful candidates for closer forecast and replenishment review. Forecast values should still be monitored against actual demand as new observations become available.

## 5. Inventory Segmentation and Health

### 5.1 ABC analysis

ABC classification used cumulative consumption value, calculated from total units sold multiplied by unit cost.

| Class | SKU–warehouse combinations | Share |
|---|---:|---:|
| A | 163 | 65.2% |
| B | 59 | 23.6% |
| C | 28 | 11.2% |
| **Total** | **250** | **100%** |

Class A contains most combinations under the project's cumulative-value classification and should receive particular attention when reviewing inventory policy and replenishment decisions. The A/B/C labels are based on the thresholds implemented in the notebook.

### 5.2 XYZ analysis

All **250 combinations were classified as X** because their demand coefficient of variation (CV) was below the selected X threshold of 0.50. The observed CV ranged from approximately **0.418 to 0.487**, with a mean of **0.452**.

Consequently, the combined classification contained:

- AX: 163 combinations
- BX: 59 combinations
- CX: 28 combinations

There were no Y or Z combinations under the chosen thresholds. This is the actual result of the implemented classification; thresholds should not be changed solely to force a more balanced distribution. For business use, the CV cut-offs could be reviewed with planners and validated against the desired definition of stable versus variable demand.

### 5.3 Inventory-risk rules

The Phase 8 rule-based summary reported:

| Metric | Combinations | Share |
|---|---:|---:|
| Potential excess inventory | 0 | 0.0% |
| Potential stockout risk | 1 | 0.4% |
| Potential slow movers | 0 | 0.0% |
| Potential fast movers | 146 | 58.4% |
| Potential at-risk combinations | 42 | 16.8% |

These categories use different rule conditions. In particular, the 42 at-risk combinations should not be interpreted as 42 historical stockouts; the dataset's stockout flag is zero throughout. The fast-mover, excess-inventory, and slow-mover results also depend on the project's selected thresholds, so they are screening indicators rather than universal operational definitions.

## 6. Safety Stock and Reorder Point Review

The project calculated safety stock using a **95% target service-level assumption** (Z-score 1.645), historical demand standard deviation, and average supplier lead time. Forecast daily demand was used to estimate demand during lead time.

| Metric | Project result |
|---|---:|
| Average safety stock | 40.71 units |
| Average forecast demand during lead time | 170.66 units |
| Average optimized reorder point | 211.37 units |
| Average existing reorder point | 300.07 units |

Reorder-point comparison produced:

| Recommendation | SKU–warehouse combinations | Share |
|---|---:|---:|
| Reduce ROP | 169 | 67.6% |
| Increase ROP | 44 | 17.6% |
| Maintain ROP | 37 | 14.8% |
| **Total** | **250** | **100%** |

The average optimized reorder point is lower than the average existing reorder point, consistent with the result that more combinations are recommended for a reduction than an increase. This should be treated as a policy-review opportunity, not an automatic instruction to reduce every reorder point. Before implementing changes, the team should validate the demand forecast, service-level target, supplier lead-time assumptions, minimum order quantities, and business criticality.

The safety-stock method is a simplified calculation: it uses historical demand standard deviation and the square root of average lead time. It does not explicitly model lead-time variability or demand–lead-time covariance.

## 7. Replenishment Recommendations

The final replenishment table combines the latest inventory snapshot, forecast demand, average lead time, safety stock, optimized reorder point, and ABC/XYZ class for each SKU–warehouse pair.

Inventory is taken from the latest available observation, **December 30, 2024**, rather than using average inventory as the current stock position.

| Recommendation | Combinations | Share |
|---|---:|---:|
| Hold | 241 | 96.4% |
| Reorder | 6 | 2.4% |
| Urgent | 3 | 1.2% |
| **Total** | **250** | **100%** |

Nine combinations were identified for action:

| SKU | Warehouse | ABC | Current inventory | Optimized ROP | Recommended order quantity | Priority |
|---|---|---|---:|---:|---:|---|
| SKU_50 | WH_4 | A | 236 | 375.64 | 140 | Urgent |
| SKU_2 | WH_1 | A | 271 | 371.73 | 101 | Urgent |
| SKU_44 | WH_3 | A | 200 | 262.35 | 63 | Urgent |
| SKU_3 | WH_1 | B | 367 | 383.49 | 17 | Reorder |
| SKU_44 | WH_4 | C | 302 | 314.43 | 13 | Reorder |
| SKU_36 | WH_1 | A | 386 | 398.36 | 13 | Reorder |
| SKU_48 | WH_5 | B | 369 | 374.01 | 6 | Reorder |
| SKU_27 | WH_4 | A | 315 | 320.21 | 6 | Reorder |
| SKU_30 | WH_2 | A | 335 | 335.56 | 1 | Reorder |

**Recommended action:** Review the three Urgent combinations first, followed by the six Reorder combinations. Confirm supplier availability, order constraints, and the latest live stock position before placing orders. The order quantities are outputs of the project's implemented rule and do not incorporate constraints such as minimum order quantity or pack size.

## 8. Supplier Analytics

The supplier scorecard covers **10 suppliers**. Average lead times range from **6.96 days for SUP_5** to **8.64 days for SUP_4**. Six suppliers were categorized as Long Lead Time because their average lead time exceeded the project's threshold of 8 days; four were categorized as Standard Lead Time.

Supplier volume and lead-time review produced:

| Supplier review category | Supplier count |
|---|---:|
| High Volume + Long Lead Time | 4 |
| High Volume | 2 |
| Long Lead Time | 2 |
| Standard Review | 2 |

Notable observations:

- **SUP_7** has the largest sales-volume share at **13.60%**, is associated with **29 SKUs**, and has an average lead time of **7.56 days**.
- **SUP_4** has the highest average lead time at **8.64 days**.
- **SUP_5** has the lowest average lead time at **6.96 days**.
- The top four suppliers by sales volume account for approximately **46.76%** of total units sold; the top six account for approximately **67.20%**.
- All suppliers are associated with all five warehouses in the scorecard, while their SKU counts differ.

**Recommended action:** Prioritize lead-time monitoring and contingency planning for the four suppliers classified as both High Volume and Long Lead Time. Review supplier concentration and alternative sourcing options where feasible. The dataset does not include direct supplier on-time delivery, quality, purchase-order confirmation, or disruption history, so this is a volume/lead-time exposure review—not a full supplier performance assessment.

## 9. Warehouse Operations and Inventory Allocation

The latest inventory snapshot is dated **December 30, 2024**. The warehouse comparison shows relatively similar demand across the five warehouses, but different inventory positions.

| Warehouse | Latest inventory | Average daily demand | Inventory coverage | Inventory share | Demand share | Allocation review |
|---|---:|---:|---:|---:|---:|---|
| WH_1 | 22,110 | 1,005.21 | 22.00 days | 19.39% | 20.05% | Review lower inventory share |
| WH_2 | 24,504 | 1,002.95 | 24.43 days | 21.49% | 20.00% | Review higher inventory share |
| WH_3 | 22,152 | 1,003.04 | 22.08 days | 19.43% | 20.01% | Review lower inventory share |
| WH_4 | 22,242 | 1,002.12 | 22.19 days | 19.51% | 19.99% | Balanced |
| WH_5 | 23,011 | 1,000.31 | 23.00 days | 20.18% | 19.95% | Balanced |

The coverage values in this comparison use the latest inventory snapshot divided by average daily demand calculated from the historical data. They are therefore estimated coverage days, not a forward simulation of future stock.

The implemented warehouse-risk rules classified all five warehouses as **Monitor**. No warehouse-level at-risk combinations or stockout observations were recorded in the warehouse risk summary.

**Recommended action:** Review WH_2's relatively higher inventory share and WH_1/WH_3's lower inventory shares against demand, service requirements, and SKU-level availability before considering stock transfers. The differences are modest, so the analysis supports a review rather than proving that inventory should be moved.

## 10. Data Validation and Reporting Outputs

The final reporting datasets passed the implemented validation checks:

| Dataset | Rows | Columns | Duplicate rows | Missing cells |
|---|---:|---:|---:|---:|
| Final Replenishment | 250 | 15 | 0 | 0 |
| Forecast Summary | 250 | 4 | 0 | 0 |
| Supplier Scorecard | 10 | 15 | 0 | 0 |
| Warehouse Comparison | 5 | 8 | 0 | 0 |

Business-key validation also passed: SKU + warehouse for replenishment and forecast summaries, supplier ID for the supplier scorecard, and warehouse ID for the warehouse comparison. No duplicate keys or missing key values were found in these outputs.

The project exported:

- `30_Day_SKU_Warehouse_Forecast.xlsx`
- `Final_Replenishment_Recommendations.xlsx`
- `Warehouse_Operations_Analysis.xlsx`
- `PowerBI_Reporting_Datasets.xlsx`

## 11. Business Recommendations

1. **Prioritize the nine replenishment actions.** Review the three Urgent combinations first and confirm current stock and supplier availability before ordering.
2. **Review reorder-point policy.** The model recommends reducing ROP for 169 combinations, but any change should be validated against service requirements and operational constraints.
3. **Monitor high-volume, long-lead suppliers.** Four suppliers fall into this review category under the implemented rules.
4. **Review warehouse inventory allocation.** Investigate the modest share gaps at WH_2, WH_1, and WH_3 before taking corrective action.
5. **Monitor forecast performance over time.** Compare forecasts with actual demand and refresh model choices as new data becomes available.
6. **Investigate promotion-related demand.** Promotion observations show higher average sales; quantify the effect with a more controlled analysis before using it for causal planning assumptions.
7. **Improve future risk validation.** Since historical stockout flags are all zero, use a richer dataset with real stockout, supplier service, and replenishment outcome records to test whether the risk rules predict actual events.

## 12. Limitations and Interpretation Notes

- Results reflect the supplied dataset and the assumptions implemented in the notebooks; they are not proof of realized cost savings or service improvements.
- The `stockout_flag` is zero for all observations, limiting historical stockout validation.
- XYZ classification produced only X items under the selected CV thresholds.
- Reorder-point and replenishment outputs depend on the assumed service level, demand estimates, lead-time aggregation, and implemented rules.
- Supplier analytics use supplier ID, lead time, sales volume, inventory, and SKU association. They do not measure supplier quality, actual on-time delivery, or purchase-order reliability.
- Warehouse analysis is limited to inventory, demand, coverage, and allocation. The dataset does not support carrier, freight cost, transit time, or transportation service KPIs.
- The final reporting datasets were validated for missing cells, duplicate rows, and business-key uniqueness; this does not establish that all business assumptions are correct.

## Conclusion

The project demonstrates an end-to-end analytical workflow that converts historical supply chain data into demand forecasts, inventory segmentation, reorder-point comparisons, replenishment actions, supplier review categories, and warehouse allocation indicators. Its key deliverable is a validated SKU–warehouse replenishment table that helps focus attention on nine combinations requiring action, supported by supplier and warehouse context. The next stage would be to monitor forecast-versus-actual performance and validate the recommended policies against real operational outcomes.