/* Top 10 Countries by Revenue & Customer Profile
OBJECTIVE: Identify key markets, calculate Average Order Value (AOV), 
           and analyze the age demographics of active customers.
*/

SELECT 
    u.country,
    ROUND(SUM(oi.sale_price), 2) AS total_revenue,
    ROUND(SUM(oi.sale_price) / COUNT(DISTINCT oi.order_id), 2) AS aov,
    COUNT(DISTINCT oi.user_id) AS unique_customers,
    ROUND(AVG(u.age), 0) AS avg_customer_age
FROM users AS u
LEFT JOIN order_items AS oi ON u.id = oi.user_id
WHERE oi.status = 'Complete'
GROUP BY u.country
ORDER BY total_revenue DESC
LIMIT 10;
