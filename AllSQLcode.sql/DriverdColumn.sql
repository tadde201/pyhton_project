
select * from [dbo].[Dept]
select * from [dbo].[employee]

select Name,count(*) as number
from(
select
* from(
		select d.DeptName,E.Name,E.Gender
				from Dept as d
				join employee as E
				on d.Deptid=E.Deptid)as t 
				where t.DeptName='HR') as M
where m.Gender='M'
group by Name;

