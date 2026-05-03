# 📊 HR Analytics & Attrition Risk Dashboard

## 🔹 Project Overview

This project presents an interactive **HR Analytics Dashboard** built in Power BI to analyze employee data and uncover key drivers of attrition. It enables HR teams and stakeholders to make **data-driven decisions** by identifying patterns in workforce behavior, retention risks, and organizational structure.

The dashboard focuses on answering critical business questions such as:

* What factors are driving employee attrition?
* Which departments and roles are most affected?
* How do salary, tenure, and demographics impact retention?

---

## 🔹 Data Model

The dashboard is built using a **star schema data model**:

### 📁 Fact Table

**Fact_Employee**

* Employee ID
* Age
* Gender
* Salary
* Job Role
* Attrition Status
* Years at Company
* Performance Rating

### 📁 Dimension Table

**Dim_Department**

* Department ID
* Department Name

This structure ensures efficient querying and scalable analytics.

---

## 🔹 Key Metrics

* 👥 Total Employees
* 🚪 Attrition Count
* 📉 Attrition Rate (%)
* 💰 Average Salary
* ⏳ Average Tenure
* 🏢 Department-wise Attrition
* ⚖️ Gender Distribution
* 🎯 Performance Insights

---

## 🔹 Dashboard Pages & Features

### 📌 1. Overview Dashboard

* High-level KPIs
* Total workforce snapshot
* Attrition summary
* Department distribution

### 📌 2. Attrition Analysis

* Attrition by department and role
* Attrition by age group
* Attrition by years at company
* Identification of high-risk segments

### 📌 3. Employee Insights

* Salary vs attrition trends
* Gender-based workforce analysis
* Experience vs retention patterns

---

## 🔹 Key Insights Derived

* Employees with **lower tenure** show higher attrition rates
* Certain departments have **significantly higher turnover**, indicating potential operational issues
* Compensation and job role are **major influencing factors** in retention
* Workforce demographics reveal patterns useful for **targeted HR strategies**

---

## 🔹 Business Value

This dashboard helps organizations to:

* Identify and reduce attrition risks
* Improve employee retention strategies
* Optimize hiring and workforce planning
* Support leadership with actionable HR insights

---

## 🔹 Tools & Technologies

* **Power BI** – Dashboard development & visualization
* **Excel** – Data source
* **Data Modeling** – Star schema design

---

## 🔹 How to Use

1. Open the `.pbix` file in Power BI Desktop
2. Load or refresh the dataset if needed
3. Navigate through report pages using tabs
4. Use slicers and filters to explore insights interactively

---

## 🔹 Future Enhancements

* Add **predictive attrition modeling** using Python/ML
* Enable **real-time data integration**
* Implement **drill-through and advanced filtering**

---

## 🔹 Author

**Suraj Shet**
Business Operations → Data Analytics
SQL | Power BI | Python

---

## ⭐ Support

If you found this project helpful, consider giving it a ⭐ on GitHub!
