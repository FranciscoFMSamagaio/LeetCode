-- Write your PostgreSQL query statement below
SELECT customer_id, COUNT(customer_id) AS count_no_trans
FROM Visits
FULL OUTER JOIN Transactions ON Transactions.visit_id = Visits.visit_id
WHERE transaction_id IS null 
GROUP BY customer_id