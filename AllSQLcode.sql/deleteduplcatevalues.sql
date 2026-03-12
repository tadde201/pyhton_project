-- Delete records from test23
DELETE FROM test23
WHERE id IN (
    SELECT id
    FROM (
        SELECT *
        FROM (
            SELECT 
                id,
                name,
                COUNT(0) AS n
            FROM test23
            GROUP BY id, name
        ) AS d1
        WHERE d1.n >= 1
    ) AS d2
);


-- View data
SELECT *
FROM test2;


-- Delete duplicate ages from test2
DELETE FROM test2
WHERE age IN (
    SELECT age
    FROM (
        SELECT 
            *,
            ROW_NUMBER() OVER (PARTITION BY age ORDER BY age) AS row_number
        FROM test2
    ) AS d1
    WHERE d1.row_number > 1
);
--Or using Ro
WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY age ORDER BY id) AS rn
    FROM test2
)
DELETE FROM cte