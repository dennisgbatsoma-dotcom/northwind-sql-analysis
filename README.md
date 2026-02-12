# Northwind SQL Analysis Project

## 📖 Project Overview
This project analyzes the Northwind database using PostgreSQL.

The goal of this project is to:
- Practice SQL querying
- Perform data cleaning
- Validate data quality
- Generate business insights

This project is beginner-level and demonstrates my understanding of SQL fundamentals.

---

## 🛠 Tools Used
- PostgreSQL
- pgAdmin
- Northwind Sample Database
- GitHub

---

## 📂 Project Structure

northwind-sql-analysis/
│
├── 01_schema_and_cleaning.sql
├── 02_data_quality_checks.sql
├── 03_analytics_queries.sql
└── README.md

---

## 🧹 Data Cleaning Performed
- Standardized text fields using TRIM() and INITCAP()
- Removed null values from important columns
- Created cleaned views for:
  - cleaned_customers
  - cleaned_orders
  - cleaned_employees

---

## 🔍 Data Quality Checks
- Checked for NULL values
- Verified foreign key relationships
- Counted total records per table
- Identified invalid dates

---

## 📊 Sample Analytics Queries

### Total Orders
```sql
SELECT COUNT(*) AS total_orders
FROM nw.cleaned_orders;
```

### Total Revenue
```sql
SELECT 
SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_revenue
FROM nw.cleaned_order_details od;
```

---

## 📈 Key Insights
- Total number of orders in the dataset
- Revenue generated from product sales
- Top customers by revenue
- Most sold products

---

## 🎯 What I Learned
- Creating views in PostgreSQL
- Writing JOIN queries
- Using aggregate functions (SUM, COUNT, AVG)
- Handling schema and case sensitivity issues
- Data validation techniques

---

## 🚀 Future Improvements
- Build dashboard in Power BI or Tableau
- Add more advanced KPIs
- Optimize queries for performance
