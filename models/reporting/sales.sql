select 
order_id ,
c.cust_id ,
cat.category_id ,
cc.city ,
r.order_date ,
rr.region_id ,
r.sales ,
r.discount ,
r.profit
from
{{ ref('stg_dmart_raw') }} r
left join
{{ ref('dim_customer') }} c
on r.customer_name=c.customer_name
left join 
{{ ref('dim_category') }} cat
on r.category=cat.category
left join 
{{ ref('dim_city') }} cc
on r.city=cc.city
left join 
{{ ref('dim_region')}} rr
on r.region=rr.region