-- Task: Generate all possible combinations of matches

-- Step 1: Create table
CREATE TABLE ipl_team (
    team_name VARCHAR(10)
);

-- Step 2: Insert teams
INSERT INTO ipl_team (team_name) VALUES
('MI'),
('CSK'),
('RCB'),
('KKR'),
('RR'),
('DC');

-- Step 3: View teams
SELECT *
FROM ipl_team;


-- Step 4: Generate all match combinations (Self Join)
SELECT
    t1.team_name AS team_name1,
    t2.team_name AS team_name2
FROM ipl_team AS t1
JOIN ipl_team AS t2
    ON t1.team_name < t2.team_name;


-- Step 5: Create table to store match combinations
CREATE TABLE Selfjoindata (
    team_name1 VARCHAR(10),
    team_name2 VARCHAR(10)
);


-- Step 6: Insert match combinations into table
INSERT INTO Selfjoindata (team_name1, team_name2)
SELECT
    t1.team_name,
    t2.team_name
FROM ipl_team AS t1
JOIN ipl_team AS t2
    ON t1.team_name < t2.team_name;


-- Step 7: View stored combinations
SELECT *
FROM Selfjoindata;


-- Step 8: Count how many matches each team appears in
SELECT
    team_name1,
    COUNT(team_name1) AS numOccurrence
FROM Selfjoindata
GROUP BY team_name1
ORDER BY COUNT(team_name1) DESC;


-- Step 9: Check matches for a specific team
SELECT *
FROM Selfjoindata
WHERE team_name1 = 'CSK';