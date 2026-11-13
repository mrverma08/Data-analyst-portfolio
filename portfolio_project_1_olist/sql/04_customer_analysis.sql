USE 1stSQLProject; 

-- Q3: What percentage of customers place more than one order?
-- Note: customer_id is generated per order, while customer_unique_id represents a unique customer.

-- Step 1: Calculate total delivered orders per unique customer using a CTE
WITH ab AS (
    SELECT 
        c.customer_unique_id AS ID, 
        COUNT(o.order_id) AS Total_Orders 
    FROM Customers c 
    JOIN Orders o ON c.customer_id = o.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
)

-- Step 2: Aggregate metrics (total orders, repeat customers, repeat rate %, and average orders per customer)
SELECT 
    SUM(Total_Orders) AS number_of_orders,
    SUM(CASE WHEN Total_Orders > 1 THEN 1 ELSE 0 END) AS Repeat_cust, 
    ROUND(SUM(CASE WHEN Total_Orders > 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(Total_Orders), 2) AS Repeat_cust_percent,
    ROUND(AVG(Total_Orders), 2) AS avg_order_per_cust
FROM ab;
