-- 03_analytics_queries.sql
-- Business insights and analytics

-- Total Orders
SELECT COUNT(*) AS total_orders
FROM nw.cleaned_orders;

-- Total Revenue
SELECT ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_revenue
FROM nw.cleaned_orders o
JOIN nw.order_details od ON o.order_id = od.order_id;

-- Top 10 Customers by Revenue
SELECT
  c.company_name,
  ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS revenue
FROM nw.cleaned_orders o
JOIN nw.cleaned_customers c ON o.customer_id = c.customer_id
JOIN nw.order_details od ON o.order_id = od.order_id
GROUP BY c.company_name
ORDER BY revenue DESC
LIMIT 10;

-- Orders per Employee
SELECT
  e.first_name || ' ' || e.last_name AS employee,
  COUNT(o.order_id) AS total_orders
FROM nw.cleaned_orders o
JOIN nw.cleaned_employees e ON o.employee_id = e.employee_id
GROUP BY employee
ORDER BY total_orders DESC;

-- Revenue by Product
SELECT
  p.product_name,
  SUM(od.quantity) AS units_sold,
  ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS revenue
FROM nw.order_details od
JOIN nw.products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 10;

-- Revenue by Country
SELECT
  ship_country,
  ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS revenue
FROM nw.cleaned_orders o
JOIN nw.order_details od ON o.order_id = od.order_id
GROUP BY ship_country
ORDER BY revenue DESC;

-- Revenue by Month (Seasonality)
SELECT
  TO_CHAR(order_date, 'YYYY-MM') AS month,
  ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS revenue
FROM nw.cleaned_orders o
JOIN nw.order_details od ON o.order_id = od.order_id
GROUP BY month
ORDER BY month;
