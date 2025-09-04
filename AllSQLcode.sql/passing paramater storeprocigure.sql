/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [empserial]
      ,[name]
      ,[salary]
      ,[address1]
      ,[namesaddress]
      ,[Modfidedate]
  FROM [project1].[dbo].[emp2]

  create proc insterttoemp2
  (@name varchar(40),
  @salary money,
  @address1 varchar(40),
  @Modfidedate date
  )
  as 
  insert into [dbo].[emp2]([name],[salary],[address1],[Modfidedate])
  
  select
  @name as name,
  @salary as [salary],
  @address1 as address1,
  @Modfidedate as [Modfidedate]
  

  exec insterttoemp2
  @name ='Getu',
  @salary='10000',
   @address1='9714 dilston road',
    @Modfidedate='8/9/2022'

select * from 
[dbo].[emp2]
order by Modfidedate asc

select count(*),count(1) from [dbo].[emp2]
