select
    {{ dbt_utils.generate_surrogate_key(['products.product_id']) }} as product_key,
    products.product_id as product_id,
    products.product_name as product_name,
    products.quantity_per_unit as product_quantity_per_unit,
    products.unit_price as product_unit_price,
    products.units_in_stock as product_units_in_stock,
    products.units_on_order as product_units_on_order,
    products.reorder_level as product_reorder_level,
    products.discontinued as discontinued_products,
    categories.category_id as category_id,
    categories.category_name as category_name,
    categories.category_description as category_description,
    suppliers.supplier_id as supplier_id, 
    suppliers.company_name as supplier_company_name,
    suppliers.city as suppliers_city, 
    suppliers.country as suppliers_country,
    suppliers.region as suppliers_region
    
from {{ ref('products')}} as products
left join {{ ref('categories')}} as categories
    on products.category_id = categories.category_id
left join {{ ref('suppliers')}} as suppliers 
    on products.supplier_id = suppliers.supplier_id
