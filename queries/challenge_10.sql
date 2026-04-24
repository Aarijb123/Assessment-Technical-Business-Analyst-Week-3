-- A query that displays the name of the third most expensive product(s) for each category.

-- The columns should be category_name, product_name.

-- Results should be sorted alphabetically by category.

select category_name, product_name
from (
    select category_name, product_name,
           row_number() over (partition by category_name order by unit_price desc) as price_rank
    from products
    join categories using (category_id)
) ranked_products
where price_rank = 3
order by category_name;

