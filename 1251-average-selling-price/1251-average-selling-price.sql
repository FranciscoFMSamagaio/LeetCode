-- Write your PostgreSQL query statement below
SELECT Prices.product_id, COALESCE(ROUND((SUM(units * price) * 1.0/ SUM(units)), 2),0) AS average_price
FROM Prices 
LEFT JOIN UnitsSold
ON Prices.product_id = UnitsSold.product_id 
WHERE (UnitsSold.purchase_date BETWEEN 
    Prices.start_date AND Prices.end_date) 
    OR UnitsSold.purchase_date IS null
GROUP BY Prices.product_id