/* Best Selling Products Analysis
   OBJECTIVE: Identify the top 10 products by sales volume and 
              their contribution to total profit.
*/

SELECT 
    p.name,
    p.brand,
    COUNT(oi.id) AS units_sold,
    ROUND(SUM(oi.sale_price) - SUM(p.cost), 2) AS total_profit
FROM products p
LEFT JOIN order_items oi ON oi.product_id = p.id
WHERE oi.status = 'Complete'
GROUP BY p.id, p.name, p.brand -- Групування за ID гарантує точність
ORDER BY units_sold DESC, total_profit DESC
LIMIT 10;
