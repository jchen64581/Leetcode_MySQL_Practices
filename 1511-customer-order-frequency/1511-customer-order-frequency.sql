# Write your MySQL query statement below
SELECT 
	o.customer_id, 
    c.name
FROM Orders o
JOIN Product p 
	ON o.product_id= p.product_id
JOIN Customers c 
	ON o.customer_id= c.customer_id
GROUP BY o.customer_id
HAVING SUM(CASE WHEN MONTH(o.order_date)=6 THEN price*quantity ELSE 0 END)>=100
AND
SUM(CASE WHEN MONTH(o.order_date)=7 THEN price*quantity ELSE 0 END)>=100;
