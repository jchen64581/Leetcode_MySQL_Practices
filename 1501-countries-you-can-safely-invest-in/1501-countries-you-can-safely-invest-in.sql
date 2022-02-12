# Write your MySQL query statement below
SELECT
	c1.name AS country
FROM country c1
LEFT JOIN person p
	ON c1.country_code = LEFT(phone_number,3)
LEFT JOIN calls c2
	ON p.id IN (c2.caller_id, c2.callee_id)
GROUP BY c1.name
HAVING AVG(duration) > (SELECT AVG(duration) FROM calls);


# SELECT
# 	c1.name AS country
# FROM country c1
# LEFT JOIN person p
# 	ON c1.country_code = LEFT(phone_number,3)
# LEFT JOIN calls c2
# 	ON (p.id = c2.caller_id) OR (p.id = c2.callee_id)
# GROUP BY c1.name
# HAVING AVG(duration) > (SELECT AVG(duration) FROM calls);