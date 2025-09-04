/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [empserial]
      ,[name]
      ,[salary]
  FROM [project1].[dbo].[emp2]
  alter table [project1].[dbo].[emp2]
  add address char(40)
  select * from emp2
  update emp2
  set address='16735,U street,DC'
  where empserial=6
  select substring(address,1,CHARINDEX(',',address)-1) as addresse,
  substring(address,CHARINDEX(',',address)+1,len(address)) as namesaddress

  
  from emp2

  alter table emp2
  add address1 varchar(60)
  alter table emp2
  add namesaddress varchar(60)
  update emp2
  set address1=substring(address,1,CHARINDEX(',',address)-1) 
   update emp2
  set namesaddress=substring(address,CHARINDEX(',',address)+1,len(address)) 
    select * from emp2
	alter table emp2
	drop column address