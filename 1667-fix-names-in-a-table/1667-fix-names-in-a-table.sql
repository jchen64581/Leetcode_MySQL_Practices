# Write your MySQL query statement below
SELECT
	user_id,
    CONCAT(UPPER(LEFT(name,1)), LOWER(MID(name,2))) AS name
FROM users
ORDER BY 1;