-- Write your PostgreSQL query statement below

SELECT 
    Queries.query_name, 
    CASE 
        WHEN qua.quality IS null THEN 0
        WHEN qua.quality IS NOT null THEN qua.quality 
    END AS quality,
    CASE 
        WHEN poor_query.percentage IS null THEN 0
        WHEN poor_query.percentage IS NOT null THEN poor_query.percentage 
    END AS poor_query_percentage 
FROM Queries
LEFT JOIN (
    SELECT 
        Queries.query_name,
        CASE 
            WHEN query_count = 0 THEN 0
            WHEN query_count <> 0 THEN ROUND(COUNT(rating)*100.0/query_count,2) 
        END AS percentage 
    FROM 
        Queries
    JOIN
        (SELECT query_name, COUNT(query_name) AS query_count FROM Queries GROUP BY query_name) AS query_names
        ON query_names.query_name = Queries.query_name
    WHERE
        rating < 3
    GROUP BY 
        Queries.query_name, query_count
) AS poor_query  
ON poor_query.query_name = Queries.query_name
INNER JOIN (
    SELECT 
        query_name, 
        CASE 
            WHEN COUNT(query_name) = 0 THEN 0
            WHEN COUNT(query_name) <> 0 THEN ROUND(SUM(rating*1.0/position*1.0)/COUNT(query_name),2)
        END AS quality 
    FROM 
        Queries
    GROUP BY 
        query_name
) AS qua
ON qua.query_name = Queries.query_name
GROUP BY Queries.query_name, qua.quality, poor_query.percentage 