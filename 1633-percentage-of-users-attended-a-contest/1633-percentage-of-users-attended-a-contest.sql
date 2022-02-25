# Write your MySQL query statement below
SELECT
	contest_id,
	ROUND((COUNT(DISTINCT u.user_id)/(SELECT COUNT(*) FROM users))*100,2) AS percentage 
FROM register r
LEFT JOIN users u 
	ON r.user_id = u.user_id
GROUP BY 1
ORDER BY 2 DESC, 1;