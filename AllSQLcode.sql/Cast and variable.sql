USE [project1];
GO

-- Select Top Records
SELECT TOP (1000)
      [empserial],
      [name],
      [salary],
      [address1],
      [namesaddress]
FROM [project1].[dbo].[emp2];


-- Declare Variables
DECLARE @A VARCHAR(300) = 'This Dereje from Maryland';
DECLARE @B VARCHAR(40) = 'How are you';

-- Concatenate Variables
SELECT @A + ' ' + @B AS Greeting;

-- Length of Strings
SELECT LEN(@A) AS Length_A;
SELECT LEN(@B) AS Length_B;


-- Combine Name and Salary
SELECT 
    CAST(name AS NVARCHAR(40)) + ', ' + CAST(salary AS VARCHAR(40)) AS Information
FROM [project1].[dbo].[emp2];


-- CONCAT Example
SELECT 
    CONCAT('My name is ', name, ' ', salary) AS Info
FROM [project1].[dbo].[emp2];


-- Convert Salary to Money
SELECT 
    CONVERT(MONEY, salary) AS Salary
FROM [project1].[dbo].[emp2];


-- Update Salary
UPDATE [project1].[dbo].[emp2]
SET salary = salary + 23.556;


-- View Table
SELECT * 
FROM [project1].[dbo].[emp2];


-- Alter Column Type
ALTER TABLE [project1].[dbo].[emp2]
ALTER COLUMN salary MONEY;


-- Round Salary
SELECT 
    *,
    MAX(ROUND(salary, 2)) AS RoundedSalary
FROM [project1].[dbo].[emp2]
GROUP BY 
    [empserial], 
    [name], 
    [salary], 
    [address1], 
    [namesaddress], 
    [Modfidedate];


-- Current User
SELECT CURRENT_USER;


-- Insert Record
INSERT INTO [project1].[dbo].[emp2]
VALUES (23, 'Amodo', '2000', 'Canada', 'Toronto', '2023-06-08');


-- Conditional Comment
SELECT 
    *,
    IIF(salary > 3000, 'Great', 'Fair') AS Comment
FROM [project1].[dbo].[emp2];


-- Latest Modified Date
SELECT 
    name,
    Modfidedate,
    MAX(Modfidedate) AS Recent_Date
FROM [project1].[dbo].[emp2]
GROUP BY 
    name, 
    Modfidedate
ORDER BY Modfidedate DESC;


-- Rank Employees by Salary
SELECT 
    *,
    RANK() OVER (ORDER BY salary ASC) AS Salary_Rank,
    IIF(salary > 3000, 'Great', 'Fair') AS Comment
FROM [project1].[dbo].[emp2];


-- Extract Part of Address
SELECT 
    SUBSTRING([namesaddress], 10, CHARINDEX(',', [namesaddress]) - 1) AS Extracted_Value
FROM [project1].[dbo].[emp2];