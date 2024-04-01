{{
    config(
        materialized="table"
    )
}}

select 
    employee_id,
    territory_id
    
from {{ source('northwind', 'employee_territories') }}

order by employee_id asc