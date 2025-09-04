

delete from test23
where id in(
    select id
from(
    select *
    from(
select id,name, count(0) as n from test23
group by id,name ) as d1
where d1.n>=1
) as d2
)

select * from test2

delete from test2
where age in(
select age
from(
    select *, row_number() over(partition by age)as row_number
from test2
) AS d1
WHERE d1.row_number>1
)