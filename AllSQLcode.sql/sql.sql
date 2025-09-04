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
/****** Script for SelectTopNRows command from SSMS  ******/
use [project1]


SELECT TOP (1000) [empserial]
      ,[name]
      ,[salary]
      ,[address1]
      ,[namesaddress]
  FROM [project1].[dbo].[emp2]

  
  
  Declare @A varchar(300)= 'This Dereje from maryland'
  declare  @b varchar(40)='How are you'
  select @A+' '+@b as Greating 
  select len(@A) as Length
  select len(@b) as Len2

  select cast(name as nvarchar(40))+','+ + cast(salary as  varchar(40)) as Information  from emp2
  select concat('my name is  ' +name, ' ', salary) as info from emp2
select convert(money,salary) as salary from emp2
update emp2
set salary=salary+23.556
select * from emp2
alter table emp2
alter column  salary money 

select *,max(round(salary,2)) as Roud from emp2
group by[empserial], [name],[salary],[address1],[namesaddress],[Modfidedate]
select CURRENT_USER 
insert into emp2 values(23,'Amodo','2000','Canada','Toronto','06-08-2023')
select*,IIF(salary>3000,'great','fair')as comment  from emp2
select name,Modfidedate, max(Modfidedate) as recent_date from emp2
group by [name],Modfidedate
order by Modfidedate Desc
select*, rank()over (order by salary ASC ) as ranks,IIF(salary>3000,'great','fair')as comment from emp2
select SUBSTRING([namesaddress],10,CHARINDEX(',',[namesaddress])-1) as MM from emp2
