# Write your MySQL query statement below
SELECT 
	project_id
FROM project
GROUP BY project_id
HAVING COUNT(employee_id) =
(SELECT 
    COUNT( employee_id)
FROM project
GROUP BY project_id
ORDER BY COUNT(employee_id) DESC
LIMIT 1);

# SELECT 
# 	DISTINCT project_id
# FROM project
# GROUP BY 1
# ORDER BY COUNT(DISTINCT employee_id) DESC
# LIMIT 1;