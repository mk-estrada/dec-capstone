
{{
    config(
        materialized="table"
    )
}}

select 
    state_id,
    state_abbr,
    state_name, 
    state_region
    
from {{ source('northwind', 'us_states') }}

order by state_id asc