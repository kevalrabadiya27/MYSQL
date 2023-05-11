--  Basic DDL

show databases;

create database if not exists temp;

use temp;

create table student (
	id int primary key,
    name varchar(255)
);

show tables;

insert into student values (1, "uttam");

select * from student;

drop database if exists temp;

-- Example

create database if not exists org;

use org;

create table worker (
	id int not null primary key auto_increment,
    fname varchar(255),
    lname varchar(255),
    salary int,
    joining_date datetime,
    department varchar(255)
);

create table bonus (
	worker_ref_id int,
    bonus_amount int,
    bonus_date datetime,
    foreign key (worker_ref_id) 
		references worker(id)
		on delete cascade
);

create table title (
	worker_ref_id int,
    worker_title varchar(255),
    affected_from datetime,
    foreign key (worker_ref_id)
		references worker(id)
        on delete cascade
);

insert into worker 
values
(1, "uttam", "patel", 10000, "14-02-22", "HR"),
(2, "rohan", "patel", 7000, "16-04-22", "it"),
(3, "jaydeep", "patel", 9000, "14-05-22", "iot"),
(4, "kunj", "patel", 11000, "10-07-22", "devops"),
(5, "keval", "patel", 12000, "02-10-22", "admin"),
(6, "dhrumil", "patel", 11000, "10-07-22", "devops"),
(7, "jay", "patel", 11000, "10-07-22", "iot"),
(8, "pulin", "patel", 11000, "10-07-22", "HR");

insert into bonus
values
(1, 5000, "16-04-22"),
(2, 1500, "16-04-22"),
(5, 1000, "16-04-22");

insert into title
values
(1, "manager", "15-07-22"),
(2, "developer", "15-07-22"),
(3, "iot expert", "15-07-22"),
(4, "devops engineer", "15-07-22"),
(5, "admin", "15-07-22");

select salary, fname from worker;

-- DUAL tables, which can use select without using from keyword
select 55+11;
select now();
select ucase();

select * from worker
where salary > 8000;

-- and, or, not, not in, in, between, is null, is not null
-- pattern matching with % and _, (% use for any number of character, _ used for only one character)

-- sort using order by
select * from worker order by salary; -- default asc
select * from worker order by salary desc;

-- distinct
select distinct salary from worker;

-- grouping (group by)
-- used with aggregation functions like count, sum, avg, min, max

select department, count(*) as total_emp, avg(salary) as avg_salary, min(salary) as min_salary, max(salary) as max_salary, sum(salary) as total_salary from worker group by department;

-- group by with (having)
select department, count(department) from worker group by department having count(department) > 1; 

-- DDL constraints

create table account (
	id int primary key,
    name varchar(255) unique,
    balance int not null default 0,
    constraint acc_balance_chk check(balance > 1000)
);

insert into account 
values
(1, 'A', 1001),
(2, 'A', 1001);

-- alter table

use temp;

create table if not exists account (
	id int primary key,
    name varchar(255) unique,
    balance int not null default 0
);

-- add new column
alter table account add interest float not null default 0;

-- modify datatype
alter table account modify interest double not null default 0;

desc account;

-- change column | rename coulumn
alter table account change column interest saving_interest float not null default 0;

-- drop column
alter table account drop column saving_interest;

-- rename table
alter table account rename to account_details;

-- CRUD

create table customer (
	id int primary key,
    cname varchar(255),
    address varchar(255),
    gender varchar(255),
    city varchar(255),
    pincode int
);

-- insert record (create)
insert into customer values (1, "codehelp", "delhi", 'male', 'delhi', 656545);

-- read
select * from customer;

-- update
update customer
set cname='jsm' where id = 1;

-- delete
delete from customer
where id = 1;

-- on delete cascade, on delete null

create table if not exists order_details (
	id int primary key,
    delivery_date date,
	cust_id int,
    foreign key (cust_id) 
			references customer(id) 
			on delete cascade
			-- on delete set null
);

insert into order_details
values (1, '11-03-19', 1);

delete from customer where id = 1;

-- replace
-- if data exists it replace it with new data
-- if data not exists it act as insert command

replace into customer (id, city) values (1251, 'colony');

replace into customer set id = 1300, cname = 'Mac', city = 'Utah';

replace into customer(id, cname, city)
	select id, cname, city from customer where id = 500;
    
    
-- set operations

create table if not exists dept1 (
	id int primary key,
    name varchar(255),
    role varchar(255)
);

create table if not exists dept2 (
	id int primary key,
    name varchar(255),
    role varchar(255)
);	

insert into dept1
values (1, 'a', 'engineer'),
		(2, 'b', 'salesman'),
		(3, 'c', 'manager'),
		(4, 'd', 'salesman'),
		(5, 'e', 'engineer');
        
insert into dept2
values (3, 'c', 'manager'),
		(6, 'f', 'marketing'),
		(7, 'g', 'salesman');
        
-- list out all the employees in the company
select * from dept1
union 
select * from dept2;
        
-- list all the employees who works in all the departments
-- INTERSECT
-- we need to emulate intersect keyword
select d1.* from dept1 as d1
inner join
dept2 as d2
using(id);

-- list out all the employees working in dept1 but not in dept2
-- MINUS
-- we need to emulate minus keyword
select d1.* from dept1 as d1
left join
dept2 as d2
using(id)
where d2.id is null;

-- sub queries

-- views

-- create view
create view dept1_view as select id, name from dept1;
select * from dept1_view;

-- alter view 
alter view dept1_view as select name, role from dept1;

-- drop view
drop view if exists dept1_view;