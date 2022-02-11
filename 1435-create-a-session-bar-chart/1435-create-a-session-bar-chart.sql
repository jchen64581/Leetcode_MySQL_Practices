# Write your MySQL query statement below
(
SELECT
	'[0-5>' AS bin, 
	SUM(duration/60 < 5)  AS total FROM sessions
)
UNION ALL
(
SELECT 
	'[5-10>' AS bin,
	SUM(duration/60 BETWEEN 5 AND 10)  AS total FROM sessions
)
UNION ALL
(
SELECT
	'[10-15>' AS bin, 
	SUM(duration/60 BETWEEN 10 AND 15 )  AS total FROM sessions
)
UNION ALL
(
SELECT 
	'15 or more' AS bin,
	SUM(duration/60 >= 15 )  AS total FROM sessions
);