
-- Task : Generate all possible combination of Matches.
CREATE TABLE ipl_team (
    team_name VARCHAR(10)
);

INSERT INTO ipl_team (team_name) VALUES
('MI'),
('CSK'),
('RCB'),
('KKR'),
('RR'),
('DC');

select * 
from ipl_team  as t1
    Join ipl_team  as t2
on t1.team_name<t2.team_name

Create table Selfjoindata
( team_name1 varchar(10),
 team_name2 varchar(10)
);
INSERT INTO Selfjoindata (team_name1,team_name2)
select * 
from ipl_team  as t1
    Join ipl_team  as t2
on t1.team_name<t2.team_name
select * from Selfjoindata;

Select team_name1,count(team_name1) as numOccurence 
from Selfjoindata
Group by team_name1
order by count(team_name1) Desc


select * from selfjoindata
where team_name1='MI';


