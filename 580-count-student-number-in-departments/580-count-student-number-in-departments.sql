# Write your MySQL query statement below
SELECT 
	dept_name,
    COUNT(student_name) AS student_number
FROM
(SELECT 
	student_name,
    d.dept_name AS dept_name
FROM student s
RIGHT JOIN department d
	ON s.dept_id = d.dept_id) temp
GROUP BY 1
ORDER BY 2 DESC, 1;