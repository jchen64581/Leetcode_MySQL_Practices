# Write your MySQL query statement below
## x+y > z, x+z > y, and y+z > x
# SELECT
#     x,
#     y,
#     z,
#     CASE
#         WHEN x+y > z AND x+z > Y AND y+z > X THEN 'Yes'
#         ELSE 'No'
#     END AS triangle
# FROM triangle;

# method 2
SELECT *, 
    IF(x + y > z AND x + z > y AND y + z > x, 'Yes', 'No') AS triangle 
FROM triangle;