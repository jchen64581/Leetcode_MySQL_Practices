# Write your MySQL query statement below
WITH cte AS (
SELECT
    person_name,
	SUM(weight) OVER (ORDER BY turn) AS running_sum
FROM queue 
ORDER BY turn)
SELECT person_name FROM cte 
WHERE running_sum <= 1000
ORDER BY running_sum DESC
LIMIT 1;



# WITH cte AS (
# SELECT 
# 	turn,
#     person_id,
#     person_name,
#     weight,
# 	SUM(weight) OVER (ORDER BY turn) AS running_sum
# FROM queue 
# ORDER BY turn)
# SELECT person_name FROM cte 
# WHERE running_sum <= 1000
# ORDER BY running_sum DESC
# LIMIT 1;