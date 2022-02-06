# Write your MySQL query statement below
SELECT 
	IFNULL(ROUND(AVG(num_session),2), 0.00) AS average_sessions_per_user 
FROM 
(SELECT
    COUNT(DISTINCT session_id) AS num_session
FROM activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27' 
GROUP BY user_id) AS temp;