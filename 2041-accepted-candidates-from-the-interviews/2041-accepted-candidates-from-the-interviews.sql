# Write your MySQL query statement below
SELECT
	candidate_id
FROM candidates c 
LEFT JOIN rounds r ON c.interview_id = r.interview_id
WHERE years_of_exp >= 2
GROUP BY 1
HAVING  SUM(score) > 15;