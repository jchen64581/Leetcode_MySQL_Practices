# Write your MySQL query statement below
WITH cte1 AS (
SELECT 'Android' AS platform
UNION
SELECT 'IOS' 
UNION
SELECT 'Web'),
cte2 AS (
SELECT 'Reading' AS experiment_name 
UNION
SELECT 'Sports' 
UNION
SELECT 'Programming')
SELECT 
	cte1.platform,
    cte2.experiment_name,
    COUNT(experiment_id) AS num_experiments 
FROM cte1 CROSS JOIN cte2
LEFT JOIN Experiments 
	ON cte1.platform = Experiments.platform AND cte2.experiment_name = Experiments.experiment_name
GROUP BY 1,2
ORDER BY platform, experiment_name;