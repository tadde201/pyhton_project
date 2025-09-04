
create table person(id int, name varchar(30),salary int)
insert into person values(3,'c',50000)
insert into person values(4,'d',70000)
insert into person values(5,'e',90000)
insert into person values(6,'f',980000)

select * from person
create table addresss (id int,name varchar(30),state varchar(30))
insert into addresss values(9,'A','MD'),(12,'B','Va'),(13,'c','DC'),
(14,'d','CA'),(15,'e','Md')
select * from addresss
select * from person
select * from person as p
join addresss as a on p.name=a.name
select * from person as p
left  join addresss as a on p.name=a.name

update 
person 
set salary=salary+200001
from person as p
join addresss as a on p.name=a.name
and a.state='Md'


update person
set salary= salary *3.6
from person as p
join addresss  a 
on p.name=a.name
and state='MD'


select * from person

