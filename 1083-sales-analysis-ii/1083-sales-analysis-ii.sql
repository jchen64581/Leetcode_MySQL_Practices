# Write your MySQL query statement below
SELECT
	buyer_id
FROM sales s
LEFT JOIN product p	
	ON s.product_id = p.product_id
GROUP BY buyer_id
HAVING SUM(product_name = 'S8' ) > 0
AND SUM(product_name = 'iphone') = 0;