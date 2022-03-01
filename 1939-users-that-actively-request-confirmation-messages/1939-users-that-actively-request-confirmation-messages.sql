# Write your MySQL query statement below
SELECT
    s.user_id
--     c.time_stamp AS time_stamp ,
--     c1.time_stamp AS time_stamp1
FROM signups s
LEFT JOIN confirmations c
	ON s.user_id = c.user_id
LEFT JOIN confirmations c1
	ON c.user_id = c1.user_id AND c.time_stamp < c1.time_stamp
WHERE TIMESTAMPDIFF(SECOND, c.time_stamp, c1.time_stamp)  <= 86400
GROUP BY s.user_id
;