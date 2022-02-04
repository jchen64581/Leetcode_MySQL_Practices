# Write your MySQL query statement below
# using self join
SELECT 
    e1.name AS name
FROM employee e1
JOIN employee e2
    ON e1.id = e2.managerId
GROUP BY e1.name
HAVING COUNT(e2.name) >= 5;