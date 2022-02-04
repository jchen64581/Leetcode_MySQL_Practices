# Write your MySQL query statement below
with w1 as(
SELECT 
    id,
    company,
    salary,
    ROW_NUMBER() OVER (PARTITION BY company ORDER BY salary) AS row_num,
    COUNT(*) OVER (PARTITION BY company) AS company_count
FROM employee)
SELECT
    id,
    company,
    salary
FROM w1 
WHERE row_num BETWEEN company_count/2 AND company_count/2+1;
