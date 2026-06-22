---------------------------------------------
-- High Discount Loss Products --
---------------------------------------------

SELECT
    p.product_id,
    p.name,
    p.category,
    o.discount_pct,
    ROUND(SUM(oi.line_total_usd),2) AS revenue,
    ROUND(SUM(p.margin_usd * oi.quantity),2) AS profit
FROM pricing.orders o
JOIN pricing.order_items oi
    ON o.order_id = oi.order_id
JOIN pricing.products p
    ON oi.product_id = p.product_id
WHERE o.discount_pct >= 15
GROUP BY
    p.product_id,
    p.name,
    p.category,
    o.discount_pct
ORDER BY profit ASC
LIMIT 20;