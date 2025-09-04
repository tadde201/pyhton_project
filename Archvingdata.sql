
select * from [dbo].[emp2]
select * from [dbo].[empl]


create table acchive1 (empserial int,name varchar(40),salary money,address1 varchar(50),namesaddress varchar(30) ,Modfidedate date)

while(@@rowcount>0)
begin
insert into acchive1
select * from [dbo].[emp2]
 where [empserial]<=5
delete from emp2
where [empserial]<=5
end 

select * from  acchive1
