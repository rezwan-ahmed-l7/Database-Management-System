-- =====================================================================
--  CSE 2206 · DBMS Sessional
--  Lab: Transactions, COMMIT, ROLLBACK and SAVEPOINT (PostgreSQL)
--  Setup script  ·  creates schema "txn_lab" with all lab tables
-- =====================================================================
--
--  Plain SQL: runs in the Supabase SQL Editor, DBeaver, psql or any
--  other PostgreSQL client. Run the WHOLE file at once.
--  Running it again at any time RESETS the lab to a clean state.
--
--  Everything lives in its own schema "txn_lab", so nothing else in
--  your database is touched. Only schema txn_lab is dropped and rebuilt.
--
--  Supabase SQL Editor
--      New query -> paste this whole file -> Run.
--      If Supabase warns about a "destructive operation" (the DROP
--      SCHEMA line), confirm -- it only removes the lab schema.
--
--  DBeaver
--      Open this file in a SQL editor -> Execute SQL Script (Alt+X).
--
--  SHARED DATABASE? If several students use the SAME database, each
--  student must use a different schema: replace every "txn_lab" in
--  this file with a personal name, e.g. s2201001.
-- =====================================================================


-- =====================================================================
--  PART 1 · Fresh schema
-- =====================================================================
DROP SCHEMA IF EXISTS txn_lab CASCADE;
CREATE SCHEMA txn_lab;
SET search_path TO txn_lab;


-- =====================================================================
--  PART 2 · Tables and sample data
-- =====================================================================

-- ---------------------------------------------------------------------
--  1. Banking  (Sections 1–6, 10, Tasks 4–5)
-- ---------------------------------------------------------------------
CREATE TABLE account (
    acc_no   VARCHAR(10)   PRIMARY KEY,
    owner    VARCHAR(50)   NOT NULL,
    balance  NUMERIC(12,2) NOT NULL CHECK (balance >= 0)
);

CREATE TABLE transfer_log (
    log_id     SERIAL        PRIMARY KEY,
    from_acc   VARCHAR(10)   NOT NULL REFERENCES account(acc_no),
    to_acc     VARCHAR(10)   NOT NULL REFERENCES account(acc_no),
    amount     NUMERIC(12,2) NOT NULL CHECK (amount > 0),
    logged_at  TIMESTAMP     NOT NULL DEFAULT now()
);

INSERT INTO account (acc_no, owner, balance) VALUES
    ('A-101', 'Rahim', 1000.00),
    ('B-202', 'Karim', 2000.00),
    ('C-303', 'Jamal', 1500.00),
    ('D-404', 'Nila',   500.00),
    ('E-505', 'Sumi',  3000.00);
-- transfer_log starts empty on purpose (used to observe SERIAL behaviour).


-- ---------------------------------------------------------------------
--  2. Online shop  (Sections 7–9)
-- ---------------------------------------------------------------------
CREATE TABLE product (
    product_id  INT           PRIMARY KEY,
    name        VARCHAR(50)   NOT NULL,
    price       NUMERIC(10,2) NOT NULL CHECK (price > 0),
    stock       INT           NOT NULL CHECK (stock >= 0)
);

CREATE TABLE orders (
    order_id    INT          PRIMARY KEY,
    customer    VARCHAR(50)  NOT NULL,
    order_date  DATE         NOT NULL DEFAULT CURRENT_DATE,
    status      VARCHAR(10)  NOT NULL DEFAULT 'pending'
                CHECK (status IN ('pending', 'confirmed', 'cancelled'))
);

CREATE TABLE order_item (
    order_id    INT           NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id  INT           NOT NULL REFERENCES product(product_id),
    qty         INT           NOT NULL CHECK (qty > 0),
    unit_price  NUMERIC(10,2) NOT NULL CHECK (unit_price > 0),
    PRIMARY KEY (order_id, product_id)
);

INSERT INTO product (product_id, name, price, stock) VALUES
    (1, 'Laptop',     85000.00,   5),
    (2, 'Mouse',        500.00,  50),
    (3, 'Keyboard',    1200.00,  30),
    (4, 'Monitor',    18000.00,   8),
    (5, 'USB Cable',    250.00, 100);

INSERT INTO orders (order_id, customer, order_date, status) VALUES
    (1, 'Rahim', '2026-10-20', 'confirmed'),
    (2, 'Karim', '2026-10-25', 'pending');

INSERT INTO order_item (order_id, product_id, qty, unit_price) VALUES
    (1, 2, 1,   500.00),
    (1, 3, 1,  1200.00),
    (2, 4, 1, 18000.00);


-- ---------------------------------------------------------------------
--  3. Course registration  (Lab Tasks 1–3)
--     course.seats = number of seats still REMAINING
-- ---------------------------------------------------------------------
CREATE TABLE student (
    student_id  INT          PRIMARY KEY,
    name        VARCHAR(50)  NOT NULL,
    dept        VARCHAR(10)  NOT NULL
);

CREATE TABLE course (
    course_code  VARCHAR(10)  PRIMARY KEY,
    title        VARCHAR(60)  NOT NULL,
    credit       NUMERIC(3,1) NOT NULL CHECK (credit > 0),
    seats        INT          NOT NULL CHECK (seats >= 0)
);

CREATE TABLE enrollment (
    student_id   INT          NOT NULL REFERENCES student(student_id),
    course_code  VARCHAR(10)  NOT NULL REFERENCES course(course_code),
    enrolled_at  TIMESTAMP    NOT NULL DEFAULT now(),
    PRIMARY KEY (student_id, course_code)
);

INSERT INTO student (student_id, name, dept) VALUES
    (2201001, 'Ayesha', 'CSE'),
    (2201002, 'Tanvir', 'CSE'),
    (2201003, 'Mitu',   'CSE'),
    (2201004, 'Fahim',  'CSE');

INSERT INTO course (course_code, title, credit, seats) VALUES
    ('CSE 2205',  'Database Management System',           3.0, 30),
    ('CSE 2206',  'Database Management System Sessional', 1.5,  1),
    ('CSE 2201',  'Algorithm Design and Analysis',        3.0,  2),
    ('CSE 2203',  'Numerical Methods',                    3.0, 25),
    ('MATH 2201', 'Linear Algebra',                       3.0,  0);   -- already full

INSERT INTO enrollment (student_id, course_code) VALUES
    (2201001, 'CSE 2201'),
    (2201003, 'CSE 2205');


-- =====================================================================
--  PART 3 · Verify
-- =====================================================================
SELECT 'account'      AS table_name, COUNT(*) AS rows FROM account      UNION ALL
SELECT 'transfer_log',               COUNT(*)         FROM transfer_log UNION ALL
SELECT 'product',                    COUNT(*)         FROM product      UNION ALL
SELECT 'orders',                     COUNT(*)         FROM orders       UNION ALL
SELECT 'order_item',                 COUNT(*)         FROM order_item   UNION ALL
SELECT 'student',                    COUNT(*)         FROM student      UNION ALL
SELECT 'course',                     COUNT(*)         FROM course       UNION ALL
SELECT 'enrollment',                 COUNT(*)         FROM enrollment;

--  Expected:
--   account 5 | transfer_log 0 | product 5 | orders 2 | order_item 3
--   student 4 | course 5       | enrollment 2