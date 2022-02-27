# Write your MySQL query statement below
# WITH CTE AS(
# SELECT
# 	'Low Salary' AS category
# UNION
# SELECT
# 	'Average Salary' AS category
# UNION
# SELECT
# 	'High Salary' AS category),
# CTE2 AS (
# 	SELECT 
# 		account_id,
#         CASE
# 			WHEN income > 50000 THEN 'High Salary'
# 			WHEN income >= 20000 THEN 'Average Salary'
# 			ELSE 'Low Salary'
# 	    END AS category
# 	FROM accounts
# )
# SELECT
# 	cte.category,
#     COUNT(cte2.category) AS accounts_count
# FROM cte 
# LEFT JOIN cte2 ON cte.category = cte2.category
# GROUP BY cte.category;

SELECT 
    "Low Salary" AS Category,
    SUM(income<20000) AS accounts_count
FROM Accounts
UNION
SELECT  
    "Average Salary" Category,
    SUM(income BETWEEN 20000 AND 50000) AS accounts_count
FROM Accounts
UNION
SELECT 
    "High Salary" category,
    SUM(income>50000) AS accounts_count
FROM Accounts