{% test discount_between(model, column_name, lower_value) %}

select * from {{ model }}
where ({{ column_name }} < {{ lower_value }})

{% endtest %}

