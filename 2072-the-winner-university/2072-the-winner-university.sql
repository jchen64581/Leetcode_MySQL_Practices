# Write your MySQL query statement below
SELECT
	CASE 
		WHEN (SELECT SUM(score>=90) FROM NewYork) > (SELECT SUM(score>=90) FROM california) THEN 'New York University'
        WHEN (SELECT SUM(score>=90) FROM NewYork) < (SELECT SUM(score>=90) FROM california) THEN 'California University'
        ELSE 'No Winner' END AS winner;