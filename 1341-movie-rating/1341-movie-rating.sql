# Write your MySQL query statement below
(SELECT
    name AS results
FROM users u
LEFT JOIN movieRating m_r
	ON u.user_id = m_r.user_id
GROUP BY 1
ORDER BY COUNT(rating) DESC, name
LIMIT 1 
)
UNION
(SELECT
	title
FROM movies m
LEFT JOIN movieRating mr
	ON m.movie_id = mr.movie_id
WHERE YEAR(created_at) = 2020 AND MONTH(created_at) = 02 
GROUP BY m.movie_id
ORDER BY AVG(rating) DESC, title
LIMIT 1);