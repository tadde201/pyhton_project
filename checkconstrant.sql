/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [empserial]
      ,[name]
      ,[salary]
      ,[address1]
      ,[namesaddress]
      ,[Modfidedate]
  FROM [project1].[dbo].[emp2]

  create table Checks(id int primary key ,name varchar(40), age int check(age>=18))


  Insert into Checks values(1,'Alem',23),(2,'Workua',18),
  (3,'Roman',24)
  select * from checks 
  select * from sys.all_views
  select * from sys.tables
  select count(*) from sys.tables
  select * from sys.views
  Declare @vairable table([empserial] int,
      [name] varchar(40),
      [salary] int,
      [address1] varchar(50))
	  insert into @vairable values(123,'Tadey',4567,'407 mercury drive')
	  select * from  @vairable
 