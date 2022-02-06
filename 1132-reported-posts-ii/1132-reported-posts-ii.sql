# Write your MySQL query statement below

WITH removed_rate AS (
    SELECT      COUNT(DISTINCT r.post_id) / COUNT(DISTINCT a.post_id) AS remv_rate
    FROM        actions a 
    LEFT JOIN   removals r 
		ON a.post_id = r.post_id
    WHERE       extra = 'spam'
    GROUP BY    action_date
)
SELECT  ROUND( AVG(remv_rate) * 100, 2 ) AS average_daily_percent
FROM  removed_rate;



# WITH cte AS (
# SELECT
#     avg_removed_rate
# FROM
# (SELECT 
#     AVG(CASE WHEN remove_date IS NOT NULL THEN 1 ELSE 0 END) OVER (PARTITION BY action_date) AS avg_removed_rate
# FROM actions a
# LEFT JOIN removals r 
# 	ON a.post_id = r.post_id
# WHERE extra = 'spam') AS temp
# GROUP BY 1)
# SELECT
# 	ROUND(AVG(avg_removed_rate),2)*100 AS average_daily_percent 
# FROM cte;







