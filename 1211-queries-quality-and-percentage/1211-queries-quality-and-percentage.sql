# Write your MySQL query statement below

select
	query_name,
	ROUND(AVG(rating/position),2) AS quality,
    ROUND((COUNT(CASE WHEN rating < 3 THEN 1 ELSE NULL END)/COUNT(*))*100,2) AS poor_query_percentage 
FROM queries AS temp
GROUP BY 1;
