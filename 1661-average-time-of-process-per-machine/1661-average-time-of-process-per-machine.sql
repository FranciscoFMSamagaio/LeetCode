-- Write your PostgreSQL query statement below
SELECT machine_id, round(AVG(temp)::numeric,3) AS processing_time
FROM (
    SELECT machine_id, process_id, (MAX(timestamp) - MIN(timestamp)) AS temp
    FROM Activity 
    GROUP BY machine_id, process_id
) 
GROUP BY machine_id;