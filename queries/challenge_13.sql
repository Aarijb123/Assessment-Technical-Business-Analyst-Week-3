-- A query that returns full employee names and a list of their assigned territories

-- Columns should be employee and assigned_territories only

-- Only territories with single-word descriptions should be included

-- Rows should be ordered by number of territories in descending order

-- Territory lists should be in alphabetical order

-- Territory lists should be lists, not concatenated strings

SELECT 
    CONCAT(first_name, ' ', last_name) AS employee,
    ARRAY_AGG(DISTINCT territory_description ORDER BY territory_description) AS assigned_territories
FROM employees
JOIN employee_territories USING (employee_id)
JOIN territories USING (territory_id)
GROUP BY employee_id, first_name, last_name
ORDER BY COUNT(*) DESC, employee;