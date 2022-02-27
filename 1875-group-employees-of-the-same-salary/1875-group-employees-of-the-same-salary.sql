# Write your MySQL query statement below
WITH cte AS (
SELECT
	employee_id,
    name,
    salary,
    COUNT(employee_id) OVER (PARTITION BY salary) AS counts
FROM Employees
ORDER BY salary)
SELECT
	employee_id,
    name,
    salary,
	DENSE_RANK() OVER (ORDER BY salary) AS team_id
FROM cte
WHERE counts > 1
ORDER BY team_id, employee_id;
