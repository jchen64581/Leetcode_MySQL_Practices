# Write your MySQL query statement below
# SELECT
# 	e1.employee_id
# FROM employees e1 
# LEFT JOIN employees e2
# 	ON e1.manager_id = e2.employee_id
# WHERE e1.salary < 30000 AND e2.employee_id IS NULL;

SELECT
	employee_id
FROM employees 
WHERE salary < 30000 AND manager_id NOT IN (SELECT employee_id FROM employees) 
ORDER BY 1;