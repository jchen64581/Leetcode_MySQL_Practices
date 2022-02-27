# Write your MySQL query statement below
SELECT
	DISTINCT session_id
FROM playback p
LEFT JOIN ads a
	ON p.customer_id = a.customer_id AND timestamp  BETWEEN start_time AND end_time
WHERE a.customer_id IS NULL;




# select session_id
# from playback
# where session_id not in 

#     # This is every session that has shown an ad to a customer. 
# 	# Timestamp needs to be between the start and end time. And the ad has to be shown to the correct viewer.
#      (select session_id
#     from playback a join ads b
#     on timestamp between start_time and end_time
#     and a.customer_id = b.customer_id)