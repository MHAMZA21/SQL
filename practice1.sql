DROP TABLE IF EXISTS department;
CREATE TABLE department(
    did varchar(20),
    name varchar(20) NOT NULL,
    CONSTRAINT PK_DEPT PRIMARY KEY(did)
);


INSERT INTO department VALUES
('D1', 'Management'),
('D2', 'IT'),
('D3', 'Sales'),
('D4', 'HR')

select * from department;
drop table if exists employee;
## DATA QUERY LANGUAGE
create TABLE employee (
    eid int,
    name varchar(20) UNIQUE,
    join_date date NOT NULL,
    department char(2) CHECK (department IN ('D1', 'D2', 'D3')),
    salary int,
    manager int,
    CONSTRAINT PK_ID PRIMARY KEY(eid),
    CONSTRAINT FK_DID FOREIGN KEY(department) 
    REFERENCES department(did)
);


INSERT INTO employee VALUES
(101, 'David', '2009-07-14', 'D1', 50000, NULL),
(102, 'Sam', '2010-06-24', 'D1', 40000, 101),
(103, 'Alicia', '2011-05-11', 'D2', 30000, 102),
(104, 'Alex', '2012-04-15', 'D2', 20000, 102),
(105, 'Robbi', '2013-08-14', 'D2', 20000, 102),
(106, 'Jack', '2014-09-19', 'D3', 8000, 101),
(107, 'Tom', '2015-11-12', NULL, 5000, 116),
(108, 'Lily', '2016-07-28', 'D1', 1000, 106);

select * FROM employee;

DROP TABLE IF EXISTS project;

create table project(
person varchar(20),
proj_name varchar(20),
job_description varchar(100));



insert into project values
('David', 'Ecommerce', 'generate and manage sales via online channels'),
('Sam', 'Inventory', 'manage location and pricing of inventory'),
('Alicia', 'Inventory', 'manage products that are in storage or transit'),
('Ryan', 'Ecommerce', 'advertising and marketing efforts of a company'),
('Ellen', 'Inventory', 'manage overall operations and help employees');

select * from project;

DROP TABLE IF EXISTS sale;
CREATE TABLE sale (
    category varchar(20),
    brand varchar(20),
    name varchar(50) NOT NULL,
    quantity int CHECK (quantity >= 0),
    price float NOT NULL,
    stock boolean,
    CONSTRAINT PK_CITY PRIMARY KEY(name)
);


INSERT INTO sale VALUES
('Phone', 'Apple', 'iPhone 13', 4, 1300, '0'),
('Phone', 'Apple', 'iPhone 12', 6, 1100, '1'),
('Phone', 'Samsung', 'Galaxy Note 20', 5, 1200, '1'),
('Phone', 'Samsung', 'Galaxy S21', 4, 1100, '0'),
('Laptop', 'Apple', 'MacBook Pro 13', 3, 2000, '1'),
('Laptop', 'Apple', 'MacBook Air', 2, 1200, '1'),
('Laptop', 'Dell', 'XPS 13', 1, 2000, '0'),
('Laptop', 'Dell', 'XPS 15', 2, 2300, '1'),
('Tablet', 'Apple', 'ipad 7th gen', 3, 560, '0'),
('Tablet', 'Samsung', 'Galaxy Tab A7', 2, 220, '1');

select * from sale;

drop table if exists Backup;
create table Backup as
select * from employee;

select * from Backup;
select * from employee;

drop table if exists Replica;

create table Replica as 
select * from employee
where 1=2;


## UPDATE THE TABLE 
## UPDATE TABLE_NAME SET COLUMN1 = 'NEW VALUE'
## WHERE COLUMN2 = 'VALUE';

##update manager of tom
update employee
SET manager = 110
where name = 'Tom';

select * from employee;

## Update department and salary of lily
update employee
set department = 'D3', salary = 5000
where name = 'Lily';

#update employee



## Delete lily record
delete from Backup
where name = 'Lily';

select * from Backup;

## Delete alex and robbi record
delete from Backup
where name in('Alex','Robbi');

## TRUNCATE
## It is used to delete all the records from the table

##Drop 
drop table backup;

