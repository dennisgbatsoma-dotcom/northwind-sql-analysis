-- 02_data_quality_checks.sql
-- Check data quality for Northwind tables

-- Null checks
SELECT COUNT(*) AS null_birthdates FROM nw.employees WHERE birth_date IS NULL;
SELECT COUNT(*) AS null_hiredates  FROM nw.employees WHERE hire_date IS NULL;
SELECT COUNT(*) AS null_company    FROM nw.customers WHERE company_name IS NULL;

-- Duplicates check
SELECT customer_id, COUNT(*) AS duplicate_count
FROM nw.customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT order_id, COUNT(*) AS duplicate_count
FROM nw.orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Invalid dates
SELECT *
FROM nw.employees
WHERE birth_date > hire_date;
