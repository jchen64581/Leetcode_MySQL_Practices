# Write your MySQL query statement below
WITH cte AS (
SELECT
	business_id,
	event_type,
    occurences,
    CASE WHEN occurences > AVG(occurences) OVER (PARTITION BY event_type) THEN 'yes' ELSE 'no' END AS greater_than_avg
FROM events)
SELECT 
	business_id
FROM cte 
WHERE greater_than_avg = 'yes'
GROUP BY 1
HAVING COUNT(event_type) > 1;