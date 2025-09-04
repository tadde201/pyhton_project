use [project1]
create table station(id int,city varchar(30),state varchar(30),len_n int,Long_t int) 
insert into station values(1,'Nokia','UP',12.24,3.34),(2,'kanbur','Up',2.44,3.56),
(2,'Unnao','UP',1.345,5.78),
(4,'Pune','M',2.345,3.234),
(5,'NaGPUR','M',3.345,5.456),
(6,'ROM','XXX',7.67,8.0456)
select * from station
select top 1 city,len(city) from station
order by len(city),city