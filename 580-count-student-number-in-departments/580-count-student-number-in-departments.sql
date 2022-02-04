# Write your MySQL query statement below

SELECT 
	dept_name,
    COUNT(student_name) AS student_number
FROM student s
RIGHT JOIN department d
	ON s.dept_id = d.dept_id
GROUP BY 1
ORDER BY 2 DESC, 1;


