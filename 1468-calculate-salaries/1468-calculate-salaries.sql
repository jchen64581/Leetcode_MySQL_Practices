# Write your MySQL query statement below
WITH cte AS (
SELECT
	company_id AS c_id,
	MAX(salary) AS max_salary
FROM  salaries 
GROUP BY 1
)
SELECT
	company_id,
    employee_id,
    employee_name,
    CASE 
		WHEN (SELECT max_salary FROM cte WHERE company_id = c_id) < 1000 THEN ROUND(salary) 
		WHEN (SELECT max_salary FROM cte WHERE company_id = c_id) <= 10000 THEN ROUND(salary*(1-0.24))
		ELSE ROUND(salary*(1-0.49))
	END AS salary
FROM salaries;