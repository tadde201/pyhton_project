select * from ari_enterprice.facility_system_mapping_old_new
where site='ZAB'

select * from ari_enterprice.system_selected_tableau
select system ,
     selected,
     count(selected) as numberseclete 
from ari_enterprice.system_selected_tableau
group by system ,selected


select  model,
count(
	case when x_axis='Critical' then 1
	else 0
	end )as x_axisnumber
	,
	count
	(case when y_axis='Critical' then 1
	else 0
	end )as y_axisnumber
 from ari_enterprice.weight_all_models
  Group by model
  
  select model,y_axis, x_axis,count(y_axis) as num  from  ari_enterprice.weight_all_models
   where y_axis='Critical'
   and  x_axis='Critical'
    group by model, y_axis, x_axis
  
  