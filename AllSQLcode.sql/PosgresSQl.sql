SELECT * from "TB1"
  INSERT INTO TB1 (id, Name, Location)
VALUES
  (1, 'Lemma', 'ethiopia'),
  (2, 'mike', 'jordan'),
  (3, 'john', 'doe');
  Create table test(
    id int,
    Name varchar(20),
    Location varchar(20)
  );
  select * from test
    INSERT INTO test (id, Name, Location)
VALUES
  (1, 'Lemma', 'ethiopia'),
  (2, 'mike', 'jordan'),
  (3, 'john', 'doe');
  select * from test
  UPDATE test
  SET Name='Getawu'
  WHERE id=3


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [empserial]
      ,[name]
      ,[salary]
      ,[address1]
      ,[namesaddress]
  FROM [project1].[dbo].[emp2]
  alter table emp2
  add  Modfidedate date 
  select * from emp2

 alter  proc updates 
  @empserial int,
  @name varchar(30),
  @salary money
  
  as 
  begin 
  update emp2
  set 
  name=@name,
  salary=@salary,
 Modfidedate=getdate()

  where empserial= @empserial
  end 

  exec [dbo].[updates] 4,'Samire','60909','2/11/2022'
   exec [dbo].[updates] 6,'Roman','9000','2/11/2022'
     exec [dbo].[updates] 3,'Dereje','24000'

  select * from emp2
  insert into emp2 values(8,'lemma','4578','234roudlph road','mercury','2022/2/11');

  select name,salary  from emp2
    where salary=(select min(salary) as maxs from emp2 )
  group by  name, salary 


alter proc searchdate 
@Numberdays  datetime,
@numberdayf datetime
as
select getdate()-@Numberdays as Past_dates
select getdate() + @numberdayf as future

exec searchdate 720,30


