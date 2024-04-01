{{
    config(
        materialized="table"
    )
}}

select 
    shipper_id,
    company_name,
    phone
    
from {{ source('northwind', 'shippers') }}

order by shipper_id asc