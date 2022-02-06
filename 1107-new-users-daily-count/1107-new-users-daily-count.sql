# Write your MySQL query statement below
# WITH cte AS (
# SELECT
# 	user_id,
# 	MIN(activity_date) AS first_login
# FROM traffic
# WHERE activity = 'login'
# GROUP BY 1)
# SELECT 
# 	first_login AS login_date,
#     COUNT(user_id) AS user_count
# FROM cte
# WHERE DATEDIFF('2019-06-30', first_login) <= 90
# GROUP BY 1;

#method 2
SELECT 
	login_date, 
    COUNT(*) AS user_count
FROM
(SELECT user_id, MIN(activity_date) AS login_date
FROM traffic
WHERE activity = 'login'
GROUP BY user_id) a
WHERE login_date BETWEEN DATE_ADD('2019-06-30', INTERVAL -90 DAY) AND '2019-06-30'
GROUP BY login_date;