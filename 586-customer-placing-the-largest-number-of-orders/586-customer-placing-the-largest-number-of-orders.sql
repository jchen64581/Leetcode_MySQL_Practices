# Write your MySQL query statement below
SELECT
    customer_number
FROM orders
GROUP BY 1
ORDER BY COUNT(order_number) DESC
LIMIT 1;
