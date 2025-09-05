select * from ari_enterprice.facility_system_mapping_old_new
where site='ZAB'

select * from ari_enterprice.system_selected_tableau
select system ,
     selected,
     count(selected) as numberseclete 
from ari_enterprice.system_selected_tableau
group by system ,selected


select  model,x_axis,y_axis,
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
  Group by model,x_axis,y_axis
  
  