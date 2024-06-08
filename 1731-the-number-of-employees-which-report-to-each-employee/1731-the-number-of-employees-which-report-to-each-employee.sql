-- -- Write your PostgreSQL query statement below
WITH aux AS
(
    SELECT 
        reports_to AS rep,
        COUNT(reports_to) AS reports_count, 
        ROUND(AVG(age),0) AS average_age
    FROM Employees 
    WHERE reports_to is not null
    GROUP BY reports_to 
)
SELECT 
    employee_id,  
    name, 
    reports_count, 
    average_age
FROM Employees
JOIN aux ON rep = employee_id
ORDER BY employee_id
