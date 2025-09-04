USE [project1]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[updates]
		@empserial = 3,
		@name = N'dereje',
		@salary = 7900

SELECT	'Return Value' = @return_value

GO
select * from  emp2