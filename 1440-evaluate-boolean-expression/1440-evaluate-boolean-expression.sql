# Write your MySQL query statement below
SELECT 
	e.left_operand, 
    e.operator, 
    e.right_operand,
    CASE
		WHEN operator = '>' THEN IF(v1.value > v2.value, 'true', 'false')
		WHEN operator = '<' THEN IF(v1.value < v2.value, 'true', 'false')
		WHEN operator = '=' THEN IF(v1.value = v2.value, 'true', 'false')
	ELSE NULL END AS value
FROM expressions e
LEFT JOIN variables v1
	ON e.left_operand = v1.name
LEFT JOIN variables v2
	ON e.right_operand = v2.name;