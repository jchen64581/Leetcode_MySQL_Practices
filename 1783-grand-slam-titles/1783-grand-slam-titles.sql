# Write your MySQL query statement below
WITH cte AS(
SELECT Wimbledon AS player_id, COUNT(Wimbledon) AS counts FROM Championships GROUP BY Wimbledon
UNION ALL
SELECT Fr_open, COUNT(Fr_open)  FROM Championships GROUP BY Fr_open 
UNION ALL
SELECT US_open, COUNT(US_open)  FROM Championships GROUP BY US_open 
UNION ALL
SELECT Au_open, COUNT(Au_open)   FROM Championships GROUP BY Au_open)
SELECT 
	players.player_id,
    player_name,
    SUM(counts) AS grand_slams_count 
FROM cte
JOIN players 
	ON cte.player_id = players.player_id
GROUP BY player_id;
