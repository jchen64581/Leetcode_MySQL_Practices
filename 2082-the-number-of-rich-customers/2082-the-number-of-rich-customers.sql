# Write your MySQL query statement below
SELECT COUNT(*) AS rich_count 
FROM (
SELECT
    SUM(amount > 500) AS rich_count
FROM store
GROUP BY customer_id
HAVING SUM(amount > 500) > 0) AS temp;