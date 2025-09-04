
select * from Dept
select * from [dbo].[employee]

insert into employee values(17,'Lema','M',4)

select * from employee as e
right join dept as D
on E.Deptid= D.Deptid

select * from Dept As D
right outer join employee as E
on D.Deptid=E.Deptid
alter table employee
add  Dates date 

insert into employee values(147,'Romy','f', 1,getdate())
insert into employee values(1459,'Tigy','f', 4,getdate())
insert into employee values(14509,'Almaz','f',3, getdate())
insert into employee values(145809,'Alem','m',2, getdate())

select * from sys.dm_db_partition_stats
select * from sys.tables
select * from sys.data_spaces
select * from sys.all_views
select * from sys.database_files
select * from sys.all_objects
select *from sys.change_tracking_databases
select * from sys.all_columns
select * from sys.user_token
select * from sys.schemas
select * from sys.routes
select * from sys.databases
select * from sys.services
select * from sys.default_constraints
select * from sys.all_sql_modules
select * from sys.partitions
select * from sys.openkeys