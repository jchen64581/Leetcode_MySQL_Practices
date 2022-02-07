# Write your MySQL query statement below
SELECT
	DISTINCT country_name,
	CASE 
		WHEN avg_state <= 15 THEN 'Cold'
        WHEN avg_state >= 25 THEN 'Hot'
        ELSE 'Warm'
	END AS weather_type 
FROM
(SELECT
    country_name,
    weather_state,
    AVG(weather_state) OVER (PARTITION BY country_name) AS avg_state
FROM countries c
LEFT JOIN weather w
	ON c.country_id = w.country_id
WHERE YEAR(day) = 2019 AND MONTH(day) = 11) AS temp;