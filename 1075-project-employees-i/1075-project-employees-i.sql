-- Write your PostgreSQL query statement below
SELECT project_id, ROUND(AVG(experience_years),2) AS average_years
FROM Employee 
RIGHT JOIN  Project ON
Project.employee_id = Employee.employee_id  
GROUP BY project_id 
