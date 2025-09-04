-- Delete duplicate data from the table
USE [project1];

-- Check current data
SELECT * 
FROM station2;

-- Delete duplicates
DELETE FROM station2
WHERE id IN (
    SELECT id
    FROM (
        SELECT id
        FROM (
            SELECT id, COUNT(*) AS nu
            FROM station2
            GROUP BY id
        ) AS r
        WHERE r.nu > 1
    ) AS r2
);

)
