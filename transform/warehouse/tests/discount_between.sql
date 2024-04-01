-- Singular test

select * from {{ ref('order_details') }}
where discount > 0 and discount < 1

