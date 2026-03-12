/* PART 3.1: Product Category Profitability Analysis
   OBJECTIVE: Identify which product categories generate the highest net profit 
              and compare their efficiency using Profit Margin.
*/

SELECT 
    p.category
    , ROUND(SUM(oi.sale_price) - SUM(p.cost), 2) AS total_profit
    , ROUND((SUM(oi.sale_price) - SUM(p.cost)) / SUM(oi.sale_price) * 100, 2) AS profit_margin_pct
FROM products p 
LEFT JOIN order_items oi ON oi.product_id = p.id 
WHERE oi.status = 'Complete'
GROUP BY 1 
ORDER BY total_profit DESC, profit_margin_pct DESC;
