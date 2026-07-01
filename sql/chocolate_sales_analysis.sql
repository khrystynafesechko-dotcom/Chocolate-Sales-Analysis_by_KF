select * from sales
limit 10;

---Retrieve column names and their data types for the 'sales' table from the information_schema
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'sales';

---Check for rows where profit differs from revenue minus cost by more than 0.01
SELECT *
FROM sales
WHERE ABS(profit - (revenue - cost)) > 0.01
LIMIT 20;

---Count NULL values in each column of the sales table
SELECT
    COUNT(*) FILTER (WHERE order_id IS NULL) AS order_id_nulls,
    COUNT(*) FILTER (WHERE product_id IS NULL) AS product_nulls,
	COUNT(*) FILTER (WHERE order_date IS NULL) AS order_date_nulls,
	COUNT(*) FILTER (WHERE store_id IS NULL) AS store_id_nulls,
	COUNT(*) FILTER (WHERE customer_id IS NULL) AS customer_id_nulls,
	COUNT(*) FILTER (WHERE quantity IS NULL) AS quantity_nulls,
	COUNT(*) FILTER (WHERE unit_price IS NULL) AS unit_price_nulls,
	COUNT(*) FILTER (WHERE discount IS NULL) AS discount_nulls,
	COUNT(*) FILTER (WHERE revenue IS NULL) AS revenue_nulls,
	COUNT(*) FILTER (WHERE cost IS NULL) AS cost_nulls,
	COUNT(*) FILTER (WHERE profit IS NULL) AS profit_nulls
FROM sales;

---Count NULL values in each column of the products table
SELECT
    COUNT(*) FILTER (WHERE product_id IS NULL) AS product_id_nulls,
    COUNT(*) FILTER (WHERE product_name IS NULL) AS product_name_nulls,
	COUNT(*) FILTER (WHERE brand IS NULL) AS brand_nulls,
	COUNT(*) FILTER (WHERE category IS NULL) AS category_nulls,
	COUNT(*) FILTER (WHERE cocoa_percent IS NULL) AS cocoa_percent_nulls,
	COUNT(*) FILTER (WHERE weight_g IS NULL) AS weight_g_nulls
FROM products;

---Count NULL values in each column of the stores table
SELECT
    COUNT(*) FILTER (WHERE store_id IS NULL) AS store_id_nulls,
    COUNT(*) FILTER (WHERE store_name IS NULL) AS store_name_nulls,
	COUNT(*) FILTER (WHERE city IS NULL) AS city_nulls,
	COUNT(*) FILTER (WHERE country IS NULL) AS country_nulls,
	COUNT(*) FILTER (WHERE store_type IS NULL) AS store_type_nulls
FROM stores;

---Checked for duplicates in sales table
SELECT order_id, product_id, COUNT(*)
FROM sales
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;

SELECT *,
       COUNT(*) OVER (PARTITION BY 
           order_id, product_id, order_date, store_id, 
           customer_id, quantity, unit_price, discount, 
           revenue, cost, profit
       ) AS cnt
FROM sales;

---Computed total revenue, total cost, and total profit, margin across all sales records
SELECT 
    SUM(revenue) AS total_revenue,
    SUM(cost) AS total_cost,
    SUM(profit) AS total_profit,
    ROUND (SUM(profit)/SUM(revenue), 2) AS margin
FROM sales;

--Validated revenue calculation by comparing stored revenue with both discounted and non-discounted formulas (quantity * unit_price vs quantity * unit_price * (1 - discount)) to check whether discounts are already applied in the dataset.
SELECT
	order_id, product_id, quantity, unit_price, discount, 
	quantity * unit_price AS revenue_without_discount, 
	quantity * unit_price * (1 - discount) AS revenue_with_discount, 
	revenue 
FROM sales;

---Convert product_id column to TEXT data type
ALTER TABLE sales
ALTER COLUMN product_id TYPE TEXT;

---Remove leading and trailing spaces from product_id values
UPDATE sales
SET product_id = TRIM(product_id);

---Convert product_id column to TEXT data type
ALTER TABLE products
ALTER COLUMN product_id TYPE TEXT;

---Remove leading and trailing spaces from product_id values
UPDATE products
SET product_id = TRIM(product_id);

---Joined sales and products tables using a partial match on product_id (LEFT() with LENGTH of sales.product_id) due to inconsistent product_id formats.
-- Aggregated total quantity, revenue, and profit by product_name to identify top-performing products.
SELECT
	products.product_name,
	SUM (quantity) AS total_quantity,
	SUM (revenue) AS total_revenue,
	SUM (profit) AS total_profit
FROM sales	
JOIN products 
    ON LEFT(products.product_id, LENGTH(sales.product_id)) = sales.product_id
GROUP BY products.product_name 
ORDER BY total_revenue DESC
;

---Check if order values are unique 
SELECT 
	COUNT (order_id) AS count_order,
	COUNT (DISTINCT order_id) AS order_id_unique
FROM sales;

---Count average order value
SELECT
	ROUND (AVG (revenue), 2) AS AOV
FROM sales;

---Product performance was analyzed across categories
SELECT 
	SUM (revenue) AS total_revenue
FROM sales
JOIN products on sales.product_id = products.product_id
GROUP BY product_name
ORDER BY total_revenue DESC;


---Joined sales and products tables using a partial match on product_id (LEFT() with LENGTH of sales.product_id) due to inconsistent product_id formats.
-- Aggregates sales data by chocolate category using product name pattern matching and calculates key performance metrics (quantity, revenue, profit)
SELECT
   CASE 
   WHEN product_name ILIKE '%dark%' THEN 'Dark Chocolate'
   WHEN product_name ILIKE '%white%' THEN 'White Chocolate'
   WHEN product_name ILIKE '%truffle%' THEN 'Truffle Chocolate'
   WHEN product_name ILIKE '%milk%' THEN 'Milk Chocolate'
   WHEN product_name ILIKE '%praline%' THEN 'Praline Chocolate'
   END AS chocolate_type,
    	SUM(quantity) AS total_quantity,
    	SUM(revenue) AS total_revenue,
    	SUM(profit) AS total_profit
FROM sales
JOIN products 
     ON LEFT (products.product_id, LENGTH(sales.product_id)) = sales.product_id
GROUP BY 1
ORDER BY total_profit DESC;




     

    
  
	

---This query analyzes the relationship between discount levels and average profit
SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.1 THEN 'Low'
        WHEN discount <= 0.2 THEN 'Medium'
        ELSE 'High'
    END AS discount_group,
    ROUND (AVG(profit),2) AS avg_profit
FROM sales
GROUP BY 1;
