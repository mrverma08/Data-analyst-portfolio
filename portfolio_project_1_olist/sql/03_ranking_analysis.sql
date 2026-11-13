USE 1stSQLProject;
-- Q2 Top 3 seller by state
-- Step 1: Calculate the total revenue and state for each seller based on delivered orders
WITH seller_revenue AS (
    SELECT 
        s.seller_id, 
        s.seller_state, 
        round(SUM(oi.price),2) AS revenue 
    FROM seller s 
    JOIN Order_items oi ON oi.seller_id = s.seller_id 
    JOIN Orders o ON o.order_id = oi.order_id 
    WHERE o.order_status = 'delivered' 
    GROUP BY s.seller_id, s.seller_state
) 

-- Step 2: Assign row numbers partitioned by state to rank sellers by revenue and filter the top 3 per state
SELECT 
    seller_state, 
    seller_id, 
    revenue, 
    rn 
FROM (
  -- Note: Subquery is used to rank state 
    SELECT 
        seller_state, 
        seller_id, 
        revenue, 
        ROW_NUMBER() OVER (PARTITION BY seller_state ORDER BY revenue DESC) AS rn 
    FROM seller_revenue
) ranked 
WHERE rn <= 3
ORDER BY revenue DESC, rn ;
