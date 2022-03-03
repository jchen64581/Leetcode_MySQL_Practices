# Write your MySQL query statement below
WITH cte AS (
SELECT 
	m.member_id,
	name,
    (100* COUNT(charged_amount))/COUNT(v.visit_id) AS con_rt
FROM members m 
LEFT JOIN visits v ON m.member_id = v.member_id
LEFT JOIN purchases p ON v.visit_id = p.visit_id
GROUP BY m.member_id)
SELECT 
	member_id,
    name,
    CASE 
		WHEN con_rt >= 80 THEN 'Diamond'
        WHEN con_rt >= 50 THEN 'Gold'
        WHEN con_rt IS NULL THEN 'Bronze'
        WHEN con_rt < 50 THEN 'Silver'
        ELSE NULL END AS category
FROM cte;
    