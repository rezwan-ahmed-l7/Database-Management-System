DROP SCHEMA University CASCADE;

CREATE SCHEMA University;

create table Student(
    ID serial primary key,
    Name varchar(50) not null,
    Department char(3),
    Result numeric(3,2)
);

insert into Student(Name, Department, Result)
values
('Rezwan', 'CSE', 3.50),
('Sacchay', 'CSE', 3.70),
('Avoy', 'CSE', 3.60),
('Udoy', 'CSE', 5.00),
('Taokir', 'CSE', 3.50);

select * from Student;

alter table Student
    add Phone VARCHAR(11) DEFAULT 'NA',
    add City VARCHAR(50) default 'NA';

alter table Student drop column Phone, drop column City;

DROP TABLE Student;
