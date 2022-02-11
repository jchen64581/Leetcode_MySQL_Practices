# Write your MySQL query statement below
(
SELECT
	'[0-5>' AS bin, 
	SUM(CASE WHEN duration/60 BETWEEN 0 AND 5 THEN 1 ELSE 0 END)  AS total FROM sessions
)
UNION ALL
(
SELECT 
	'[5-10>' AS bin,
	SUM(CASE WHEN duration/60 BETWEEN 5 AND 10 THEN 1 ELSE 0 END)  AS total FROM sessions
)
UNION ALL
(
SELECT
	'[10-15>' AS bin, 
	SUM(CASE WHEN duration/60 BETWEEN 10 AND 15 THEN 1 ELSE 0 END)  AS total FROM sessions
)
UNION ALL
(
SELECT 
	'15 or more' AS bin,
	SUM(CASE WHEN (duration/60) >= 15 THEN 1 ELSE 0 END)  AS total FROM sessions
);