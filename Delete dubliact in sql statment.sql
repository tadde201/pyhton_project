

--this for deleted duplicate data from the table 
use [project1]
select * from station2
delete from station2
where id in(
select id
from(
select *
from(
 select id,count(*) as nu
from station2 
group by id)as r
where r.nu>1) as r2 
)
