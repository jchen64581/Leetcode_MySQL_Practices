# Write your MySQL query statement below
SELECT
	invoice_id,
    customer_name,
    price,
    COUNT(contact_name) AS contacts_cnt ,
    SUM(CASE WHEN contact_email IN (SELECT email FROM customers) THEN 1 ELSE 0 END) AS trusted_contacts_cnt 
FROM invoices i
LEFT JOIN customers cus
	ON i.user_id = cus.customer_id
LEFT JOIN contacts c
	ON c.user_id = cus.customer_id
    GROUP BY 1
ORDER BY 1 ;