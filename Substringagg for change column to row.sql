/****** Script for SelectTopNRows command from SSMS ******/

-- Select top 1000 rows
SELECT TOP (1000)
    [Entity],
    [Code],
    [Daily hospital occupancy],
    [Days]
FROM [Covid].[dbo].[covidt];


-- Create new table
CREATE TABLE covid2 (
    Entity VARCHAR(60),
    Code VARCHAR(60),
    Daily_hospital_occupancy FLOAT,
    Days DATE
);


-- Insert data into new table
INSERT INTO covid2 (Entity, Code, Daily_hospital_occupancy, Days)
SELECT
    [Entity],
    [Code],
    [Daily hospital occupancy],
    [Days]
FROM [Covid].[dbo].[covidt];


-- View data
SELECT * FROM covid2;


-- Update all codes to empty string
UPDATE covid2
SET Code = '';


-- View employee table
SELECT * FROM [dbo].[emp];


-- Aggregate names and salaries
SELECT 
    STRING_AGG(Name, ',') AS Names,
    STRING_AGG(CAST(Salary AS VARCHAR), ',') AS Salaries
FROM [dbo].[emp];