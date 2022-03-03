# Write your MySQL query statement below
WITH cte AS (
SELECT departure_airport AS airport_id, flights_count  FROM flights
UNION ALL
SELECT arrival_airport, flights_count   FROM flights),
cte2 AS (
SELECT
	airport_id,
    SUM(flights_count) AS num_flight,
    RANK() OVER (ORDER BY SUM(flights_count) DESC) AS flight_rank
FROM cte
GROUP BY airport_id)
SELECT
	airport_id
FROM cte2
WHERE flight_rank = 1
  ;