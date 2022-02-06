# Write your MySQL query statement below
WITH cte AS (
SELECT
	user_id,
	MIN(activity_date) AS first_login
FROM traffic
WHERE activity = 'login'
GROUP BY 1)
SELECT 
	first_login AS login_date,
    COUNT(user_id) AS user_count
FROM cte
WHERE first_login IN (SELECT DISTINCT activity_date FROM traffic WHERE DATEDIFF('2019-06-30', activity_date) <= 90)
GROUP BY 1;