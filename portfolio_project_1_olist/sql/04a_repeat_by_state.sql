USE 1stSQLProject;
-- Bonus: repeat rate by state
-- Note: customer_id is generated per order, while customer_unique_id represents a unique customer.

-- Step 1: Calculate total delivered orders per unique customer and state using a CTE
with ab as (Select c.customer_unique_id ID, 
  c.customer_state states, count(o.order_id) counts 
  from Customers c join Orders o on o.customer_id = c.customer_id
  where o.order_status = 'delivered'
  group by ID, states)
  -- Step 2: Aggregated metrix (total_count, Repeat_cust, and repeat_cust_in_%) per states
  select states, sum(counts) as Total_count, 
  sum(case when counts > 1 then 1 else 0 end ) as repeat_cust, 
  round(sum(case when counts > 1 then 1 else 0 end) / Count(ID) *100, 2) as repeat_cust_in_percentage 
  from ab
  group by states
  order by repeat_cust_in_percentage desc

