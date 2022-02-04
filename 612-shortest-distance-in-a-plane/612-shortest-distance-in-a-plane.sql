# Write your MySQL query statement below
WITH temp AS (
SELECT 
	p1.x AS x,
    p1.y AS y,
    p2.x AS x1,
    p2.y AS y1,
    ROUND(sqrt(pow(p2.x- p1.x,2) + pow(p2.y-p1.y,2)),2) AS distance
FROM  Point2D p1
JOIN Point2D p2
	ON (p1.x, p1.y) <> (p2.x, p2.y)
ORDER BY 5)
SELECT distance AS shortest FROM temp LIMIT 1;