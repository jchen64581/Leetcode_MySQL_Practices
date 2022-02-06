# Write your MySQL query statement below
SELECT 
	student_id,
    MIN(course_id) AS course_id ,
    grade 
FROM enrollments
WHERE (student_id, grade) IN
(SELECT 
	student_id,
    MAX(grade) AS highest_grade
FROM enrollments 
GROUP BY 1)
GROUP BY 1
ORDER BY 1;