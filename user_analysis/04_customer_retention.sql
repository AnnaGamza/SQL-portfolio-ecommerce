/*  Customer Retention Analysis (New vs. Returning)
   OBJECTIVE: Evaluate brand loyalty by calculating the ratio of first-time 
              purchases to repeat orders on an annual basis.
*/

WITH orders_ranked AS (
    -- Step 1: Clean data by grouping items into unique orders 
    -- and numbering them per user to identify purchase sequence.
    SELECT 
        order_id,
        user_id,
        order_date,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date) AS order_number
    FROM (
        SELECT 
            user_id
            , order_id
            , MIN(created_at) AS order_date
        FROM order_items
        WHERE status = 'Complete'
        GROUP BY user_id, order_id
    ) AS clean_orders
)

-- Step 2: Final report aggregating customers by year and loyalty status.
SELECT 
    EXTRACT(YEAR FROM order_date) AS report_year
    , CASE 
        WHEN order_number = 1 THEN 'New Customer'
        ELSE 'Returning Customer'
    END AS customer_status
    , COUNT(order_id) AS total_orders
FROM orders_ranked
GROUP BY 1, 2
ORDER BY 1 DESC, 2;
