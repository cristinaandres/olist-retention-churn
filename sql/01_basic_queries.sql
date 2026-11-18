-- ==========================================
-- Query: Top 5 States by Order Volume
-- Objective: Identify the most active regions in Brazil 
-- to prioritize logistics and marketing efforts.
-- ==========================================

SELECT 
    c.customer_state, 
    COUNT(o.order_id) AS total_orders
FROM orders_analysis o
JOIN customers_table c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC
LIMIT 5;