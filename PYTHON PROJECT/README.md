
# SaaS Business Analytics Engine (Python)

## Overview
This project is a **senior-level Python analytics engine** built to analyze core business metrics for a SaaS-style product.  
It focuses on **revenue intelligence, churn analysis, cohort retention, and A/B testing**, following a clean and modular analytics workflow.

The project mirrors how analytics is implemented in real companies:
- Business logic is written as reusable Python modules
- Results are surfaced via a minimal executive notebook
- Emphasis is on **decision-making insights**, not just code execution

---

## Business Questions Answered
- What is the total revenue and ARPU?
- Which subscription plans drive the most revenue?
- How concentrated is revenue among top users?
- What percentage of users are churned?
- How much monthly revenue is at risk due to churn?
- How does retention vary across signup cohorts?
- Did the A/B experiment improve conversion rates?

---

## Key Analytics Modules
- **Revenue Metrics**  
  Calculates total revenue, ARPU, and revenue distribution by plan.

- **Revenue Concentration Analysis**  
  Identifies how much revenue is driven by top users to assess business risk.

- **Churn Analysis**  
  Defines churn using inactivity logic and quantifies revenue at risk.

- **Cohort Retention Analysis**  
  Builds a signup-month cohort retention matrix to analyze user behavior over time.

- **A/B Testing Analysis**  
  Compares conversion rates between control and variant groups and measures lift.

---

## Project Structure
```

python-analytics/
│
├── data/
│   └── raw/
│       └── saas_users.csv
│
├── src/
│   ├── load_and_validate.py
│   ├── revenue_metrics.py
│   ├── revenue_concentration.py
│   ├── churn_analysis.py
│   ├── cohort_retention.py
│   ├── ab_testing.py
│
├── notebooks/
│   └── 01_executive_summary.ipynb
│
├── README.md
├── requirements.txt
├── .gitignore

````

---

## How to Run

### 1. Install dependencies
```bash
pip install -r requirements.txt
````

### 2. Run the analytics pipeline

```bash
python src/load_and_validate.py
```

### 3. View executive insights

Open the notebook below for a high-level summary of results:

```
notebooks/01_executive_summary.ipynb
```

---

## Skills Demonstrated

* Python (Pandas, NumPy)
* Business & Product Analytics
* Revenue & Growth Analysis
* Churn & Retention Modeling
* Cohort Analysis
* A/B Testing & Experiment Evaluation
* Modular, production-style Python code

---

## Author

**Sathvik S Shet**
Data Analyst — SQL | Python | Power BI




