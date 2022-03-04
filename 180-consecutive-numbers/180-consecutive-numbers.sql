# Write your MySQL query statement below
# DROP TABLE IF EXISTS Logs;
# Create table If Not Exists Logs (id int, num int);
# Truncate table Logs;
# insert into Logs (id, num) values ('1', '1');
# insert into Logs (id, num) values ('2', '1');
# insert into Logs (id, num) values ('3', '1');
# insert into Logs (id, num) values ('4', '2');
# insert into Logs (id, num) values ('5', '1');
# insert into Logs (id, num) values ('6', '2');
# insert into Logs (id, num) values ('7', '2');

# select distinct Num as ConsecutiveNums
# from Logs
# where (Id + 1, Num) in (select * from Logs) and (Id + 2, Num) in (select * from Logs);

# Select DISTINCT l1.Num from Logs l1, Logs l2, Logs l3 
# where l1.Id=l2.Id-1 and l2.Id=l3.Id-1 
# and l1.Num=l2.Num and l2.Num=l3.Num;

SELECT DISTINCT num AS ConsecutiveNums
FROM (SELECT num, (ROW_NUMBER() OVER (ORDER BY id) - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id)) cons
    FROM Logs) tmp
GROUP BY cons, num
HAVING COUNT(*) >= 3;