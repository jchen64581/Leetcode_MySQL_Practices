# Write your MySQL query statement below
SELECT 
    product_name,
    SUM(unit) AS unit
FROM products p
LEFT JOIN orders o
	ON p.product_id = o.product_id
WHERE MONTH(order_date) = 02
GROUP BY p.product_id
HAVING SUM(unit) >= 100;