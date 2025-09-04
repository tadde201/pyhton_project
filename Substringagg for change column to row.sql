/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Entity]
      ,[Code]
      ,[Daily hospital occupancy]
      ,[Days]
  FROM [Covid].[dbo].[covidt]
  create table covid2(Entity Varchar(60),code varchar(60),Daily_hospital_occupancy float,  days date)
  insert into covid2
  select * from [Covid].[dbo].[covidt]
  select * from covid2
  update covid2
  set code =''
  select * from [dbo].[emp]
  select 
  STRING_AGG(name,',') ,STRING_AGG(Salary,',') 
  from [dbo].[emp]
