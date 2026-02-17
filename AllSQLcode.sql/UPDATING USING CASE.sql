Create table ColumnA (num int)
insert into ColumnA values(12345),(37458)


select * from ColumnA 
ALTER TABLE ColumnA
ADD Dr_Column BIGINT;
UPDATE ColumnA
SET Dr_Column = sub.cum_sum
FROM (
    SELECT num, SUM(num) OVER (ORDER BY num ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cum_sum
    FROM ColumnA
) AS sub
WHERE ColumnA.num = sub.num;

Column A Column B 
ABC 1
XYZ 0 
KLM 1 
OPQ 0
create table test3
(a varchar(40),b int)
insert into test3
values ('ABC',1),('XYZ',0),('KLM',1),('OPQ',0)
select * from test3

update test3
set b= case
when b=1 then 0
when b=0 then 1
end 
