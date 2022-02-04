# Write your MySQL query statement below
# SELECT
#     name
# FROM customer
# WHERE referee_id <> 2 OR referee_id IS NULL;

#method 2
SELECT name
FROM customer
WHERE IFNULL(referee_id, 0) <> 2