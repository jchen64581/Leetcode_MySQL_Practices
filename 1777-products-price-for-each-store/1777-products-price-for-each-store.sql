# Write your MySQL query statement below
SELECT
	DISTINCT product_id AS product_id,
    MAX(CASE WHEN store = 'store1' AND product_id = product_id THEN price ELSE NULL END) AS store1,
	MAX(CASE WHEN store = 'store2' AND product_id = product_id THEN price ELSE NULL END) AS store2,
    MAX(CASE WHEN store = 'store3' AND product_id = product_id THEN price ELSE NULL END) AS store3
FROM products
GROUP BY 1
;