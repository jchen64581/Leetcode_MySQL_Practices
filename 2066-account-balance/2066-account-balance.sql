# Write your MySQL query statement below
SELECT
	account_id,
    day,
    SUM(CASE WHEN type = 'Withdraw' THEN -amount ELSE +amount END)  OVER (PARTITION BY account_id ORDER BY day) AS balance
FROM transactions
ORDER BY account_id, day;



# SELECT account_id, day, SUM(amt) OVER (PARTITION BY account_id ORDER BY day) as balance
# FROM (
# SELECT account_id, day, (CASE WHEN type='Deposit' THEN amount ELSE -amount END) as amt
# FROM transactions) as tb1
# ORDER BY account_id, day;