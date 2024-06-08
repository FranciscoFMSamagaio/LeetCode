-- Write your PostgreSQL query statement below
SELECT name, bonus 
FROM Employee 
LEFT JOIN Bonus ON Bonus.empID = Employee.empID
WHERE bonus < 1000 OR 
    bonus IS null