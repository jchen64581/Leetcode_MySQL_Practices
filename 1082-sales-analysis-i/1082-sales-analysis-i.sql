# Write your MySQL query statement below
WITH cte AS (
SELECT
	seller_id,
    SUM(price) AS total_sales,
    RANK() OVER (ORDER BY SUM(price) DESC) AS rank_sale
FROM sales
GROUP BY 1 )
SELECT
	seller_id
FROM cte
WHERE rank_sale = 1;