
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



