{{
    config(
        materialized='table'
    )
}}


select 
order_id,
upper(customer_name) as CUSTOMER_NAME,
category,
sub_category,
city,
coalesce(try_to_date(order_date,'dd-mm-yyyy'),
try_to_date(order_date,'mm/dd/yyyy')) as order_date,
region,
sales,
discount,
profit,
state ,
from 
{{ source('raw', 'dmart_raw') }}

