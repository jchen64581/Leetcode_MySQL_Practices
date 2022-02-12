# Write your MySQL query statement below
SELECT
	LOWER(TRIM(product_name)) AS product_name,
    LEFT(sale_date, 7) AS sale_date,
    COUNT(sale_id) AS total
FROM sales
GROUP BY 1,2
ORDER BY 1, 2;