# Write your MySQL query statement below
SELECT
	COUNT(sub.account_id) AS accounts_count
FROM Subscriptions sub
LEFT JOIN streams str
	ON sub.account_id = str.account_id
WHERE (YEAR(start_date) = 2021 OR YEAR(end_date) = 2021) AND YEAR(stream_date) != 2021;