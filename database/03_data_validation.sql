---------------------------------------------
-- Row Counts --
---------------------------------------------

SELECT COUNT(*) AS customer_count
FROM pricing.customers;

SELECT COUNT(*) AS product_count
FROM pricing.products;

SELECT COUNT(*) AS order_count
FROM pricing.orders;

SELECT COUNT(*) AS order_item_count
FROM pricing.order_items;


---------------------------------------------
-- Duplicate Customers --
---------------------------------------------

SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM pricing.customers
GROUP BY customer_id
HAVING COUNT(*) > 1;


---------------------------------------------
-- Duplicate Products --
---------------------------------------------

SELECT
    product_id,
    COUNT(*) AS duplicate_count
FROM pricing.products
GROUP BY product_id
HAVING COUNT(*) > 1;


---------------------------------------------
-- Missing Customer IDs --
---------------------------------------------

SELECT *
FROM pricing.customers
WHERE customer_id IS NULL;


---------------------------------------------
-- Missing Product IDs --
---------------------------------------------

SELECT *
FROM pricing.products
WHERE product_id IS NULL;
