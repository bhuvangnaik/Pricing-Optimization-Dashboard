------------------------------------------------
-- PRICING OPTIMIZATION DASHBOARD --
------------------------------------------------

-- Create Database --
CREATE DATABASE pricing_dashboard;

-- Create Schema --
CREATE SCHEMA pricing;

-- Customers Table --
CREATE TABLE pricing.customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    country VARCHAR(100),
    age INTEGER,
    signup_date DATE,
    marketing_opt_in BOOLEAN
);

-- Products Table --
CREATE TABLE pricing.products (
    product_id VARCHAR(50) PRIMARY KEY,
    category VARCHAR(100),
    name VARCHAR(255),
    price_usd NUMERIC(10,2),
    cost_usd NUMERIC(10,2),
    margin_usd NUMERIC(10,2)
);

-- Orders Table --
CREATE TABLE pricing.orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_time TIMESTAMP,
    payment_method VARCHAR(50),
    discount_pct NUMERIC(5,2),
    subtotal_usd NUMERIC(10,2),
    total_usd NUMERIC(10,2),
    country VARCHAR(100),
    device VARCHAR(50),
    source VARCHAR(100)
);

-- Order Items Table --
CREATE TABLE pricing.order_items (
    order_id VARCHAR(50),
    product_id VARCHAR(50),
    unit_price_usd NUMERIC(10,2),
    quantity INTEGER,
    line_total_usd NUMERIC(12,2)
);