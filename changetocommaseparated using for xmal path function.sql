use project1
create table commaseparated(
Trainingid int,
Traning varchar(30),
Classroom varchar(40),
startdate time,
Duration numeric(12,2),
WK varchar(30))
insert into commaseparated
values(1,'SQL server','Silver room','10:00',2.00,'M')
insert into commaseparated
values(2,'SQL server','Silver room','10:00',2.00,'W')
insert into commaseparated
values(3,'SQL server','Silver room','10:00',2.00,'T')
insert into commaseparated
values(4,'MSBI','GOLD room','10:00',2.00,'F')
insert into commaseparated
values(5,'MSBI','GOLD room','10:00',2.00,'M')
insert into commaseparated
values(6,'MSBI','GOLD room','10:00',2.00,'TM')
SELECT * FROM commaseparated
SELECT ','+WK FROM commaseparated FOR XML PATH('')

SELECT 
stuff(
(SELECT ','+WK FROM commaseparated FOR XML PATH('')),1,1,'') AS A


select Distinct Traning ,trainingid,Classroom,
(SELECT 
stuff(
(SELECT ','+WK FROM commaseparated as a where a.Traning=b.Traning for XML PATH('')),1,1,'')) commaseparted 
from commaseparated as b


select * from commaseparated