

{% test not_greater_than(model, column_name, value) %}
    select * from {{ model }}
    where {{ column_name }} > {{ value }}

{% endtest %}
