{{
    config(
        materialized="table"
    )
}}

select 
    employee_id,
    reports_to,
    title_of_courtesy,
    first_name, 
    last_name,
    title, 
    region, 
    address as employee_address,
    city,
    country, 
    postal_code,
    home_phone,
    extension, 
    birth_date,
    hire_date,
    notes
    
from {{ source('northwind', 'employees') }}

order by employee_id asc