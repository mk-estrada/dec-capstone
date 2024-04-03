select 
    {{ dbt_utils.star(from=ref('fact_order'), relation_alias='fact_order', 
    except=["order_key", "product_key",  "customer_key", "employee_key"]) }},
    {{ dbt_utils.star(from=ref('dim_customer'), relation_alias='dim_customer', 
    except=["customer_key"]) }},
    {{ dbt_utils.star(from=ref('dim_employees'), relation_alias='dim_employees', 
    except=["employee_key"]) }},
    {{ dbt_utils.star(from=ref('dim_products'), relation_alias='dim_products', 
    except=["product_key"]) }}
from {{ ref('fact_order')}} as fact_order
left join {{ ref('dim_customer')}} as dim_customer
    on fact_order.customer_key = dim_customer.customer_key
left join {{ ref('dim_employees')}} as dim_employees
    on fact_order.employee_key = dim_employees.employee_key
left join {{ ref('dim_products')}} as dim_products
    on fact_order.product_key = dim_products.product_key