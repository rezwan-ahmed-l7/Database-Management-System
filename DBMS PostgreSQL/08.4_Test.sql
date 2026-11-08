CREATE TABLE product (
    product_id  INT           PRIMARY KEY,
    name        VARCHAR(50)   NOT NULL,
    price       NUMERIC(10,2) NOT NULL CHECK (price > 0),
    stock       INT           NOT NULL CHECK (stock >= 0)
);

INSERT INTO product (product_id, name, price, stock) VALUES
    (1, 'Laptop',     85000.00,   5),
    (2, 'Mouse',        500.00,  50),
    (3, 'Keyboard',    1200.00,  30),
    (4, 'Monitor',    18000.00,   8),
    (5, 'USB Cable',    250.00, 100);

--- Solve ---

begin;

update product
set stock = stock + 5
where product_id = 5;

savepoint s1;

update product
set stock = stock + 15
where product_id = 5;

savepoint s2;

update product
set stock = stock - 8
where product_id = 5;

savepoint s3;

update product
set stock = stock + 20
where product_id = 5;

rollback to savepoint s3;
rollback to savepoint s2;
rollback to savepoint s1;

select * from product;
commit;
