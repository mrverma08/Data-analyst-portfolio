# Olist E-Commerce SQL Analysis

## Business Problem
Analysis of 100k+ delivered orders from Olist (Brazilian e-commerce marketplace) 
to answer three business questions on revenue, seller performance, and customer retention.

## Dataset
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
Tables used: orders, order_items, products, translated_product, sellers, customers.

## Business Questions
1. What is the total revenue and average delivery time per product category?
2. Who are the top 3 sellers by revenue in each state?
3. What percentage of customers place more than one order?

## Key Insights
### Q1 — Revenue & Delivery by Category
- Health_beauty generated 12.33Lakh in revenue, with average delivery of 12 days.
- The slowest category was Office_furniture at 20 days average.
- The fasted category was Art_and_craftmanship at 5 days average and generated 0.02Lakh in revenue

### Q2 — Top Sellers by State
- SP had the highest-revenue top seller at 226987.93.
- Insight about concentration, is SP accounts for 1769 of the total sellers

### Q3 — Customer Retention
- Repeat customer rate: 3%.
- Average orders per customer: 1.03.
- Highest retention states: AC at 5.26%, RO at 3.90%; lowest: AP at 1.52%.

## Data Quality Note
1,559 out of 110197 delivered items lacked English category translations 
and were excluded from category-level analysis. All other categories are complete.

## Tools & Skills
- SQL (MySQL-compatible, TiDB Cloud)
- Techniques: multi-table JOINs, CTEs, window functions (ROW_NUMBER, PARTITION BY), 
  subqueries, conditional aggregation (CASE WHEN), date functions (TIMESTAMPDIFF)

## Repository Structure
- 01_schema_setup.sql — table definitions
- 02_kpi_analysis.sql — Q1: revenue & delivery by category
- 03_ranking_analysis.sql — Q2: top sellers by state
- 04_customer_analysis.sql — Q3: repeat customer rate
- 04a_repeat_by_state.sql — bonus: retention by state
