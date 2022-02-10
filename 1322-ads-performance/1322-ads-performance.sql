# Write your MySQL query statement below
SELECT
	ad_id,
    ROUND(IFNULL((SUM(CASE WHEN action = 'clicked' THEN 1 ELSE 0 END)
    /(SUM(CASE WHEN action = 'clicked' THEN 1 ELSE 0 END) + SUM(CASE WHEN action = 'viewed' THEN 1 ELSE 0 END))*100),0),2) AS ctr
FROM ads
GROUP BY 1
ORDER BY 2 DESC, 1;