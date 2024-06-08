---- Write your PostgreSQL query statement below
WITH frac AS (
    SELECT 
        player_id, 
        fir,
        sec,
        CASE
            WHEN sec = (fir + 1) THEN 1
            ELSE 0
        END AS fraction
    FROM 
    (        
        SELECT player_id, 
            MIN(event_date) AS fir
        FROM Activity
        GROUP BY player_id
    )
    LEFT JOIN 
    (
        SELECT player_id, MIN(event_date) AS sec
        FROM (
            SELECT player_id, event_date, 
                            ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date ASC) AS rn
        FROM Activity
        ) t
        WHERE rn = 2
        GROUP BY player_id
    )
    USING(player_id)
)

SELECT ROUND(SUM(fraction) * 1.0 / COUNT(*),2) AS fraction
FROM frac
