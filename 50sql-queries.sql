#TECHBEAMERS.COM
# https://techbeamers.com/sql-query-questions-answers-for-practice/
CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
select * from worker;
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
select * from bonus;
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
select * from title;
select * from worker;
select * from bonus;
 
#Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct department from worker;

#Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select substring(first_name,1,3) from worker;

#Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct length(department) as length_of_department from worker; 

#Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select replace (first_name,'a','A')from worker;

 #Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
 select * from worker order by first_name asc;
 
 #Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
 select * from worker order by first_name asc ,department desc;
 
 #Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
 select * from worker where first_name in('vipul','satish');
 
 #Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
 select * from worker where first_name not in('vipul','satish');
 
 #Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
 select * from worker where department like 'admin%';
 
#Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from worker where first_name like '%a%';
 
 #Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
  select * from worker where first_name like '%a';

#Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
Select * from Worker where FIRST_NAME like '_____h';

#Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker where salary between 100000 and 500000;

 #Write an SQL query to print details of the Workers who have joined in Feb’2014.
 select * from worker where year(joining_date) = '2014' and month(joining_date) = 2;
 
 #Write an SQL query to fetch the count of employees working in the department ‘Admin’.
 select count(*) as emp_work_in_dept from worker where department = 'admin';
 
#Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select first_name,last_name,salary from worker where salary between 50000 and 100000;

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000); 


#Write an SQL query to fetch the no. of workers for each department in the descending order.
select first_name,department,count(worker_id) as workerid from worker
group by department order by workerid;

#Write an SQL query to print details of the Workers who are also Managers.
select w.worker_id,w.first_name,w.salary,t.worker_title from worker w
join title t
on w.worker_id = t.worker_ref_id
where worker_title = 'Manager';

#Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select worker_ref_id,worker_title from title 
group by worker_title having count(*) > 1;

#Write an SQL query to show only odd rows from a table.
select * from worker where mod(worker_id,2)<>0;

#Write an SQL query to show only even rows from a table.
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0;

select curdate();

#Write an SQL query to show the top n (say 10) records of a table.
select * from worker order by salary desc limit 5;

#ORACLE
#SELECT * FROM (SELECT * FROM Worker ORDER BY Salary DESC)
#WHERE ROWNUM <= 10;
#Write an SQL query to determine the nth (say n=5) highest salary from table

#Write an SQL query to determine the 5th highest salary without using TOP or limit method.
#The following query is using the correlated subquery to return the 5th highest salary:
select salary from worker w1 
where 3 = (select count(distinct(w2.salary))
from worker w2
where w2.salary  >= w1.salary);


SELECT Salary
FROM Worker W1
WHERE n-1 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 );
 
select * from worker;

#Write an SQL query to fetch the list of employees with the same salary.
select distinct w.worker_id,w.first_name,w.salary
from worker w, worker w1
where w.salary = w1.salary
and w.worker_id != w1.worker_id;

#Write an SQL query to show the second highest salary from a table.
select first_name,max(salary) from worker where salary < (select max(salary) from worker);

#Write an SQL query to show one row twice in results from a table.
select first_name,department from worker W where w.department = 'HR'
union all
select first_name,department from worker W1 where w1.department = 'HR';

#Write an SQL query to fetch the first 50% records from a table.
select * from worker 
where worker_id <= (select count(worker_id)/2 from worker);

select * from title;
select * from worker;
select * from bonus;
#Write an SQL query to fetch the departments that have less than five people in it.
select department, count(worker_id) as no_of_worker from worker group by department having count(worker_id) <5;

#Write an SQL query to show all departments along with the number of people in there.
select department as no_of_dept, count(worker_id) as workerid from worker
group by department order by worker_id;

#Write an SQL query to show the last record from a table.
select * from worker where worker_id = (select max(worker_id) from worker);

#Write an SQL query to fetch the first row of a table.
select * from worker where worker_id = (select min(worker_id)from worker);

#Write an SQL query to fetch the last five records from a table.
select worker_id,first_name,department from worker where worker_id <=5;

#Write an SQL query to print the name of employees having the highest salary in each department.
select first_name, max(salary) as salary, department from worker group by department;

#Write an SQL query to fetch three max salaries from a table.
select distinct salary from worker a where 3>= (select count(distinct salary)from worker b where a.salary <= b.salary)order by a.salary desc;

#Write an SQL query to fetch three min salaries from a table.
select distinct salary from worker a where 3>= (select count(distinct salary) from worker b where a.salary >= b.salary)order by a.salary desc;

 #Write an SQL query to fetch departments along with the total salaries paid for each of them.
 select department, sum(salary) from worker group by department;
 
#Write an SQL query to fetch the names of workers who earn the highest salary.
select first_name,salary from worker where salary = (select max(salary) from worker);













