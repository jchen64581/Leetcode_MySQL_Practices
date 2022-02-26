# Write your MySQL query statement below
SELECT
	employee_id,
    department_id
FROM employee
GROUP BY employee_id
HAVING COUNT(department_id) = 1
UNION
SELECT
	employee_id,
	department_id
FROM employee
WHERE primary_flag  = 'Y'
ORDER BY employee_id;    


# # method 2
# select
# 	employee_id,
# 	coalesce(max(case when primary_flag='Y' then department_id else null end),max(department_id)) department_id
#   from employee t
#   group by employee_id;
# # coalesce Return the first non-null value in a list


# #method 3
# SELECT EMPLOYEE_ID,DEPARTMENT_ID
# FROM
# (
# SELECT *,COUNT(EMPLOYEE_ID) OVER(PARTITION BY EMPLOYEE_ID) C
# FROM EMPLOYEE
# )T
# WHERE C=1 OR PRIMARY_FLAG='Y'