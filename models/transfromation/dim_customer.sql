{{
    config(
        materialized='view',
        database='deve_db',
        schema='customer'
    )
}}


with raw_data as (
    select
    distinct customer_name ,
    from
    {{ ref('stg_dmart_raw') }}
)
select 
row_number() over(order by customer_name) as Cust_ID,
customer_name
from 
raw_data