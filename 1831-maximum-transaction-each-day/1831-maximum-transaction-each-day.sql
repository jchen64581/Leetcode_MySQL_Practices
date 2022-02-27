# Write your MySQL query statement below
# WITH cte AS (
# SELECT 
# 	transaction_id,
#     day,
#     amount,
#     DENSE_RANK() OVER (PARTITION BY DATE_FORMAT(day, '%Y-%m-%d') ORDER BY amount DESC) AS amount_rank
# FROM transactions)
# SELECT
# 	transaction_id 
# FROM cte
# WHERE amount_rank = 1
# ORDER BY transaction_id;



SELECT  transaction_id
FROM
(
	SELECT  * , DENSE_RANK() OVER (PARTITION BY DATE(day) ORDER BY amount DESC) as dt
	FROM    Transactions
	ORDER BY day ASC
) tmp
WHERE dt = 1
ORDER BY transaction_id ASC;