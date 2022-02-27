# Write your MySQL query statement below
WITH cte AS (
SELECT
	home_team_id, 
    COUNT(home_team_id) AS matches_played ,
    SUM(CASE
		WHEN home_team_goals > away_team_goals THEN 3  #win
        WHEN home_team_goals < away_team_goals THEN 0
        ELSE 1
	END) AS points,
    SUM(home_team_goals) AS goal_for,
    SUM(away_team_goals) AS goal_against 
FROM matches
GROUP BY home_team_id
UNION ALL
SELECT
	away_team_id,
    COUNT(away_team_id ) AS matches_played,
      SUM(CASE
		WHEN home_team_goals < away_team_goals THEN 3  #win
        WHEN home_team_goals > away_team_goals THEN 0
        ELSE 1
	END) AS points,
    SUM(away_team_goals ) AS goal_for,
	SUM(home_team_goals) AS goal_against 
FROM matches
GROUP BY away_team_id ),
cte2 AS (
SELECT
	home_team_id AS team_id,
    SUM(matches_played) AS matches_played,
    SUM(points) AS points,
    SUM(goal_for) AS goal_for,
    SUM(goal_against) AS goal_against
FROM cte 
GROUP BY home_team_id)
SELECT 
	team_name,
    matches_played,
    points,
    goal_for,
    goal_against,
    goal_for - goal_against AS goal_diff
FROM teams  
JOIN cte2 
	ON teams.team_id = cte2.team_id
ORDER BY 3 DESC, 6 DESC, 1 ;