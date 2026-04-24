-- A query that displays the total integer value of all products in stock as "stock_value".

SELECT SUM(unit_price * units_in_stock)::INT AS stock_value
FROM products;