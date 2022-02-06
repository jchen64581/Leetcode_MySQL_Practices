# Write your MySQL query statement below
SELECT 
	user_id AS buyer_id,
    join_date,
    IFNULL(COUNT(order_id),0) AS orders_in_2019 
FROM users u
LEFT JOIN orders o
	ON u.user_id = o.buyer_id AND YEAR(order_date) = 2019
GROUP BY 1;

# this won't work:
# SELECT 
# 	user_id AS buyer_id,
#     join_date,
#     IFNULL(COUNT(order_id),0) AS orders_in_2019 
# FROM users u
# LEFT JOIN orders o
# 	ON u.user_id = o.buyer_id 
# WHERE YEAR(order_date) = 2019 
# GROUP BY 1;
#notice the diffference between filter in a where clause and filter using join,

