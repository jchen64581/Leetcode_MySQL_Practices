# Write your MySQL query statement below
SELECT
	q.id,
    q.year,
    IFNULL(npv,0) AS npv    
FROM queries q
LEFT JOIN NPV n
	ON q.id = n.id AND q.year = n.year
ORDER BY 1;