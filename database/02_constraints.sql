---------------------------------------------
-- Foreign Keys --
---------------------------------------------

ALTER TABLE pricing.orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES pricing.customers(customer_id);

ALTER TABLE pricing.order_items
ADD CONSTRAINT fk_orderitems_order
FOREIGN KEY (order_id)
REFERENCES pricing.orders(order_id);

ALTER TABLE pricing.order_items
ADD CONSTRAINT fk_orderitems_product
FOREIGN KEY (product_id)
REFERENCES pricing.products(product_id);

---------------------------------------------
-- Indexes --
---------------------------------------------

CREATE INDEX idx_orders_customer
ON pricing.orders(customer_id);

CREATE INDEX idx_orderitems_order
ON pricing.order_items(order_id);

CREATE INDEX idx_orderitems_product
ON pricing.order_items(product_id);