## Alter 
## modify structure of the existing table. it is used to rename the a table
## Rename a table
## alter table_name rename new_table_name

select * from sales;
DROP TABLE IF EXISTS sales;
alter table sale
rename to sales;

select * from sales;

## 2 
## Rename a column
## Alter table table_name rename column 
## column_name to new_column_name


## rename dep to dept?
select * from employee;
alter table employee rename column manager to managers;
select * from employee;

##3
## Modify column data type
## alter table table_name alter column column_name type datatype;

## Alter salary column data type?
## alter table employee 
## alter column dept type varchar(2);

##4
## add new column 
## alter table table_name add column column_name datatype;

##Add new column Gender?
alter table employee
add column Gender char(1);

select * from employee;
## 5
## Add constriants 
##alter table table_name add
## constraints constraints_name
## constraints (column_name);

alter table employee
add constraint gen check (gender in ('F','M'));

## Remove gen constriants
alter table employee
drop constraint gen;

## Remove columns
#Remove Gender columns
alter table employee
drop column gender;

select * from employee;




### DATA CONTROL LANGUAGE
## GRANT
## Grant select privilege to the user in a table
## granting more than one table in a table
## DCL (Data Control Language)
#GRANT
#Granting SELECT Privilege to a User in a Table
#Granting more than one Privilege to a User in a Table
#Granting All the Privilege to a User in a Table
#Granting a Privilege to all Users in a Table
#REVOKE
#Revoking SELECT Privilege to a User in a Table
#Revoking more than Privilege to a User in a Table
#Revoking All the Privilege to a User in a Table
#Revoking a Privilege to all Users in a Table


### TCL Transaction control language
##BEGIN 
##
select * from employee;
select * from department;

select E.name, D.name as departments
from employee E
inner join department D
on E.department = D.did
where D.name = 'IT';

select * from project;
select * from employee;
select * from department;

##OPERATORS
## fetch three employee who earn more than 10000;
select name,department,salary from employee
where salary >=10000
limit 3;


select name,department, max(salary) as maximum_salary from employee;

##Fetch products in stock with price range 1000 to 1500
select * from sales;

##Fetch products in stock with price range 1000 to 1500

select brand,quantity,price,stock from sales
where price between 1000 and 1500
and 
stock in ('1')
order by name desc;


## Fetch employee not in deparment D2 and name either starts with
#j or not end with y?


select name,department from employee
where department not in ('D2')
and (name like ('j') or name not like('%y'));

##### Date and String functions
## Function name EXTRACT

## Fetch employee data who join on april
select * from employee
where extract(month from join_date) = '04';

## Function name TO CHAR

##Fetch todays date?
select curdate()
as todays_date;

select * from sales;

## Function name DISTINCT
## Fetch all brands in sales table

select distinct brand from sales;

select * from employee;

#### CASE STATEMENTS
### Categories employees based on their salary

select name,salary,
case when salary >= 30000 then 'high'
when salary between 10000 and 30000 then 'mid'
when salary < 10000 then 'low' 
end as result
from employee 
order by 2;   ### 2 means low then mid then high


### Function name UNION

## Fetch employees from management and involve on project
select * from employee;
select * from project;


##Fetch employees from Management & involve on projects?
select name from employee
where department = 'D1'
union 
select person from project;

### Fetch only employees who work on projects
##Fetch only employees who work on projects
select E.name as Name
from project P
inner join employee E
on E.name = P.person;
##  OR
## IN MYSQL WE CAN NOT USE INTERSECT SO WE USE IN FUNCTION.
select employee.name
from employee
where employee.name in (select project.person from project);

## Except function in mysql	
## Fetch person who is not an employee but work on project

select * from employee;
select * from project;

#select person from project
#not in
#select name from employee;


### JOIN STATEMENTS
##Inner join
## Fetch all IT employees name wrt their department


select * from project;

select * from department;
select * from employee;

## Fetch all IT employees name wrt their department
select E.name,D.name as department
from employee E
inner join department D
on E.department = D.did
where D.name = 'IT';

select * from department;
select * from employee;


## Fetch all IT employees name wrt their department

select E.name as Employee_name,D.name as Dept,E.salary as salary
from employee E
inner join department D
on E.department = D.did
where d.name = 'Management';

