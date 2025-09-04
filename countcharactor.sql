/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id]
      ,[Name]
      ,[Gender]
      ,[Deptid]
      ,[Dates]
  FROM [master].[dbo].[employee]
  delete from employee
  where id in(12,13,15)

  select count(*) as Number0f_female from employee
  where Gender not in('M')
  group by Name,Gender;
  update employee
  set Gender='Female'
  where Gender not in('M')

 create Proc Updatess 

 @Gender varchar(40),
@id int
 as
 update employee
 set Gender=@Gender 
 where id=@id

 exec Updatess 'Female',1234
 create proc counts
 @name varchar(30)
 as

 select name,len(Name) as lengh,len(REPLACE(name,'L','')) as Counts from employee
 where Name=@name
 exec counts 'Lema'
 select * from employee

 select name,len(Name)-len(REPLACE(name,'dd','')) Numberdd from employee

 SELECT * FROM Customers WHERE (CustomerName LIKE 'L%'
OR CustomerName LIKE 'R%' /*OR CustomerName LIKE 'S%'
OR CustomerName LIKE 'T%'*/ OR CustomerName LIKE 'W%')
AND Country='USA'
ORDER BY CustomerName;
