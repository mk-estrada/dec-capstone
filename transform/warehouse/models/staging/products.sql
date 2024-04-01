
{{
    config(
        materialized="table"
    )
}}

select 
    product_id,
    product_name,
    category_id,
    supplier_id,
    discontinued,
    unit_price,
    reorder_level, 
    units_in_stock,
    units_on_order,
    quantity_per_unit
    
from {{ source('northwind', 'products') }}

order by product_id asc