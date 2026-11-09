drop database pharmacy with(force);
create database pharmacy;
drop table MEDICINES;
drop table MEDICINE_STOCK;

select * from MEDICINES;

--- 1(1)

create table MEDICINES(
    med_id int primary key,
    med_name varchar(30) not null,
    catagory varchar(20),
    unit_price numeric(8,2),
    stock int check(stock >=0)
);

insert into MEDICINES
values
(104, 'Azithromycin 500mg', 'Antibiotic', 35.00, 120),
(105, 'Fexofenadine 120mg', 'Antihistamine', 9.00, 200),
(106, 'Cefixime 200mg', 'Antibiotic', 28.50, 80);

--- 1(2)

--- a
alter table MEDICINES
add column expiry_date date;

--- b
alter table MEDICINES
rename column unit_price to price;

--- c
alter table MEDICINES
alter column catagory type varchar(40);

--- d
alter table MEDICINES
drop column expiry_date;

alter table MEDICINES rename TO MEDICINE_STOCK;
alter table MEDICINE_STOCK rename TO MEDICINES;

----- 2(1)

--- a
select count(*), sum(stock)
from MEDICINES
group by catagory;

--- b
select avg(price)
from MEDICINES
group by catagory
having avg(price) > 5;

--- c
select min(price), max(price)
from MEDICINES;

----- 2(3)

--- a
begin;

update MEDICINES
set stock = stock + 40
where med_id = 104;

savepoint s1;

----- b
update MEDICINES
set stock = stock - 25
where med_id = 104;

savepoint s2;

----- c
update MEDICINES
set stock = stock + 100
where med_id = 104;

---- d
rollback to savepoint s2;

select stock from MEDICINES;

--- e
rollback to savepoint s1;

select stock from MEDICINES;

--- f
commit;

select * from MEDICINES
where med_id = 104;

