# Write your MySQL query statement below
WITH cte AS (
SELECT 
	box_id,
    b.chest_id,
    b.apple_count AS b_apple_count,
    b.orange_count  AS b_orange_count,
    IFNULL(c.apple_count,0) AS c_apple_count,
	IFNULL(c.orange_count,0) AS c_orange_count
FROM boxes b
LEFT JOIN chests c
	ON b.chest_id = c.chest_id)
SELECT 
	SUM(b_apple_count) + SUM(c_apple_count) AS apple_count,
    SUM(b_orange_count) + SUM(c_orange_count) AS orange_count
FROM cte;	
;
