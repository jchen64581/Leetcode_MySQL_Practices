# Write your MySQL query statement below
# SELECT 
#   s.user_id,
#   ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1.00 ELSE 0.00 END),2) AS confirmation_rate
# FROM Signups s LEFT JOIN Confirmations c ON s.user_id = c.user_id
# GROUP BY s.user_id;


select
    s.user_id,
    ifnull(round(sum(action='confirmed')/sum(action='confirmed' or action='timeout'), 2), 0) as confirmation_rate
from signups s
left join confirmations c
on s.user_id = c.user_id
group by s.user_id;