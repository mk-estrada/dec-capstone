select
    {{ dbt_utils.generate_surrogate_key(['employees.employee_id']) }} as employee_key,
    employees.employee_id as employee_id,
    employees.first_name as employee_first_name,
    employees.last_name as employees_last_name, 
    employees.title as employee_title,
    employees.birth_date as employee_birth_date, 
    employees.hire_date as employee_hire_date,
    employees.city as employee_city, 
    employees.region as employee_region,
    employees.postal_code as employee_postal_code,
    employees.country as employee_country,
    employees.reports_to as employee_reports_to,
    emp_territories.territory_id as employee_territory_id,
    territories.territory_description as employee_territory_description,
    territories.region_id as employee_region_id,
    region.region_description as employee_region_desc

from {{ ref('employees')}} as employees
left join {{ ref('employee_territories')}} as emp_territories
    on employees.employee_id = emp_territories.employee_id
left join {{ ref('territories')}} as territories 
    on territories.territory_id = emp_territories.territory_id
left join {{ ref('region')}} as region
    on region.region_id = territories.region_id