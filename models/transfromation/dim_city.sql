with raw_data as (
    select
    distinct city ,
    state
    from
    {{ ref('stg_dmart_raw') }}
)
select 
row_number() over(order by city) as City_ID,
city ,state
from 
raw_data