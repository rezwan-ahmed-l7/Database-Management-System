CREATE DATABASE ecommerce;

DROP TABLE IF EXISTS shipments, orders, customers CASCADE;

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name        VARCHAR(60) NOT NULL,
    city        VARCHAR(40),
    email       VARCHAR(80),
    signup_date DATE
);

INSERT INTO customers (name, city, email, signup_date) VALUES
    ('Ayesha Rahman',   'Dhaka',      'ayesha@mail.com',   '2024-11-02'),
    ('Bashir Uddin',    'Chattogram', 'bashir@mail.com',   '2024-11-10'),
    ('Chandni Akter',   'Rajshahi',   'chandni@mail.com',  '2024-12-01'),
    ('Dipto Roy',       'Khulna',     'dipto@mail.com',    '2024-12-15'),
    ('Emon Hossain',    'Sylhet',     'emon@mail.com',     '2025-01-03'),
    ('Farhana Islam',   'Dhaka',      'farhana@mail.com',  '2025-01-08'),
    ('Galib Chowdhury', 'Barishal',   'galib@mail.com',    '2025-01-12'),
    ('Hasan Mahmud',    'Rangpur',    'hasan@mail.com',    '2025-01-20'),
    ('Imran Kabir',     'Dhaka',      'imran@mail.com',    '2025-02-01'),
    ('Jarin Tasnim',    'Chattogram', 'jarin@mail.com',    '2025-02-05'),
    ('Kamal Ahmed',     'Saidpur',    'kamal@mail.com',    '2025-02-10'),
    ('Lamia Sultana',   'Dhaka',      'lamia@mail.com',    '2025-02-14'),
    ('Mahin Reza',      'Chattogram', 'mahin@mail.com',    '2025-02-18'),
    ('Nadia Haque',     'Dhaka',      'nadia@mail.com',    '2025-02-22'),
    ('Omar Faruk',      'Rajshahi',   'omar@mail.com',     '2025-02-26'),
    ('Priya Das',       'Khulna',     'priya@mail.com',    '2025-03-01'),
    ('Quazi Nabil',     'Sylhet',     'quazi@mail.com',    '2025-03-04'),
    ('Rumana Kabir',    'Dhaka',      'rumana@mail.com',   '2025-03-08'),
    ('Sabbir Alam',     'Chattogram', 'sabbir@mail.com',   '2025-03-12'),
    ('Tania Ferdous',   'Rangpur',    'tania@mail.com',    '2025-03-15');

CREATE TABLE orders (
    order_id    SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date  DATE NOT NULL,
    amount      NUMERIC(10,2) NOT NULL,
    status      VARCHAR(20)
);

INSERT INTO orders (customer_id, order_date, amount, status) VALUES
    ( 1, '2025-01-05', 1200.00, 'Delivered'),
    ( 1, '2025-02-10',  450.50, 'Delivered'),
    ( 1, '2025-03-15',  300.00, 'Processing'),
    ( 2, '2025-01-15',  800.00, 'Shipped'),
    ( 2, '2025-03-01', 1100.00, 'Delivered'),
    ( 3, '2025-01-20', 2300.75, 'Delivered'),
    ( 3, '2025-03-03',   75.50, 'Processing'),
    ( 4, '2025-02-01',  150.00, 'Cancelled'),
    ( 5, '2025-02-05',  999.99, 'Shipped'),
    ( 6, '2025-01-22',  560.00, 'Delivered'),
    ( 6, '2025-02-28',  240.00, 'Shipped'),
    ( 7, '2025-02-15', 1750.00, 'Delivered'),
    ( 8, '2025-02-18',  300.25, 'Processing'),
    ( 9, '2025-02-20',  540.00, 'Shipped'),
    ( 9, '2025-03-10',  680.00, 'Delivered'),
    (10, '2025-03-05', 2000.00, 'Shipped'),
    (11, '2025-03-08',  430.00, 'Delivered'),
    (13, '2025-03-12',  910.00, 'Delivered'),
    (14, '2025-01-30',  125.00, 'Cancelled'),
    (14, '2025-03-18',  765.40, 'Shipped'),
    (15, '2025-02-22',  350.00, 'Delivered'),
    (16, '2025-02-25', 1450.00, 'Delivered'),
    (18, '2025-01-28',  220.00, 'Processing'),
    (18, '2025-03-20',  980.00, 'Shipped'),
    (19, '2025-02-08',  640.00, 'Delivered'),
    ( 3, '2025-03-25',  500.00, 'Shipped'),
    (16, '2025-03-22',  150.75, 'Processing'),
    (19, '2025-03-28', 1320.00, 'Delivered');

