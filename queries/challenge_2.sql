-- A query that displays the total integer value of all products in stock as "stock_value".

SELECT ROUND(SUM(unit_price::NUMERIC * units_in_stock), 2) AS stock_value
FROM products;