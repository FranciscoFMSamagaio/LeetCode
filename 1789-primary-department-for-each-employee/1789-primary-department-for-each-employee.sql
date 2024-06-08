-- Write your PostgreSQL query statement below
WITH aux AS
(
    SELECT 
        employee_id, 
        COUNT(*) AS departs
    FROM Employee
    GROUP BY employee_id
)
SELECT  
    Employee.employee_id,
    CASE
        WHEN departs = 1 THEN department_id
        WHEN departs > 1 AND primary_flag = 'Y' THEN department_id
        ELSE NULL
    END AS department_id 
FROM Employee
JOIN aux ON aux.employee_id = Employee.employee_id
WHERE CASE
        WHEN departs = 1 THEN department_id
        WHEN departs > 1 AND primary_flag = 'Y' THEN department_id
        ELSE NULL
    END IS NOT NULL




