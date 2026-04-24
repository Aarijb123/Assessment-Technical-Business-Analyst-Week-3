-- A query that displays the first ten orders where the total price is more than the price of the most expensive product in the database.

-- The columns should be order_id and total_price only.

-- total_price should be displayed as an integer.

-- Results should be ordered by descending order_id

-- When calculating the order price, ignore any discounts and use the warehouse-standard price for the products only

select order_id, cast(sum(products.unit_price * quantity) as int) as total_price
from order_details
join products using (product_id)
group by order_id
having sum(products.unit_price * quantity) > (select max(unit_price) from products)
order by order_id desc
limit 10;