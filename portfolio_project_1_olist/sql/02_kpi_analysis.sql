USE 1stSQLProject; 

-- Q: What is the total revenue and average delivery time for each product category?
SELECT 
    t.product_category_name_english AS product, 
    
    -- Calculate average delivery duration in days from order placement to delivery
    ROUND(AVG(TIMESTAMPDIFF(DAY, o.order_purchase_timestamp, o.order_delivered_customer_date)), 0) AS average_delivery_in_days, 
    
    -- Aggregate total item price (excluding freight) and convert to Lakhs
    ROUND(SUM(oi.price) / 100000, 2) AS revenue_in_lakh 

FROM Orders o 
JOIN Order_items oi ON o.order_id = oi.order_id 
JOIN products p ON p.product_id = oi.product_id 
JOIN translated_product t ON t.product_category_name = p.product_category_name 
WHERE o.order_status = 'delivered' 
GROUP BY product 
ORDER BY revenue_in_lakh DESC;
