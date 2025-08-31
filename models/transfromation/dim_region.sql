with raw_data as (
    select
    distinct region ,
    from
    {{ ref('stg_dmart_raw') }}
)
select 
row_number() over(order by region) as Region_ID,
region
from 
raw_data