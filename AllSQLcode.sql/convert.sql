/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Entity]
      ,[Code]
      ,[Day]
      ,[Daily hospital occupancy]
  FROM [Covid].[dbo].['current-covid-patients-hospital$']
  select * from [dbo].[covidt]
  select count(*) as total_row from [dbo].[covidt] 

  select convert(date,Day,100) as date  from [dbo].[covidt]
  alter table [dbo].[covidt]
  add Days date
  update [dbo].[covidt]
  set Days=convert(date,Day,100)
  alter table [dbo].[covidt]
  drop column Day 
  select * from [dbo].[covidt]

  select [Entity] ,Days,min([Daily hospital occupancy]) as min from [dbo].[covidt]
   where Entity ='United States'
   group by [Entity] ,Days

  select [Entity],Days,[Daily hospital occupancy], max([Daily hospital occupancy]) as min from [dbo].[covidt]
  where Entity ='United States' and days between '2022-01-01'and '2022-01-27'

  group by [Entity],Days, [Daily hospital occupancy]
  order by [Daily hospital occupancy]  desc
