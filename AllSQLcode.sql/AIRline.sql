select * from ari_enterprice.facility_system_mapping_old_new
where site='ZAB'

select * from ari_enterprice.system_selected_tableau
select system ,
     selected,
     count(selected) as numberseclete 
from ari_enterprice.system_selected_tableau
group by system ,selected