-- Write your PostgreSQL query statement below
SELECT 
    Department.name AS Department, 
    E1.name AS Employee, 
    E1.salary AS Salary
FROM Employee AS E1
JOIN Department ON E1.departmentId = Department.id
WHERE 
(
    SELECT COUNT(DISTINCT salary)
    FROM Employee AS E2
    WHERE E2.departmentId = E1.departmentId AND E2.salary >= E1.salary
) <= 3
ORDER BY Department, Salary DESC