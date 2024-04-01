{{
    config(
        materialized="table"
    )
}}

select 
    region_id,
    region_description
    
from {{ source('northwind', 'region') }}

order by region_id asc