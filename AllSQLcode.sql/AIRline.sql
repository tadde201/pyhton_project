select * from ari_enterprice.facility_system_mapping_old_new
where site='ZAB'
select
select * from ari_enterprice.system_selected_tableau
Create view Selectedtruth0 as 
select 
  system ,t.Truth,t.false
   from
   (select  system,
    sum(case  when selected='true' then 2 else 0 end)as Truth,
     sum(case when selected='false' then 1 else 0 end) as false
     from ari_enterprice.system_selected_tableau 
     group by system ) as t  
	where t.Truth=0
	group by system,t.Truth,t.false
--check view 
Select * from Selectedtruth0
---Check  no false 
Create view Selectedtruthfalse0 as 
select 
  system ,t.Truth,t.false
   from
   (select  system,
    sum(case  when selected='true' then 2 else 0 end)as Truth,
     sum(case when selected='false' then 1 else 0 end) as false
     from ari_enterprice.system_selected_tableau 
     group by system ) as t  
	where t.false=0
	group by system,t.Truth,t.false
-- check views 
select * from Selectedtruthfalse0 

SELECT 
    model,
    SUM(CASE WHEN x_axis = 'Critical' THEN 1 ELSE 0 END) AS x_crtical,
    SUM(CASE WHEN y_axis = 'Critical' THEN 1 ELSE 0 END) AS y_Critical
FROM ari_enterprice.weight_all_models
GROUP BY model;
  
  select model,y_axis, x_axis,count(y_axis) as num  from  ari_enterprice.weight_all_models
   where y_axis='Critical'
   and  x_axis='Critical'
    group by model, y_axis, x_axis
  
  