#Fetch all IT employees name wrt their department

select E.name,E.salary,D.did as Employee_Details
from employee E
inner join department D
on E.department = D.did
where d.name = 'IT';


### Left Joins
select * from department;
select * from employee;
select * from project;
select * from sales;
## Fetch all projects name with resprected employee name?
## project P in table 1 because we need all project 

select E.name as Name,P.proj_name as Project_Name
from project P
left join employee E
on E.name = P.person;


## is me employee project name wale saree records ayengay 
#likin jo common employee h unke name bhi ayengay.

### RIGHT JOINS

select * from employee;
select * from project;

select E.name,P.proj_name
from project P
right join employee E
on E.name = P.person;

##right join me right join likhne ke badd wale table yani employee 
# ke saree records ayengay likin common project name ayengay

### Full Joins
## Fetch all employee with their correlated projects?
##
 
#select E.name,P.proj_name 
#from project P
#full join employee e
#on E.name = P.person



### CREATE ADVANCED TABLE
create table advance
(bonus int);

insert into advance values(500);
select * from advance;


## Cross Joins 
select * from employee;
## Give 500 bonus for all employees?
select E.name,E.salary,A.bonus,(E.salary + A.bonus) as Net_salary
from employee E
cross join advance A;

select E.name,E.salary,E.join_date,A.bonus,(E.salary+A.bonus) as Net_salary
from employee E
cross join advance A;

### SELF JOIN
### Fetch all employee name with their manager?

select * from employee;
select * from project;


select M.name,E.salary 
from employee E, employee M
where E.eid <> M.eid
and E.salary = M.salary
order by E.salary;



### CONCATINATE JOINS
## 
##SELECT DISTINCT (LOWER(E.name)||'.
#'||LOWER(SUBSTRING(D.name, 0, 6))||'@tcs.in')
#AS Email, E.name 
#AS Emp_name, D.name 
#AS Department
#FROM employee E
#JOIN department D 
#ON D.did = E.dept;

select * from employee;




#### AGGREGATE FUNCTION
#### COUNT, MIN, MAX, AVG, SUM

## fetch total employee,min,max,average and total salary
## of each dept which have less than 3 employee?

select * from employee;
select * from department;

select D.name, count(1) as No_emp,
min(E.salary) as Min,
max(E.salary) as Max,
avg(E.salary) as Average,
sum(E.salary) as Total
from employee E
join department D 
on D.did = E.department
group by D.name
having count(1) < 3;



## fetch total employee,min,max,average and total salary
## of each dept which have less than 3 employee?

##### SUB QUERIES
## SCALAR SUB QUERY

select * from employee;
## Fetch name,salary of employees who earn more than average of total salary?

select name,salary from employee 
where (salary) > (select avg(salary) from employee);

select * from department;

### MULTIROW SUB QUERY
## Find department which do not have any employee

select * from department
where did not in
(select distinct(department)from employee
where department is not null);


### Employee who earn highest salary in each department?
select name,salary,department from employee
where (department,salary) in
(select department, max(salary)from employee
group by department);



### COORELATED SUB QUERY
## Find the employees in each department who earn more than the average salary
## in that department?

select * from employee;

select name,department,salary 
from employee E1
where salary >
(select avg(salary)from employee E2
where E2.department = E1.department);


#### NESTED SUB QUERY
## Find brand which sales are better than the average of total sales across all brands?

SELECT *
FROM (
    SELECT brand, SUM(price) AS Total_Sales
    FROM sales
    GROUP BY brand) sales
    JOIN (
        SELECT AVG(Total_Sales) AS SALES
        FROM (
            SELECT brand, SUM(price) AS Total_Sales
            FROM sales
            GROUP BY brand) X
         ) AVG_SALES
    ON SALES.Total_Sales > AVG_SALES.Sales;

## Find brand which sales are better than the average of total sales across all brands?
select * from
(select brand,sum(price)as total_sales from sales
group by brand) sales join
(select avg(total_sales)as sales
from(select brand,sum(price)as total_sales from sales group by brand)X
)avg_sales on sales.total_sales > avg_sales.sales;



show databases;







