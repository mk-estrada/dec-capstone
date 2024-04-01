{{
    config(
        materialized="table"
    )
}}

select 
    customer_desc,
    customer_type_id
    
from {{ source('northwind', 'customer_demographics') }}
