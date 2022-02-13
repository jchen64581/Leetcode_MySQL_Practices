# Write your MySQL query statement below
WITH RECURSIVE num_range AS (
	SELECT 1 AS num
    UNION
    SELECT num + 1
    FROM num_range
    WHERE num < (SELECT MAX(customer_id) FROM customers)
)
SELECT
	num AS ids
FROM num_range 
WHERE num NOT IN (SELECT customer_id FROM customers);