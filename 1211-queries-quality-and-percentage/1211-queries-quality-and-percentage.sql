# Write your MySQL query statement below

select
	DISTINCT query_name,
    avg_quality_rate AS quality ,
    ROUND((COUNT(CASE WHEN rating < 3 THEN 1 ELSE NULL END)/COUNT(*))*100,2) AS poor_query_percentage 
FROM
(SELECT
	query_name,
    rating,
	ROUND(AVG(rating/position) OVER (PARTITION BY query_name),2) AS avg_quality_rate
FROM queries) AS temp
GROUP BY 1;


# select
# 	DISTINCT query_name,
#     avg_quality_rate AS quality ,
#     ROUND((COUNT(CASE WHEN rating < 3 THEN 1 ELSE NULL END)/COUNT(*))*100,2) AS poor_query_percentage 
# FROM
# (SELECT
# 	query_name,
#     result,
#     position,
#     rating,
#     rating/position AS quality_rate,
# 	ROUND(AVG(rating/position) OVER (PARTITION BY query_name),2) AS avg_quality_rate
# FROM queries) AS temp
# GROUP BY 1;