# Write your MySQL query statement below
SELECT 
    CASE
        WHEN from_id > to_id THEN to_id
        ELSE from_id
    END AS person1,
    CASE
        WHEN from_id > to_id THEN from_id
        ELSE to_id
    END AS person2,
    COUNT(duration) AS call_count,
    SUM(duration) AS total_duration       
FROM Calls
GROUP BY person2,person1;


# # method 2
# SELECT 
# 	LEAST(from_id,to_id) as person1,
# 	GREATEST(from_id,to_id) as person2,
# 	COUNT(*) as call_count,
# 	SUM(duration) as total_duration
# FROM Calls
# GROUP BY person1,person2;