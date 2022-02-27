# Write your MySQL query statement below
SELECT
	employee_id,
    CASE WHEN employee_id%2 != 0 AND name NOT LIKE 'M%' THEN salary ELSE 0 END AS bonus
FROM employees;

# select employee_id, if(employee_id%2=1 and name not like'M%', salary,0) as bonus
# from Employees;