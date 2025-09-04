copy   public.test23  FROM 'C:\Users\tadde\Desktop\Testformove.csv' with csv HEADER;
or 
LOAD DATA INFILE '/path/to/file.csv'
INTO TABLE table_name
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




UPDATE my_table
SET column1 = other_table.column1, column2 = other_table.column2
FROM my_table
JOIN other_table
ON my_table.id = other_table.id
WHERE my_table.column3 = 'value';