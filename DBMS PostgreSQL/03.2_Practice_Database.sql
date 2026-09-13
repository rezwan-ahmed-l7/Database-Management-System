CREATE DATABASE shop_db;

CREATE SCHEMA inventory;
CREATE SCHEMA sales;

CREATE TABLE inventory.product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(20) DEFAULT 'general',
    price BIGINT NOT NULL,
    stock_qty INT NOT NULL DEFAULT 0,
    description TEXT
);

CREATE TABLE sales.customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    address TEXT
);

CREATE TABLE sales.orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO inventory.product (product_id, product_name, category, price, stock_qty, description) VALUES
(101, 'Chips', 'Food', 10, 500, 'Fast food for kids'),
(104, 'Milk', 'Drink', 20, 200, 'Drink for kids'),
(105, 'Juice', 'Drink', 30, 150, 'Fresh fruit juice');

INSERT INTO sales.customers (customer_id, customer_name, phone, address) VALUES
(1, 'Rahim Khan', '01711111111', 'Dhaka, Bangladesh'),
(2, 'Karim Ahmed', '01822222222', 'Chittagong, Bangladesh'),
(3, 'Fatima Begum', '01933333333', 'Sylhet, Bangladesh');

INSERT INTO sales.orders (order_id, customer_id, product_id, quantity) VALUES
(1001, 1, 104, 2),
(1002, 2, 104, 1),
(1003, 3, 104, 5);

SELECT * FROM inventory.product;
SELECT * FROM sales.customers;
SELECT * FROM sales.orders;

ALTER DATABASE shop_db RENAME TO shop;
DELETE FROM inventory.product WHERE product_id = 101;
ALTER TABLE inventory.product ADD COLUMN description TEXT;
ALTER TABLE inventory.product ADD COLUMN add_on_date DATE;
