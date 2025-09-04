use test3;
create table detest (id int primary key, name varchar(40),Lname varchar(50), age int);
insert into detest values(23,'dere','bekele',35);
insert into detest values(263,'alem','estifo',24);
insert into detest values(2637,'Romi','masiresha',23);
insert into detest values(237,'tigy','masiresha',25);
select * from detest;
update detest 
set age=36 where id=23
