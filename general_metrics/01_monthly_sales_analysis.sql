/* MONTHLY SALES & AOV ANALYSIS
This script includes two approaches to monthly reporting:
1. Financial KPIs: Calculates real revenue and net profit based on actual 'sale_price' and product 'cost'.
2. Catalog Performance: Analyzes potential revenue and Average Order Value (AOV) using 'retail_price' 
   and official order creation timestamps from the 'orders' table.
*/
SELECT 
    TO_CHAR(DATE_TRUNC('month', oi.created_at), 'YYYY-MM') AS report_month
    , ROUND(SUM(oi.sale_price), 2) AS month_revenue 
    , ROUND(SUM(oi.sale_price - p.cost), 2) AS monthly_profit 
    , COUNT(DISTINCT oi.order_id) AS total_orders
    , ROUND(SUM(oi.sale_price) / COUNT(DISTINCT oi.order_id), 2) AS aov
FROM order_items AS oi
LEFT JOIN products AS p 
    ON oi.product_id = p.id
WHERE oi.status = 'Complete'
GROUP BY DATE_TRUNC('month', oi.created_at), report_month
ORDER BY report_month
