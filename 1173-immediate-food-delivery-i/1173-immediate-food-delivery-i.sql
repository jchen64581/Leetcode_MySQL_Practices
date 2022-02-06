# Write your MySQL query statement below
SELECT 
	ROUND((SUM(immediate)/COUNT(immediate))*100,2) AS immediate_percentage 
FROM
(SELECT
	delivery_id,
    order_date,
    customer_pref_delivery_date,
    CASE WHEN order_date  =  customer_pref_delivery_date THEN 1 ELSE 0 END AS immediate
FROM delivery) AS temp;