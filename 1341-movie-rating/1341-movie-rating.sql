-- Write your PostgreSQL query statement below
(
    SELECT 
        tU.name AS results 
    FROM 
    (
        SELECT 
            tM.user_id, 
            Count(*) AS cnt 
        FROM MovieRating AS tM 
        GROUP BY tM.user_id
    ) AS tM 
    INNER JOIN users AS tU 
    ON tM.user_id = tU.user_id 
    ORDER BY tM.cnt DESC, tU.name ASC 
    LIMIT  1
)

UNION ALL 

(
SELECT 
    b.movie_name 
FROM (
    SELECT 
        a.movie_name, 
        Avg(a.rating) AS max_rating 
    FROM (
        SELECT 
            a.rating,
            b.title AS movie_name 
        FROM MovieRating AS a 
        INNER JOIN movies b 
        ON a.movie_id = b.movie_id 
        WHERE  a.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    ) a 
    GROUP  BY a.movie_name) AS b 
    ORDER  BY b.max_rating DESC, b.movie_name ASC 
    LIMIT  1
)
