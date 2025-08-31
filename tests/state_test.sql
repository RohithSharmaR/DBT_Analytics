select 
* 
from
{{ ref('dim_city') }}
where
state='Telangana'