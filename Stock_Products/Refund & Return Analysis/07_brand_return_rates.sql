/* Identify brands with disproportionately high return rates 
              to evaluate product quality and sizing accuracy.
*/

SELECT 
    p.brand
    -- Units shipped (including those returned later)
    , COUNT(CASE WHEN oi.status IN ('Complete', 'Returned', 'Shipped', 'Delivered') THEN 1 END) AS units_shipped
    -- Units actually returned
    , COUNT(CASE WHEN oi.status = 'Returned' THEN 1 END) AS units_returned
    -- Return rate relative to actual shipments
    , ROUND(
        COUNT(CASE WHEN oi.status = 'Returned' THEN 1 END) * 100.0 / 
        NULLIF(COUNT(CASE WHEN oi.status IN ('Complete', 'Returned', 'Shipped', 'Delivered') THEN 1 END), 0), 
    2) AS return_rate_pct
FROM products p
JOIN order_items oi ON p.id = oi.product_id 
GROUP BY p.brand
HAVING COUNT(oi.id) > 50 
ORDER BY return_rate_pct desc
LIMIT 10
