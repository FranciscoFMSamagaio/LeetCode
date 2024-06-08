# Write your MySQL query statement below
SELECT
    CASE
        WHEN MAX(salary)>=0 THEN MAX(salary)
        ELSE null
    END AS SecondHighestSalary
FROM Employee 
WHERE salary <> (SELECT MAX(salary) FROM Employee)      
