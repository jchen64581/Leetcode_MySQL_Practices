# Write your MySQL query statement below
WITH CTE AS (
SELECT B.TEAM_NAME, A.GOAL_FOR, A.GOAL_AGAINST, A.POINTS FROM (
    SELECT
        home_team_id AS TEAM_ID,
        home_team_goals AS GOAL_FOR,
        away_team_goals AS GOAL_AGAINST,
        CASE WHEN home_team_goals > away_team_goals THEN 3
             WHEN home_team_goals < away_team_goals THEN 0
        ELSE 1 END AS POINTS 
    FROM Matches 
    UNION ALL
    SELECT
        away_team_id AS TEAM_ID,
        away_team_goals AS GOAL_FOR,
        home_team_goals AS GOAL_AGAINST,
        CASE WHEN home_team_goals < away_team_goals THEN 3
             WHEN home_team_goals > away_team_goals THEN 0
        ELSE 1 END AS POINTS 
    FROM Matches) A
LEFT JOIN Teams B
ON A.TEAM_ID=B.TEAM_ID )

SELECT TEAM_NAME, 
    COUNT(*) AS matches_played, 
    SUM(POINTS) AS POINTS,
    SUM(GOAL_FOR) AS GOAL_FOR,
    SUM(GOAL_AGAINST) AS GOAL_AGAINST,
    (SUM(GOAL_FOR)-SUM(GOAL_AGAINST)) AS GOAL_DIFF
FROM CTE 
GROUP BY TEAM_NAME
ORDER BY POINTS DESC, GOAL_DIFF DESC, TEAM_NAME ASC;

# select
#     team_name
#     , count(*) as matches_played
#     , sum(case when home > away then 3 when home = away then 1 else 0 end) as points
#     , sum(home) as goal_for
#     , sum(away) as goal_against
#     , sum(home) - sum(away) as goal_diff
    
# from 
#     (select home_team_id, home_team_goals as home, away_team_goals as away from matches
#      union all
#      select away_team_id as home_team_id, away_team_goals as home, home_team_goals as away from matches
# 	 ) g
# join teams t on g.home_team_id = t.team_id
# group by 1
# order by 3 desc, 6 desc, 1



# WITH cte AS (
# SELECT
# 	home_team_id, 
#     COUNT(home_team_id) AS matches_played ,
#     SUM(CASE
# 		WHEN home_team_goals > away_team_goals THEN 3  #win
#         WHEN home_team_goals < away_team_goals THEN 0
#         ELSE 1
# 	END) AS points,
#     SUM(home_team_goals) AS goal_for,
#     SUM(away_team_goals) AS goal_against 
# FROM matches
# GROUP BY home_team_id
# UNION ALL
# SELECT
# 	away_team_id,
#     COUNT(away_team_id ) AS matches_played,
#       SUM(CASE
# 		WHEN home_team_goals < away_team_goals THEN 3  #win
#         WHEN home_team_goals > away_team_goals THEN 0
#         ELSE 1
# 	END) AS points,
#     SUM(away_team_goals ) AS goal_for,
# 	SUM(home_team_goals) AS goal_against 
# FROM matches
# GROUP BY away_team_id ),
# cte2 AS (
# SELECT
# 	home_team_id AS team_id,
#     SUM(matches_played) AS matches_played,
#     SUM(points) AS points,
#     SUM(goal_for) AS goal_for,
#     SUM(goal_against) AS goal_against
# FROM cte 
# GROUP BY home_team_id)
# SELECT 
# 	team_name,
#     matches_played,
#     points,
#     goal_for,
#     goal_against,
#     goal_for - goal_against AS goal_diff
# FROM teams  
# JOIN cte2 
# 	ON teams.team_id = cte2.team_id
# ORDER BY 3 DESC, 6 DESC, 1 ;
