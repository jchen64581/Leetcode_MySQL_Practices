# Write your MySQL query statement below
SELECT
	name AS warehouse_name,
    SUM((width*length*height)*units) AS volume
FROM warehouse w
LEFT JOIN products p
	ON w.product_id = p.product_id
GROUP BY 1;