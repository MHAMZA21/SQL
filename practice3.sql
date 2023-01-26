drop table if exists department;
create table department(
did varchar(20),
name varchar(20) not null,
constraint pk_dept primary key(did)
);

insert into department values
('D1','Management'),
('D2','IT'),
('D3','Sales'),
('D4','HR');

select * from department;

drop table if exists employee;
create table employee
(eid int,
name varchar(20)unique,
join_date date not null,
department char(2) CHECK (department IN ('D1', 'D2', 'D3')),
salary int,
salary int,
manager int,

)
