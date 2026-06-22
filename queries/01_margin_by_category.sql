---------------------------------------------
-- Margin By Category --
---------------------------------------------

SELECT
    p.category,
    ROUND(SUM(p.margin_usd * oi.quantity), 2) AS total_profit
FROM pricing.order_items oi
JOIN pricing.products p
ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_profit DESC;