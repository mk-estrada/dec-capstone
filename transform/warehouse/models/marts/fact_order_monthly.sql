select 
    order_key,
    product_key,
    sum(order_unit_price*order_quantity) as order_total,
    date.month_end_date

FROM {{ ref('fact_order')}} as orders
inner join {{ ref('dim_date')}} as date
    on orders.order_date = date.date_day
group by 
    date.month_end_date,
    order_key,
    product_key



