# Write your MySQL query statement below
# SELECT
# 	DISTINCT product_id AS product_id,
#     MAX(CASE WHEN store = 'store1'  THEN price ELSE NULL END) AS store1,
# 	MAX(CASE WHEN store = 'store2'  THEN price ELSE NULL END) AS store2,
#     MAX(CASE WHEN store = 'store3'  THEN price ELSE NULL END) AS store3
# FROM products
# GROUP BY 1
# ;


select product_id, 
       sum(case when store='store1' then price end) as store1,
       sum(case when store='store2' then price end) as store2,
       sum(case when store='store3' then price end) as store3
from Products
group by product_id