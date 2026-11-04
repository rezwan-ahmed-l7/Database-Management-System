select * from account;
select sum(balance) from account;

begin;

update account
set balance = balance + 500;

update account
set balance = balance - 500;

update account
set balance = 0;

commit;
rollback;

select * from account
where acc_no in ('A-101', 'B-202');

begin;

update account
set balance = balance - 500
where acc_no = 'A-101';

update account
set balance = balance + 500
where acc_no = 'B-202';

commit;
rollback;


insert into orders (order_id, customer)
values (3, 'Rakib');

begin;

insert into order_item (order_id, product_id, qty, unit_price)
values (3, 1, 1, 85000);

update product
set stock = stock - 1
where product_id = 1;

savepoint laptop;

insert into order_item (order_id, product_id, qty, unit_price)
values (3, 2, 50, 2000);

update product
set stock = stock - 50
where product_id = 2;

rollback to savepoint laptop;
commit;