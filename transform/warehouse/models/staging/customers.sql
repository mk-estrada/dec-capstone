{{
    config(
        materialized="table"
    )
}}

select 
    customer_id,
    fax,
    city,
    phone, 
    region,
    address as customer_address, 
    country, 
    postal_code,
    company_name, 
    contact_name,
    contact_title
    
from {{ source('northwind', 'customers') }}

order by customer_id asc