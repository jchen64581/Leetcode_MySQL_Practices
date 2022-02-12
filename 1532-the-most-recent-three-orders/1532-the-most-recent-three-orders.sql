# Write your MySQL query statement below
WITH cte AS
(SELECT
	name AS customer_name,
    c.customer_id AS customer_id,
    order_id, 
    order_date,
    rank() OVER (PARTITION BY c.customer_id ORDER BY order_date DESC) AS ranking
FROM customers c
JOIN orders o 
	ON 	c.customer_id = o.customer_id
) 
SELECT
	customer_name,
    customer_id,
    order_id,
    order_date
FROM cte 
WHERE ranking <=3
ORDER BY 1,2,4 DESC;