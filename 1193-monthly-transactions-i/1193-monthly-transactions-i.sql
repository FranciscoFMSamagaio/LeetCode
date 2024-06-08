SELECT
    to_char(trans_date, 'YYYY-MM') AS month,
    country,
    COUNT(distinct id) AS trans_count,
    COUNT(distinct 
        CASE
            WHEN state = 'approved' THEN id 
            ELSE null 
            END
        ) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(
        CASE
            WHEN state = 'approved' THEN amount 
            ELSE 0 
            END
        )AS approved_total_amount
FROM Transactions
GROUP BY 1,2
ORDER BY 1