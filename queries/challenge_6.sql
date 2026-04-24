-- A query that displays the average product price (average_price) for each category from each supplier when the category name contains the letter 'm' (case-insensitive).

-- The columns should be supplier, category, average_price.

-- average_price should be an integer.

-- Results should be sorted alphabetically by supplier and category.

select company_name as supplier, category_name as category, cast(avg(unit_price) as int) as average_price
from products
join suppliers using (supplier_id)
join categories using (category_id)
where category_name ilike '%m%'
group by company_name, category_name
order by company_name, category_name;