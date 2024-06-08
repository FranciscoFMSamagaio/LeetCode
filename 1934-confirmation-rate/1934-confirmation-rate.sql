-- Write your PostgreSQL query statement below
SELECT 
Signups.user_id, 
CASE 
    WHEN (COALESCE(timeout.t, 0) + COALESCE(confirmed.c, 0)) = 0 THEN 0
    WHEN (COALESCE(timeout.t, 0) + COALESCE(confirmed.c, 0)) <> 0 THEN 
    ROUND((COALESCE(confirmed.c, 0)*1.0 / (COALESCE(timeout.t, 0) + COALESCE(confirmed.c, 0))) ,2)
END AS confirmation_rate 
FROM Signups
LEFT JOIN (
    SELECT user_id, COUNT(action) AS t
    FROM Confirmations
    WHERE action = 'timeout'
    GROUP BY user_id
    ) timeout
ON timeout.user_id = Signups.user_id
LEFT JOIN (
    SELECT user_id, COUNT(action) AS c
    FROM Confirmations
    WHERE action = 'confirmed'
    GROUP BY user_id
    ) confirmed
ON confirmed.user_id = Signups.user_id
