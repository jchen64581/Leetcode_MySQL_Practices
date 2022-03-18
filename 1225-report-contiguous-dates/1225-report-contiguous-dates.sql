# Write your MySQL query statement below
# Create table If Not Exists Failed (fail_date date)
# Create table If Not Exists Succeeded (success_date date)
# Truncate table Failed
# insert into Failed (fail_date) values ('2018-12-28')
# insert into Failed (fail_date) values ('2018-12-29')
# insert into Failed (fail_date) values ('2019-01-04')
# insert into Failed (fail_date) values ('2019-01-05')
# Truncate table Succeeded
# insert into Succeeded (success_date) values ('2018-12-30')
# insert into Succeeded (success_date) values ('2018-12-31')
# insert into Succeeded (success_date) values ('2019-01-01')
# insert into Succeeded (success_date) values ('2019-01-02')
# insert into Succeeded (success_date) values ('2019-01-03')
# insert into Succeeded (success_date) values ('2019-01-06')

SELECT stats AS period_state, MIN(day) AS start_date, MAX(day) AS end_date
FROM (
    SELECT 
        day, 
        RANK() OVER (ORDER BY day) AS overall_ranking, 
        stats, 
        rk, 
        (RANK() OVER (ORDER BY day) - rk) AS inv
    FROM (
        SELECT fail_date AS day, 'failed' AS stats, RANK() OVER (ORDER BY fail_date) AS rk
        FROM Failed
        WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'
        UNION 
        SELECT success_date AS day, 'succeeded' AS stats, RANK() OVER (ORDER BY success_date) AS rk
        FROM Succeeded
        WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31') t
    ) c
GROUP BY inv, stats
ORDER BY start_date




