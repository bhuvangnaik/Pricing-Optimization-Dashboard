---------------------------------------------
-- Average Selling Price by Category --
---------------------------------------------

SELECT
    p.category,
    ROUND(
        SUM(oi.line_total_usd) /
        NULLIF(SUM(oi.quantity),0),
        2
    ) AS avg_selling_price
FROM pricing.order_items oi
JOIN pricing.products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_selling_price DESC;