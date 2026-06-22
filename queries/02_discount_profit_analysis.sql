---------------------------------------------
-- Discount Profit Analysis --
---------------------------------------------

SELECT
    o.discount_pct,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(o.total_usd), 2) AS total_revenue,
    ROUND(SUM(p.margin_usd * oi.quantity), 2) AS total_profit
FROM pricing.orders o
JOIN pricing.order_items oi
    ON o.order_id = oi.order_id
JOIN pricing.products p
    ON oi.product_id = p.product_id
GROUP BY o.discount_pct
ORDER BY o.discount_pct;