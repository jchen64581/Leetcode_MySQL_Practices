# Write your MySQL query statement below
WITH CTE AS(
SELECT 
	order_id,
    product_id,
    quantity,
    MAX(quantity) AS max_quantity,
    SUM(quantity)/COUNT(DISTINCT product_id) AS avg_quantity
FROM OrdersDetails
GROUP BY order_id)
SELECT 
	order_id
FROM CTE 
WHERE max_quantity > (SELECT MAX(avg_quantity) FROM cte);