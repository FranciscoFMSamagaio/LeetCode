-- Write your PostgreSQL query statement below
WITH aux AS
(
    SELECT DISTINCT employee_id
    FROM Employees 
    WHERE manager_id NOT IN (
        SELECT DISTINCT employee_id
        FROM Employees
    )
)
SELECT aux.employee_id
FROM aux 
JOIN Employees
ON Employees.employee_id = aux.employee_id
AND salary < 30000
ORDER BY aux.employee_id
