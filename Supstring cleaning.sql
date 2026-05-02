/****** Script for SelectTopNRows command from SSMS ******/

-- Select top 1000 rows
SELECT TOP (1000)
    [empserial],
    [name],
    [salary]
FROM [project1].[dbo].[emp2];


-- Add address column
ALTER TABLE [project1].[dbo].[emp2]
ADD address CHAR(40);


-- View table
SELECT * 
FROM [project1].[dbo].[emp2];


-- Update specific record
UPDATE [project1].[dbo].[emp2]
SET address = '16735,U street,DC'
WHERE empserial = 6;


-- Split address into two parts
SELECT 
    SUBSTRING(address, 1, CHARINDEX(',', address) - 1) AS address1,
    SUBSTRING(address, CHARINDEX(',', address) + 1, LEN(address)) AS namesaddress
FROM [project1].[dbo].[emp2];


-- Add new columns for split data
ALTER TABLE [project1].[dbo].[emp2]
ADD address1 VARCHAR(60);

ALTER TABLE [project1].[dbo].[emp2]
ADD namesaddress VARCHAR(60);


-- Update new columns with split values
UPDATE [project1].[dbo].[emp2]
SET address1 = SUBSTRING(address, 1, CHARINDEX(',', address) - 1);

UPDATE [project1].[dbo].[emp2]
SET namesaddress = SUBSTRING(address, CHARINDEX(',', address) + 1, LEN(address));


-- View final table
SELECT * 
FROM [project1].[dbo].[emp2];


-- Drop original address column
ALTER TABLE [project1].[dbo].[emp2]
DROP COLUMN address;