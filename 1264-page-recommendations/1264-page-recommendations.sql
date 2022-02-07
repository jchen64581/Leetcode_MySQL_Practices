# Write your MySQL query statement below
WITH cte AS(
SELECT
	user2_id AS user1_friends_id
FROM friendship
WHERE user1_id = 1
UNION
SELECT 
	user1_id
FROM friendship 
WHERE user2_id = 1)
SELECT
    DISTINCT page_id AS recommended_page 
FROM cte 
Join likes ON user1_friends_id = user_id
WHERE page_id NOT IN (SELECT page_id FROM likes WHERE user_id = 1);