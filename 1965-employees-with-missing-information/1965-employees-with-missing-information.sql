# Write your MySQL query statement below
WITH cte AS (
SELECT
	e.employee_id,
    name,
    s.salary
FROM employees e 
LEFT JOIN salaries s
	ON e.employee_id = s.employee_id
UNION
SELECT 
	s.employee_id,
    name,
    salary
FROM salaries s 
LEFT JOIN employees e 
	ON s.employee_id = e.employee_id)
SELECT 
	employee_id
FROM cte 
WHERE name IS NULL OR salary IS NULL
ORDER BY employee_id;