# Write your MySQL query statement below
SELECT user_id, MAX(diff) AS biggest_window
FROM
(
SELECT user_id,
DATEDIFF(LEAD(visit_date, 1, '2021-01-01') OVER (PARTITION BY user_id ORDER BY visit_date), visit_date) AS diff
	FROM userVisits
) a
GROUP BY user_id
ORDER BY user_id


# LEAD Function:
# i].The Syntax for Lead function is LEAD<column_name,context,default_value>. It Means that where you want to check the next row in a column, and after how many rows you would like to check (Context), and the default value if there is no date present after the last date (2021-01-01).
# ii]. PARTITION BY: It helps to segregate result based on the USERS you want and ORDER BY re-orders the results in Ascending Order for each USER_ID that has been partitioned (OR GROUPED). WE USE PARTITION IN LEAD FUNCTION.
# DATEDIFF Function:
# i] It Helps us to find out the difference between the date selected by the LEAD FUNCTION and the date from the visit_date for every User Visit and then we use MAX Function to return the Maximum Date Difference.