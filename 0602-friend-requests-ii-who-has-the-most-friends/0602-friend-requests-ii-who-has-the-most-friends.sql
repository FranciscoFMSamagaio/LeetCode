-- Write your PostgreSQL query statement below
WITH aux AS 
(
    SELECT requester_id AS ids FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS ids FROM RequestAccepted
)

SELECT 
    ids AS id, 
    COUNT(*) AS num
FROM aux 
GROUP BY ids
ORDER BY num DESC
LIMIT 1