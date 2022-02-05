# Write your MySQL query statement below
# SELECT 
# 	project_id,
#     p.employee_id
# FROM project p
# JOIN employee e
# 	ON p.employee_id = e.employee_id
# WHERE (project_id, experience_years) IN
# (SELECT 
# 	project_id,
#     MAX(experience_years) AS max_years
# FROM project a
# JOIN employee b
# 	ON a.employee_id = b.employee_id
# GROUP BY 1);

# method 2 with rank()
# SELECT 
# 	project_id, 
# 	employee_id
# FROM
#     (SELECT project_id,
#     p.employee_id,
#     RANK() OVER(PARTITION BY project_id ORDER BY experience_years DESC) AS my_rank
#     FROM Project p JOIN Employee e
#     ON p.employee_id = e.employee_id) t
# WHERE my_rank = 1;

#method 3 with CTE
WITH cte AS(
SELECT 
    project_id,
    p.employee_id,
    RANK() OVER(PARTITION BY project_id ORDER BY experience_years DESC) AS my_rank
FROM Project p 
JOIN Employee e
    ON p.employee_id = e.employee_id) 
SELECT 
    project_id, 
    employee_id
FROM cte
WHERE my_rank = 1;