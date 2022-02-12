# Write your MySQL query statement below
WITH cte AS (
SELECT
	user_id,
    user_name,
    credit,
	SUM(CASE WHEN u.user_id = t.paid_by THEN -amount ELSE 0 END) AS amount_paid,
    SUM(CASE WHEN u.user_id = t.paid_to THEN +amount ELSE 0 END) AS amount_received
FROM users u 
LEFT JOIN transactions t
	ON (u.user_id = t.paid_by) OR (u.user_id = t.paid_to)
GROUP BY 1)
SELECT
	user_id,
    user_name,
    credit + amount_paid + amount_received AS credit,
    IF(credit + amount_paid + amount_received < 0, 'Yes', 'No') AS credit_limit_breached 
FROM cte;
    