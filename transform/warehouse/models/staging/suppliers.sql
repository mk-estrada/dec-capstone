{{
    config(
        materialized="table"
    )
}}

select 
    supplier_id,
    company_name,
    contact_name,
    contact_title,
    city, 
    region,
    country, 
    postal_code
    phone

    
from {{ source('northwind', 'suppliers') }}

order by supplier_id asc