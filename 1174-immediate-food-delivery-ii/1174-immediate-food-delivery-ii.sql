-- Write your PostgreSQL query statement below

WITH count_delivery AS 
(SELECT 
    customer_id, 
--    MIN(order_date) AS first_order, 
--    MIN(customer_pref_delivery_date) AS first_delivery,
    CASE
        WHEN MIN(order_date) = MIN(customer_pref_delivery_date) THEN 1
        ELSE 0
    END AS count_delivery
FROM Delivery
GROUP BY customer_id
)

SELECT 
ROUND((SUM(count_delivery) * 100.0/ COUNT(*)),2) AS immediate_percentage 
FROM count_delivery