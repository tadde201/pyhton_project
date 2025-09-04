Alter VIEW Ranksanalysis AS
SELECT s.name,
    studentid,
    ranking,
    year,
    CASE
        WHEN ranking = 1 THEN 'Very good'
        WHEN ranking = 2 THEN 'Good'
        ELSE 'Low'
    END AS comment
FROM [dbo].[rankings]
join students as s
on s.id=rankings.studentid


select * from Ranksanalysis