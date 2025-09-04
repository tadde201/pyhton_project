use [project1]



 exec sp_Rename '[dbo].[emp2].address','Home adress'
 alter table[dbo].[emp2]
 add eid int identity(1,1)
 alter table [dbo].[emp2]
 drop column eid
 alter table[dbo].[emp2]
 add primary key(eid)
select * from [dbo].[emp2]
create table emp(
Emps_id int,
Name varchar(50),
Salary float,
Home_address varchar(60),
namesaddress varchar(70))
insert into emp
select [empserial],[name],[salary],[Home adress],[namesaddress] from [dbo].[emp2]

select * from emp