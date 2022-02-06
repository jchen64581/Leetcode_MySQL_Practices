# Write your MySQL query statement below
SELECT
	ROUND((SUM(CASE WHEN order_date  =  customer_pref_delivery_date THEN 1 ELSE 0 END)/COUNT(*))*100,2) AS immediate_percentage 
FROM delivery 
WHERE (customer_id, order_date) IN
(SELECT
	customer_id,
    MIN(order_date) AS first_order
FROM delivery
GROUP BY 1);