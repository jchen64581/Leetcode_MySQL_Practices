# Write your MySQL query statement below
# x+y > z, x+z > y, and y+z > x
SELECT
    x,
    y,
    z,
    CASE
        WHEN x+y > z AND x+z > Y AND y+z > X THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM triangle;