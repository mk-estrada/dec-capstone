{{
    config(
        materialized="table"
    )
}}

select 
    order_id,
    product_id,
    unit_price, 
    quantity,
    discount,
    (unit_price*quantity) as order_price,
    (unit_price*quantity*discount)  as order_discounted
    
from {{ source('northwind', 'order_details') }}

order by order_id asc