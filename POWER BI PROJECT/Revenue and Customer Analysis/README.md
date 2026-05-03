# Revenue and Customer Analysis Dashboard

## Project Overview

This project analyzes customer behavior, subscription trends, churn patterns, support performance, and product usage for RavenStack, a SaaS company. The dashboard was built in Power BI using multiple related datasets to identify revenue drivers, customer retention issues, and growth opportunities.

The analysis combines account, subscription, churn, support ticket, and feature usage data to answer business questions such as:

* Which plan tiers generate the most revenue?
* What factors contribute to customer churn?
* Which industries or countries have the highest-value customers?
* How does product usage relate to retention?
* Are support issues impacting churn and customer satisfaction?

---

# Files Included

| File Name                            | Description                            |
| ------------------------------------ | -------------------------------------- |
| `Revenue and Customer Analysis.pbix` | Main Power BI dashboard file           |
| `ravenstack_accounts.csv`            | Customer account information           |
| `ravenstack_subscriptions.csv`       | Subscription and revenue details       |
| `ravenstack_churn_events.csv`        | Customer churn history and reasons     |
| `ravenstack_feature_usage.csv`       | Product feature usage data             |
| `ravenstack_support_tickets.csv`     | Customer support and satisfaction data |

---

# Dataset Details

## 1. Accounts Table

Contains company-level customer information.

**Important Columns:**

* `account_id`
* `account_name`
* `industry`
* `country`
* `signup_date`
* `referral_source`
* `plan_tier`
* `seats`
* `is_trial`
* `churn_flag`

## 2. Subscriptions Table

Tracks subscription history and revenue.

**Important Columns:**

* `subscription_id`
* `account_id`
* `start_date`
* `end_date`
* `plan_tier`
* `mrr_amount`
* `arr_amount`
* `billing_frequency`
* `upgrade_flag`
* `downgrade_flag`
* `churn_flag`

## 3. Churn Events Table

Provides detailed information about customer churn.

**Important Columns:**

* `churn_event_id`
* `account_id`
* `churn_date`
* `reason_code`
* `refund_amount_usd`
* `preceding_upgrade_flag`
* `preceding_downgrade_flag`
* `is_reactivation`

## 4. Feature Usage Table

Captures how customers use different features of the product.

**Important Columns:**

* `subscription_id`
* `usage_date`
* `feature_name`
* `usage_count`
* `usage_duration_secs`
* `error_count`
* `is_beta_feature`

## 5. Support Tickets Table

Measures customer support performance and satisfaction.

**Important Columns:**

* `ticket_id`
* `account_id`
* `submitted_at`
* `closed_at`
* `resolution_time_hours`
* `priority`
* `first_response_time_minutes`
* `satisfaction_score`
* `escalation_flag`

---

# Data Model

The dashboard uses the following relationships:

* `Accounts[account_id]` → `Subscriptions[account_id]`
* `Accounts[account_id]` → `Churn Events[account_id]`
* `Accounts[account_id]` → `Support Tickets[account_id]`
* `Subscriptions[subscription_id]` → `Feature Usage[subscription_id]`

This creates a star-schema style model with Accounts and Subscriptions acting as the main dimensions.

---

# Key Metrics Created

The following DAX measures were used in the dashboard:

```DAX
Total Revenue = SUM(Subscriptions[mrr_amount])

Total ARR = SUM(Subscriptions[arr_amount])

Total Customers = DISTINCTCOUNT(Accounts[account_id])

Churned Customers =
CALCULATE(
    DISTINCTCOUNT(Accounts[account_id]),
    Accounts[churn_flag] = TRUE()
)

Churn Rate % =
DIVIDE([Churned Customers], [Total Customers], 0)

Average Resolution Time =
AVERAGE(Support Tickets[resolution_time_hours])

Average Satisfaction =
AVERAGE(Support Tickets[satisfaction_score])
```

---

# Dashboard Pages

## 1. Executive Summary

Displays:

* Total Revenue
* Total ARR
* Total Customers
* Churn Rate
* Revenue by Plan Tier
* Customers by Country and Industry

## 2. Customer & Revenue Analysis

Displays:

* Revenue trend over time
* Revenue by plan tier
* Top industries by ARR
* Customer distribution by country
* Subscription upgrade and downgrade analysis

## 3. Churn Analysis

Displays:

* Churn rate by plan tier
* Churn reason breakdown
* Refund amount by churn reason
* Customers who churned after downgrade or upgrade
* Reactivated customers

## 4. Product Usage Analysis

Displays:

* Most used features
* Feature usage by plan tier
* Average usage duration
* Error count by feature
* Relationship between usage and churn

## 5. Support Analysis

Displays:

* Ticket volume over time
* Average response and resolution time
* Satisfaction score by priority
* Escalated tickets
* Support issues contributing to churn

---

# Key Insights

Some example business insights from this project include:

* Enterprise and Pro plans contribute the majority of recurring revenue.
* Customers with low feature usage are more likely to churn.
* Pricing and support are the most common churn reasons.
* High response and resolution times are associated with lower satisfaction scores.
* Certain industries and countries generate significantly higher ARR than others.

---

# Tools Used

* Power BI
* Power Query
* DAX
* CSV Data Sources

---

# How to Use

1. Open `Revenue and Customer Analysis.pbix` in Power BI Desktop.
2. If prompted, reconnect the CSV files.
3. Refresh the data.
4. Explore the dashboard pages and interact with filters and slicers.

---

# Author

Suraj Shet
Data Analyst | SQL | Power BI | Python | Supply Chain & Operations Analytics
