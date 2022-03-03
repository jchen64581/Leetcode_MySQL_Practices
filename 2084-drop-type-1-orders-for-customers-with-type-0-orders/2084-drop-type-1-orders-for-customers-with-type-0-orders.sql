# Write your MySQL query statement below
WITH CTE AS(
SELECT
    customer_id,
    IF(COUNT(DISTINCT order_type)>1, 0, order_type) AS order_type 
FROM orders 
GROUP BY customer_id)
SELECT
	order_id,
    cte.customer_id,
    cte.order_type
FROM cte LEFT JOIN orders ON cte.customer_id = orders.customer_id AND cte.order_type = orders.order_type;