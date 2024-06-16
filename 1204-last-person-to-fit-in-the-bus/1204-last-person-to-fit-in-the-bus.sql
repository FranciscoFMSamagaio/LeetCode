# Write your MySQL query statement below
WITH OrderedQueue AS (
    SELECT 
        person_name, 
        weight, 
        turn,
        SUM(weight) OVER (ORDER BY turn) AS weight_person
    FROM Queue
)
SELECT person_name
FROM OrderedQueue
WHERE weight_person <= 1000
ORDER BY turn DESC
LIMIT 1;
