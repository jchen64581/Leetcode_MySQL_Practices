# Write your MySQL query statement below
SELECT 
    name,
    Bonus 
FROM employee e
LEFT JOIN Bonus  b
    ON e.empId = b.empId
WHERE Bonus < 1000 OR Bonus IS NULL;