CREATE TABLE shipments (
    shipment_id  SERIAL PRIMARY KEY,
    order_id     INT REFERENCES orders(order_id),
    shipped_date DATE,
    carrier      VARCHAR(30),
    tracking_no  VARCHAR(20),
    status       VARCHAR(20)
);

INSERT INTO shipments (order_id, shipped_date, carrier, tracking_no, status) VALUES
    ( 1, '2025-01-06', 'RedX',      'TRK100001', 'Delivered'),
    ( 2, '2025-02-11', 'Pathao',    'TRK100002', 'Delivered'),
    ( 4, '2025-01-16', 'Steadfast', 'TRK100003', 'In Transit'),
    ( 5, '2025-03-02', 'Sundarban', 'TRK100004', 'Delivered'),
    ( 6, '2025-01-21', 'DHL',       'TRK100005', 'Delivered'),
    ( 9, '2025-02-06', 'RedX',      'TRK100006', 'In Transit'),
    (10, '2025-01-23', 'Pathao',    'TRK100007', 'Delivered'),
    (11, '2025-03-01', 'Steadfast', 'TRK100008', 'In Transit'),
    (12, '2025-02-16', 'Sundarban', 'TRK100009', 'Delivered'),
    (14, '2025-02-21', 'DHL',       'TRK100010', 'In Transit'),
    (15, '2025-03-11', 'RedX',      'TRK100011', 'Delivered'),
    (16, '2025-03-06', 'Pathao',    'TRK100012', 'In Transit'),
    (17, '2025-03-09', 'Steadfast', 'TRK100013', 'Delivered'),
    (18, '2025-03-13', 'Sundarban', 'TRK100014', 'Delivered'),
    (20, '2025-03-19', 'DHL',       'TRK100015', 'In Transit'),
    (21, '2025-02-23', 'RedX',      'TRK100016', 'Delivered'),
    (22, '2025-02-26', 'Pathao',    'TRK100017', 'Delivered'),
    (24, '2025-03-21', 'Steadfast', 'TRK100018', 'In Transit'),
    (25, '2025-02-09', 'Sundarban', 'TRK100019', 'Delivered'),
    (26, '2025-03-26', 'DHL',       'TRK100020', 'In Transit'),
    (28, '2025-03-29', 'RedX',      'TRK100021', 'Delivered');

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM shipments;

--- Class Operations

--- 1. INNER JOIN: Retrieve customer names and their order amounts
SELECT c.name, o.amount
FROM customers AS c
INNER JOIN orders AS o
  ON c.customer_id = o.customer_id;

-- 2. INNER JOIN: Retrieve customer names, order amounts, and order statuses
SELECT c.name, o.amount, o.status
FROM customers AS c
INNER JOIN orders AS o
  ON c.customer_id = o.customer_id;

-- 3. LEFT JOIN: List ALL customers including those without any orders
SELECT c.name, o.amount, o.status
FROM customers AS c
LEFT JOIN orders AS o
  ON c.customer_id = o.customer_id;

-- 4. RIGHT JOIN: List ALL shipments including orders without tracking info
SELECT o.order_id, o.amount, o.status
FROM orders AS o
RIGHT JOIN shipments AS s
  ON o.order_id = s.order_id;

-- 5. FULL OUTER JOIN: List ALL orders and ALL shipments regardless of matching
SELECT o.order_id, o.status AS order_status, s.status AS shipment_status
FROM orders AS o
FULL OUTER JOIN shipments AS s
  ON o.order_id = s.order_id;

-- 6. CROSS JOIN: Generate every combination of customer and order
SELECT c.name, o.order_id
FROM customers AS c
CROSS JOIN orders AS o;

-- 7. SELF JOIN: Find customers living in the same city (excludes self-pairing)
SELECT a.name AS customer_1, b.name AS customer_2, a.city
FROM customers AS a
JOIN customers AS b
  ON a.city = b.city
  AND a.customer_id != b.customer_id;

-- 8. SELF JOIN: Same city pairing without reverse duplicate rows
SELECT a.name AS customer_1, b.name AS customer_2, a.city
FROM customers AS a
JOIN customers AS b
  ON a.city = b.city
  AND a.customer_id < b.customer_id;

-- 9. SELF JOIN / ORDER PAIRS: Compare orders placed by the same customer
SELECT o1.order_id AS primary_order, o2.order_id AS related_order, o1.customer_id
FROM orders AS o1
JOIN orders AS o2
  ON o1.customer_id = o2.customer_id
  AND o1.order_id < o2.order_id;

-- 10. MULTI-TABLE JOIN: Combine Customer, Order, and Shipment info
SELECT c.name, o.amount, o.status AS order_status, s.status AS shipment_status
FROM orders AS o
JOIN customers AS c 
  ON o.customer_id = c.customer_id
JOIN shipments AS s 
  ON o.order_id = s.order_id;