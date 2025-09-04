create database project1
use project1
create table empl
(empserial int, name varchar(30))

insert into empl
values(1,'abebe')
insert into empl
values(2,'lemma')
insert into empl
values(3,'abebe')
insert into empl
values(4,'Debebe')


create table emp2
(empserial int,name varchar(30))


insert into emp2
values(3,'tigy')
insert into emp2
values(4,'mekonen')
insert into emp2
values(5,'bete')
insert into emp2
values(6,'alem')

select a.empserial, a.name 
from empl as a
 left join emp2 as b
on a.empserial=b.empserial


select a.empserial, a.name 
from empl as a
  right outer join emp2 as b
on a.empserial=b.empserial



select a.empserial, a.name 
from empl as a
  inner join emp2 as b
on a.empserial=b.empserial
   


   
select a.empserial, a.name 
from empl as a
  full join emp2 as b
on a.empserial=b.empserial
 
 
select a.empserial, a.name 
from empl as a
  left outer join emp2 as b
on a.empserial=b.empserial


select * from empl
select * from emp2

 alter table emp2
 add salary int 
 insert into emp2
 (salary)values(9000)
 go 4
 select * from empl
select * from emp2

 update emp2
 set salary=15000
 where name='alem'
 --to retive the secound highst salary 
select max(salary) as secundsalary from emp2
 where salary < (select max(salary)as maxs from emp2)

 delete from empl
 where empserial not in (select max(name) from empl
     group by empserial,name)

	  

 --delete duplicate value
 with ctes as
 ( 
 select*, ROW_NUMBER() over(partition by name order by empserial asc) as num from empl
 
)
 delete from ctes 
where num>1
select * from empl;

