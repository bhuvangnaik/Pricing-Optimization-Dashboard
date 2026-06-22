---------------------------------------------
-- Monthly Sales Trend --
---------------------------------------------

SELECT
    DATE_TRUNC('month', order_time)::date AS month,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(total_usd),2) AS revenue
FROM pricing.orders
GROUP BY month
ORDER BY month;