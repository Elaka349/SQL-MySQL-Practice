-- group by and having practice

use stores;


-- drop old employees table
drop table employees;


-- create employees table
create table employees(
e_id int primary key auto_increment,
e_name varchar(100),
dept varchar(50),
salary int
);


-- start employee id from 101
alter table employees auto_increment=101;


-- insert employees
insert into employees(e_name,dept,salary)
values
("arun","it",50000),
("priya","hr",40000),
("karthik","it",60000),
("dhivya","finance",45000),
("rahul","it",55000),
("sneha","hr",35000),
("vijay","finance",50000),
("arun","hr",45000),
("rohit","finance",55000),
("meena","it",60000);


-- select all employees
select * from employees;


-- group by
select dept,count(dept) as "total count"
from employees
group by dept;


-- group by + having
select dept,count(dept) as "total count"
from employees
group by dept
having count(dept)>3;


-- group by + sum + having
select dept,sum(salary) as "total salary"
from employees
group by dept
having sum(salary)>150000;


-- select all employees
select * from employees;


-- group by + average + having
select dept,avg(salary) as "average_salary"
from employees
group by dept
having avg(salary)>50000;


-- group by + count + having
select dept,count(dept) as "count"
from employees
group by dept
having count(dept)>=3;


-- where + group by + having
select dept,count(dept) as "total_count"
from employees
where salary>45000
group by dept
having count(dept)>2;


-- select all employees
select * from employees;


-- group by + minimum salary + having
select dept,min(salary) as "min_salary"
from employees
group by dept
having min(salary)>35000;


-- group by + maximum salary + having
select dept,max(salary) as "max_salary"
from employees
group by dept
having max(salary)>50000;


-- select all employees
select * from employees;


-- group by + average + count + having
select dept,
avg(salary) as "average_salary",
count(dept) as "count of employee"
from employees
group by dept
having avg(salary)>45000;