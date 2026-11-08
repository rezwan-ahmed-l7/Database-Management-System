insert into orders (order_id, customer)
values (3, 'Rakib');

begin;

insert into order_item(order_id, product_id, qty, unit_price)
values (3, 1, 1, 85000);

update product
set stock = stock-1
where product_id = 1;

savepoint laptop

insert into order_item(order_id, product_id, qty, unit_price)
values (3, 2, 50, 2000);

update product
set stock = stock-50
where product_id = 2;

insert into order_item(order_id, product_id, qty, unit_price)
values (3, 2, 50, 2000);

savepoint mouse
release laptop

update product
set stock = stock-50
where product_id = 2;

rollback to savepoint laptop;
rollback to savepoint mouse;