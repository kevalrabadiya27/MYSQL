create database `set-example`;

use `set-example`;

create table computer (
	rno int primary key not null,
    name varchar(20)
);

create table electrical (
	rno int primary key not null,
    name varchar(20)
);

insert into computer values
(101, 'ajay'),
(109, 'haresh'),
(115, 'manish');

insert into electrical values
(105, 'ajay'),
(107, 'mahesh'),
(115, 'manish');

-- 1. Display name of students who is either in Computer or in Electrical.
select name from computer 
union 
select name from electrical;

-- 2. Display name of students who is either in Computer or in Electrical including duplicate data.
select name from computer 
union all
select name from electrical;

-- 3. Display name of students who is in both Computer and Electrical.
-- mysql don't have support for INTERSECT, we need to emulate it
select * from 
computer 
inner join
electrical
using(rno);

-- 4. Display name of students who are in Computer but not in Electrical.
select * from computer 
except
select * from electrical;

-- 5. Display name of students who are in Electrical but not in Computer.
select * from electrical 
except
select * from computer;

-- 6. Display all the details of students who are either in Computer or in Electrical.
select * from computer 
union
select * from electrical;

-- 7. Display all the details of students who are in both Computer and Electrical.
select * from computer 
inner join
electrical using(rno);


