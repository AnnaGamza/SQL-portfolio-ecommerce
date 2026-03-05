/* 
Annual Status Performance & Revenue Leakage 
- Track how the share of 'Lost Revenue' (Cancelled/Returned) changes year over year.
- Compare potential revenue vs real profit across different order statuses.
- Use Window Functions to calculate the weight of each status within its respective year.
*/

SELECT 
    EXTRACT(YEAR FROM oi.created_at) AS report_year,
    oi.status,
    -- Business segmentation of order statuses
    CASE 
        WHEN oi.status = 'Complete' THEN 'Success'
        WHEN oi.status IN ('Cancelled', 'Returned') THEN 'Lost Revenue'
        ELSE 'In Progress'
    END AS revenue_impact,
    -- Financial metrics
    ROUND(SUM(p.cost), 2) AS total_cost,             -- Operational expenses (COGS)
    ROUND(SUM(oi.sale_price), 2) AS potential_revenue, -- Gross amount before status impact
    ROUND(SUM(oi.sale_price - p.cost), 2) AS profit,   -- Net profit (or potential profit)
    -- Advanced Analytics: Calculating % share within each year separately
    ROUND(
        SUM(oi.sale_price) / 
        SUM(SUM(oi.sale_price)) OVER(PARTITION BY EXTRACT(YEAR FROM oi.created_at)) 
        * 100, 2
    ) AS pct_share_in_year
FROM order_items AS oi
LEFT JOIN products AS p ON oi.product_id = p.id
GROUP BY 1, 2, 3
ORDER BY report_year DESC, potential_revenue DESC;
