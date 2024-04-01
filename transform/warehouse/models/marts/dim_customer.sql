select
    {{ dbt_utils.generate_surrogate_key(['customers.customer_id']) }} as customer_key,
    customers.customer_id as customer_id,
    customers.company_name as customers_company_name,
    customers.contact_name as customers_contact_name,
    customers.contact_title as customers_contact_title, 
    customers.city as customers_city,
    customers.region as customers_region,
    customers.postal_code as customers_postal_code, 
    customers.country as customers_country,
    customer_demo.customer_type_id as customer_type_id,
    customer_demographics.customer_desc as customer_desc

from {{ ref('customers')}} as customers
left join {{ ref('customer_demo')}} as customer_demo
    on customers.customer_id = customer_demo.customer_id
left join {{ ref('customer_demographics')}} as customer_demographics 
    on customer_demo.customer_type_id = customer_demographics.customer_type_id
