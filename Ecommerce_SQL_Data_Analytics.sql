USE sql_data_analysis;
SELECT * FROM cleaned_dataset LIMIT 10;
ALTER TABLE cleaned_dataset MODIFY Quantity INT;
ALTER TABLE cleaned_dataset MODIFY ItemsInCart INT;
ALTER TABLE cleaned_dataset MODIFY UnitPrice DECIMAL(10,2);
ALTER TABLE cleaned_dataset MODIFY TotalPrice DECIMAL(10,2);
ALTER TABLE cleaned_dataset MODIFY Date DATE;
DESCRIBE cleaned_dataset;
SELECT COUNT(*) FROM cleaned_dataset;
SELECT OrderID, Date, Product, Quantity, TotalPrice
FROM cleaned_dataset
LIMIT 10;
SELECT OrderID, CustomerID, Product, OrderStatus, TotalPrice
FROM cleaned_dataset
WHERE OrderStatus = 'Cancelled';
SELECT OrderID, Product, TotalPrice
FROM cleaned_dataset
WHERE TotalPrice > 2000;
SELECT OrderID, Product, TotalPrice
FROM cleaned_dataset
ORDER BY TotalPrice DESC
LIMIT 10;
SELECT Product, COUNT(*) AS order_count
FROM cleaned_dataset
GROUP BY Product
ORDER BY order_count DESC;
SELECT Product, SUM(TotalPrice) AS total_revenue
FROM cleaned_dataset
GROUP BY Product
ORDER BY total_revenue DESC;
SELECT PaymentMethod, ROUND(AVG(TotalPrice), 2) AS avg_order_value
FROM cleaned_dataset
GROUP BY PaymentMethod
ORDER BY avg_order_value DESC;
SELECT OrderStatus, COUNT(*) AS status_count
FROM cleaned_dataset
WHERE Product = 'Monitor'
GROUP BY OrderStatus
ORDER BY status_count DESC;
SELECT ReferralSource, COUNT(*) AS order_count
FROM cleaned_dataset
GROUP BY ReferralSource
HAVING COUNT(*) > 200
ORDER BY order_count DESC;
SELECT
    COUNT(*)                AS total_orders,
    SUM(TotalPrice)          AS total_revenue,
    ROUND(AVG(TotalPrice),2) AS avg_order_value,
    MIN(TotalPrice)           AS min_order_value,
    MAX(TotalPrice)           AS max_order_value
FROM cleaned_dataset;