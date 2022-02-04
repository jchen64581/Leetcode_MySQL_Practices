# Write your MySQL query statement below
WITH w_function AS(
SELECT 
	id,
    name,
    COUNT(candidateId) AS num_votes
FROM (SELECT c.id AS id, name, candidateId FROM candidate c LEFT JOIN vote v ON c.id = v.candidateId) AS temp 
GROUP BY id)
SELECT 
	name
FROM w_function
WHERE num_votes = (SELECT MAX(num_votes) FROM w_function);
    
