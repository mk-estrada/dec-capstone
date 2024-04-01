
{{
    config(
        materialized="table"
    )
}}

select 
    category_id,
    description as category_description, 
    category_name
    
from {{ source('northwind', 'categories') }}

order by category_id asc