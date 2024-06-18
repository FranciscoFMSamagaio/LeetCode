-- Write your PostgreSQL query statement below
WITH aux AS 
(
    SELECT
        visited_on,
        SUM(amount) OVER 
        (
            ORDER BY visited_on
            ROWS 6 PRECEDING
        ) AS amount,
        RANK() OVER 
        (
            ORDER BY visited_on
            ROWS 6 PRECEDING
        ) AS nrows
    FROM
    (
        SELECT visited_on, SUM(amount) AS amount
        FROM Customer
        GROUP BY visited_on
    ) 
)
SELECT visited_on, amount, ROUND(amount/7, 2) AS average_amount
FROM aux
WHERE nrows > 6;