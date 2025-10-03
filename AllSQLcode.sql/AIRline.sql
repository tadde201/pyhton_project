-- Check facility-system mapping
SELECT * 
FROM ari_enterprice.facility_system_mapping_old_new
WHERE site = 'ZAB';

-- Check system selected in Tableau
SELECT * 
FROM ari_enterprice.system_selected_tableau;

-----------------------------------------------------
-- Create view for systems with no "true" selected
-----------------------------------------------------
CREATE VIEW Selectedtruth0 AS
SELECT 
    system,
    t.Truth,
    t.False
FROM (
    SELECT  
        system,
        SUM(CASE WHEN selected = 'true' THEN 2 ELSE 0 END) AS Truth,
        SUM(CASE WHEN selected = 'false' THEN 1 ELSE 0 END) AS False
    FROM ari_enterprice.system_selected_tableau 
    GROUP BY system
) AS t  
WHERE t.Truth=0
GROUP BY system, t.Truth, t.False;

-- Check view
SELECT * 
FROM Selectedtruth0;

-----------------------------------------------------
-- Create view for systems with no "false" selected
-----------------------------------------------------
CREATE VIEW Selectedtruthfalse0 AS
SELECT 
    system,
    t.Truth,
    t.False
FROM (
    SELECT  
        system,
        SUM(CASE WHEN selected = 'true' THEN 2 ELSE 0 END) AS Truth,
        SUM(CASE WHEN selected = 'false' THEN 1 ELSE 0 END) AS False
    FROM ari_enterprice.system_selected_tableau 
    GROUP BY system
) AS t  
WHERE t.False = 0
GROUP BY system, t.Truth, t.False;

-- Check view
SELECT * 
FROM Selectedtruthfalse0;

-----------------------------------------------------
-- Critical count by model
-----------------------------------------------------
SELECT 
    model,
    SUM(CASE WHEN x_axis = 'Critical' THEN 1 ELSE 0 END) AS x_Critical,
    SUM(CASE WHEN y_axis = 'Critical' THEN 1 ELSE 0 END) AS y_Critical
FROM ari_enterprice.weight_all_models
GROUP BY model;

-----------------------------------------------------
-- Count models where both x_axis and y_axis = Critical
-----------------------------------------------------
CREATE OR REPLACE FUNCTION critical()
RETURNS TABLE (
    model text,
    y_axis text,
    x_axis text,
    num bigint
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        model,
        y_axis, 
        x_axis,
        COUNT(y_axis) AS num  
    FROM ari_enterprice.weight_all_models
    WHERE y_axis = 'Critical'
      AND x_axis = 'Critical'
    GROUP BY model, y_axis, x_axis;
END;
$$ LANGUAGE plpgsql;
SELECT * FROM critical();

select model,
    y_axis,
    Count(y_axis) as Hnumber
      
From ari_enterprice.weight_all_models
	   where y_axis='High'
	   Group by model,y_axis;

