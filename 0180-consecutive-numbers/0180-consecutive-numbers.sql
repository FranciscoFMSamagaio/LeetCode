-- Write your PostgreSQL query statement below

SELECT 
    DISTINCT l1.num AS ConsecutiveNums
FROM Logs AS l1
JOIN Logs AS l2 ON l1.num = l2.num AND l1.id +1 = l2.id 
JOIN Logs AS l3 ON l1.num = l3.num AND l1.id +2 = l3.id
