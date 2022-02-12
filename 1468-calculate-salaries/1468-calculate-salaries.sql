# Write your MySQL query statement below
SELECT 
	company_id, 
    employee_id, 
    employee_name,
    ROUND(CASE
		WHEN MAX(salary) OVER (PARTITION BY company_id) <1000 THEN salary
		WHEN MAX(salary) OVER (PARTITION BY company_id) <=10000 THEN salary*(1-0.24)
        ELSE salary*(1-0.49)
	END) AS salary
FROM salaries;