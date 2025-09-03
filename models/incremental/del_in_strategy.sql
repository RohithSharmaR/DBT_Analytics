{{
    config(
        materialized='incremental',
        incremental_strategy='delete+insert',
        unique_key='order_id'
    )
}}

select 
* 
from
{{ source('raw', 'order_details_di') }}
{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where insert_date > (select max(insert_date) from {{ this }}) 
{% endif %}