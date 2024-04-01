Select 
    {{ dbt_utils.generate_surrogate_key(['orders.order_id'])}} as order_key,
    {{ dbt_utils.generate_surrogate_key(['order_details.product_id']) }} as product_key,
    {{ dbt_utils.generate_surrogate_key(['orders.customer_id']) }} as customer_key,
    {{ dbt_utils.generate_surrogate_key(['orders.employee_id']) }} as employee_key,
    orders.order_id as order_id, 
    orders.customer_id as order_customer_id,
    orders.employee_id as order_employee_id,
    orders.order_date as order_date,
    orders.required_date as required_date,
    orders.shipped_date as shipped_date,
    orders.ship_via as shipper_id, 
    orders.freight as freight,
    orders.ship_name as ship_name,
    orders.ship_city as ship_city,
    orders.ship_region as ship_region,
    orders.ship_postal_code as ship_postal_code,
    orders.ship_country as ship_country,
    order_details.product_id as order_product_id,
    order_details.unit_price as order_unit_price,
    order_details.quantity as order_quantity,
    order_details.discount as order_discount,
    shippers.company_name as ship_company_name,
    shippers.phone as ship_phone

from {{ ref('orders') }} as orders
left join {{ ref('order_details')}} as order_details
    on orders.order_id = order_details.order_id
left join {{ ref('shippers')}} as shippers
    on orders.ship_via = shippers.shipper_id