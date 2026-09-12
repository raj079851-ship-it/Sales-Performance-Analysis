--------------------------------- Data Validation & Structure ---------------------------
-- 1. Total Records
SELECT COUNT(*) AS total_records
FROM public.sales_data;

--2 Check Column Names & Data Types
SELECT 
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'sales_data'
ORDER BY ordinal_position;

-- 3 Preview the Data
SELECT *
FROM public.sales_data
LIMIT 10;

----------------------------------- KPI Analysis ------------------------------------------
-- 1. Total Revenue
SELECT 
    SUM(sales) AS total_revenue
FROM public.sales_data;

-- 2. Total Orders
SELECT 
    COUNT(*) AS total_orders
FROM public.sales_data;

-- 3. Total Customers
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers
FROM public.sales_data;
-----

--------------------------------------------- Business Insights --------------------------------------------
-- 1. Sales Performance by Category
SELECT
    category,
    SUM(sales) AS total_sales
FROM sales_data
GROUP BY category
ORDER BY total_sales DESC;

-- 2. Sub-Category Sales Performance
SELECT
    sub_category,
    SUM(sales) AS total_sales
FROM sales_data
GROUP BY sub_category
ORDER BY total_sales DESC;

-- 3. Regional Sales Performance 
SELECT
    region,
    SUM(sales) AS total_sales
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;

-- 4. Top 10 Products by Sales
SELECT
    product_name,
    SUM(sales) AS total_sales
FROM sales_data
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- 5. State wise Sales Performance
SELECT
    state,
    SUM(sales) AS total_sales
FROM sales_data
GROUP BY state
ORDER BY total_sales DESC;