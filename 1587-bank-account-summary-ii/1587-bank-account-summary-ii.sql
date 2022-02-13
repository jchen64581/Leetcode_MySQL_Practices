# Write your MySQL query statement below
SELECT
    name,
    SUM(amount) AS balance
FROM users u 
LEFT JOIN transactions t 
	ON u.account = t.account
GROUP BY 1
HAVING SUM(amount) > 10000;