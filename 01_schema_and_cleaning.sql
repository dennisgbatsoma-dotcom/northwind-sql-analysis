-- 01_schema_and_cleaning.sql
-- Standardize Northwind tables: lowercase names, clean invalid data

-- =========================
-- CLEANED EMPLOYEES
-- =========================
CREATE OR REPLACE VIEW nw.cleaned_employees AS
SELECT
  employee_id,
  INITCAP(TRIM(first_name)) AS first_name,
  INITCAP(TRIM(last_name)) AS last_name,
  title,
  title_of_courtesy,
  birth_date,
  hire_date,
  city,
  country,
  home_phone
FROM nw.employees
WHERE birth_date IS NOT NULL
  AND hire_date IS NOT NULL
  AND birth_date < hire_date;

-- =========================
-- CLEANED CUSTOMERS
-- =========================

CREATE VIEW nw.cleaned_customers AS
SELECT
  customer_id,
  INITCAP(TRIM(company_name)) AS company_name,
  INITCAP(TRIM(contact_name)) AS contact_name,
  INITCAP(TRIM(contact_title)) AS contact_title,
  address,
  region,
  postal_code,
  country,
  phone,
  fax
FROM nw.customers
WHERE company_name IS NOT NULL;






-- =========================
-- CLEANED ORDERS
-- =========================
DROP VIEW nw.cleaned_orders CASCADE;
CREATE OR REPLACE VIEW nw.cleaned_orders AS
SELECT
    order_id,
    customer_id,
    employee_id,
    order_date,
    required_date,
    shipped_date,
    ship_via,
    freight,
    ship_name,
    ship_address,
    ship_city,
    ship_region,
    ship_postal_code,
    ship_country
FROM nw.orders
WHERE order_date IS NOT NULL
  AND required_date IS NOT NULL;

