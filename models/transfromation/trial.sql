/*{% set names=[
    "col1",
    "col2",
    "col3",
    "col4",
    "col5",
    "col6"
] %}

    {% for name  in names -%}
        coalesce({{name}},0) as {{name}}
        {%- if not loop.last -%}
            ,
        {% endif %}
    {% endfor %}*/

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