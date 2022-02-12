# Write your MySQL query statement below
WITH cte AS (
SELECT
	product_name,
    p.product_id AS product_id,
    order_id,
    order_date,
    rank() OVER (PARTITION BY product_name ORDER BY order_date DESC) AS rnk
FROM products p
JOIN orders o 
	ON p.product_id = o.product_id
ORDER BY 1, 2,3)
SELECT 
	product_name,
    product_id,
    order_id,
    order_date
FROM cte
WHERE rnk = 1;