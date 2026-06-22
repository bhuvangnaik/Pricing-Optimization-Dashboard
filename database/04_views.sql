CREATE OR REPLACE VIEW pricing.vw_category_performance AS
SELECT
    p.category,
    ROUND(SUM(p.margin_usd * oi.quantity), 2) AS total_profit
FROM pricing.order_items oi
JOIN pricing.products p
ON oi.product_id = p.product_id
GROUP BY p.category;


CREATE OR REPLACE VIEW pricing.vw_discount_analysis AS
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
GROUP BY o.discount_pct;


CREATE OR REPLACE VIEW pricing.vw_price_analysis AS
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
GROUP BY p.category;


CREATE OR REPLACE VIEW pricing.vw_monthly_trend AS
SELECT
    DATE_TRUNC('month', order_time)::date AS month,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(total_usd),2) AS revenue
FROM pricing.orders
GROUP BY month;


CREATE OR REPLACE VIEW pricing.vw_loss_products AS
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
    o.discount_pct;