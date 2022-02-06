# Write your MySQL query statement below
SELECT 
	book_id,
    name
FROM books
WHERE available_from < '2019-05-23'
AND book_id NOT IN
(SELECT 
    book_id
FROM orders 
WHERE dispatch_date BETWEEN '2018-06-23' AND '2019-06-22' 
GROUP BY 1
HAVING SUM(quantity) >= 10);