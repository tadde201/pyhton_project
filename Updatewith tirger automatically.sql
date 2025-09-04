CREATE TRIGGER inserttrigger 
ON [dbo].[rankings]
AFTER INSERT
AS
BEGIN
    -- Assuming you want to update the 'comment' column based on the 'ranking' column
    UPDATE [dbo].[rankings]
    SET [comment] = 
        CASE 
            WHEN INSERTED.ranking = 1 THEN 'very good'
            WHEN INSERTED.ranking = 2 THEN 'good'
            ELSE 'low'
        END
    FROM [dbo].[rankings]
    JOIN INSERTED ON [dbo].[rankings].[studentId]= INSERTED.[studentId]; -- Replace PrimaryKeyColumn with the actual primary key column name
END;