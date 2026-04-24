-- A query that returns full employee names and a list of their assigned territories

-- Columns should be employee and assigned_territories only

-- Only territories with single-word descriptions should be included

-- Rows should be ordered by number of territories in descending order

-- Territory lists should be in alphabetical order

-- Territory lists should be lists, not concatenated strings

select concat(first_name, ' ', last_name) as employee, array_agg(territory_description order by territory_description) as assigned_territories
from employees
join employee_territories using (employee_id)
join territories using (territory_id)
where territory_description not like '% %'
group by employee_id
order by count(territory_id) desc;      