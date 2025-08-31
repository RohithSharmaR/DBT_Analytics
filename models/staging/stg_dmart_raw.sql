{{
    config(
        materialized='table'
    )
}}


select 
raw.order_id,
upper(raw.customer_name) as CUSTOMER_NAME,
raw.category,
raw.sub_category,
raw.city,
coalesce(try_to_date(raw.order_date,'dd-mm-yyyy'),
try_to_date(raw.order_date,'mm/dd/yyyy')) as order_date,
raw.region,
raw.sales,
raw.discount,
raw.profit,
raw.state ,
gstcode.GST_CODE
from 
{{ source('raw', 'dmart_raw') }} as raw
left join 
{{ ref('gst') }} as gstcode
on raw.state=gstcode.state
