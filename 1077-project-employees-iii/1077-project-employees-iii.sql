# Write your MySQL query statement below
SELECT 
	project_id,
    p.employee_id
FROM project p
JOIN employee e
	ON p.employee_id = e.employee_id
WHERE (project_id, experience_years) IN
(SELECT 
	project_id,
    MAX(experience_years) AS max_years
FROM project a
JOIN employee b
	ON a.employee_id = b.employee_id
GROUP BY 1);