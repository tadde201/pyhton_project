select * from empl
select * from [dbo].[emp2]
select e.name,e2.name, avg(salary) as avgs from empl as e
  right join emp2 as e2
on e.empserial=e2.empserial
group by salary,e2.empserial,e2.name,e.name
order by salary
