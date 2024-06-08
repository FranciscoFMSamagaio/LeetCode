-- Write your PostgreSQL query statement below
--SELECT name 
--FROM 
--(
--    SELECT E1.id AS manager_id, E1.name AS name, COUNT(E2.managerid) AS manager
--    FROM Employee AS E1
--    LEFT JOIN Employee AS E2 ON
--    E2.managerId = E1.id 
--    GROUP BY E1.id, E1.name
--)
--WHERE manager >= 5

SELECT E1.name AS name
FROM Employee AS E1
LEFT JOIN Employee AS E2 ON
E2.managerId = E1.id 
GROUP BY E1.id, E1.name
HAVING COUNT(E2.managerid) >= 5

