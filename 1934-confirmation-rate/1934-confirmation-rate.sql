# Write your MySQL query statement below
WITH cte AS (
SELECT
	s.user_id,
    CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END AS confirmed_msg
FROM signups s 
LEFT JOIN confirmations c ON s.user_id = c.user_id)
SELECT 
	user_id,
    ROUND(SUM(confirmed_msg)/COUNT(*),2) AS confirmation_rate 
FROM cte
GROUP BY 1;