# Write your MySQL query statement below
SELECT 
	c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o 
	ON c.customer_id = o.customer_id
GROUP BY 1
HAVING SUM(CASE WHEN product_name = 'A' OR product_name = 'B' THEN 1 WHEN product_name = 'C' THEN -1 ELSE 0 END) >= 2
ORDER BY customer_id;