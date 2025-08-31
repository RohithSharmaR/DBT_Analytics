select 
*
from 
{{ ref('dim_category') }}
where 
category_id < 1