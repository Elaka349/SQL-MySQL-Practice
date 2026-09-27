-- database
create database stores;
use stores;

-- employee table
create table employees(
e_id int primary key auto_increment,
e_name varchar(100),
salary int,
dept_id int,
manager_id int
);

-- auto increment starts from 101
alter table employees auto_increment=101;

-- insert employees
insert into employees(e_name,salary,dept_id,manager_id)
values
("arun",45000,1,103),
("priya",38000,2,103),
("karthik",60000,1,null),
("dhivya",42000,3,101),
("rahul",35000,2,103);


-- department table
create table dept(
d_id int primary key auto_increment,
d_name varchar(100),
location varchar(100)
);

-- auto increment starts from 1
alter table dept auto_increment=1;

-- insert departments
insert into dept(d_name,location)
value
("it","chennai"),
("hr","bangalore"),
("core","coimbatore"),
("sales","hyderabad");


-- select employees
select * from employees;

-- select department
select * from dept;


-- project table
create table project(
p_id int primary key auto_increment,
p_name varchar(100),
e_id int
);

-- auto increment starts from 201
alter table project auto_increment=201;

-- insert projects
insert into project(p_name,e_id)
values
("banking app",101),
("hr portal",102),
("weather system",104),
("finance app",103);


-- select project
select * from project;

-- select employees
select * from employees;

-- select department
select * from dept;


-- inner join
select e_name,d_name
from employees
inner join dept
on dept_id=d_id;


-- inner join + where
select e_name,salary,d_name
from employees
join dept
on d_id=dept_id
where salary>40000;


-- inner join + order by
select e_name,d_name,salary
from employees
inner join dept
on d_id=dept_id
order by salary desc;


-- left join
select d_name,e_name
from dept
left join employees
on d_id=dept_id;


-- select employees
select * from employees;


-- self join
select a.e_name as "employees",
b.e_name as "manager"
from employees a
inner join employees b
on a.e_id=b.manager_id;


-- select department
select * from dept;

-- select employees
select * from employees;