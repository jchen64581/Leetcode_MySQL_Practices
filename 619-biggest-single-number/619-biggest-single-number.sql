# Write your MySQL query statement below
SELECT IFNULL(
(SELECT
	num
FROM MyNumbers
GROUP BY 1
HAVING COUNT(*) = 1
ORDER BY COUNT(*), num DESC
LIMIT 1), NULL) AS num;
    