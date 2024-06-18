-- Write your PostgreSQL query statement below
SELECT 
    id,
    CASE
        WHEN id%2 = 0 THEN LAG(student) OVER ( ORDER BY id )
        WHEN id = (SELECT COUNT(*) FROM Seat) THEN student
        ELSE LEAD(student) OVER ( ORDER BY id ) 
    END AS student 
FROM Seat