-- Write your PostgreSQL query statement below
SELECT unique_id, Employees.name 
FROM EmployeeUNI 
RIGHT JOIN Employees
    ON Employees.id = EmployeeUNI.id 
    