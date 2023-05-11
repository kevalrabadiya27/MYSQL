create database `join-example`;

use `join-example`;

create table student
(
	rno int primary key not null,
    name varchar(50) not null,
    branch varchar(50) not null
);

create table result 
(
	rno int,
    spi int not null,
    foreign key (rno) references student(rno)
);

create table employee
(
	empno varchar(20) primary key not null,
    name varchar(25) not null,
    managerno varchar(20) null
);

create table city
(
    id int primary key not null,
    name varchar(30),
    pincode varchar(20),
    remarks varchar(25)
);

create table village
(
    id int primary key not null,
    name varchar(30),
    cityid int,
    foreign key (cityid) references city(id) on delete cascade
);

-- 1. Combine information from student and result table using cross join or Cartesian product.
select student.rno, name, branch, spi from student, result where student.rno = result.rno;
select * from student cross join result where student.rno = result.rno;

-- 2. Display Rno, Name, Branch and SPI of CE branch’s student only.
select rno, name, branch, spi from
student
inner join
result
using(rno) where branch = 'ce';

-- 3. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
select rno, name, branch, spi from
student
inner join
result
using(rno) where branch <> 'ec';

-- 4. Display average result of each branch.
select branch, avg(spi) avg_result_branch_wise from
student
inner join
result
using(rno)
group by branch;

-- 5. Display average result of each branch and sort them in ascending order by SPI.
select branch, avg(spi) avg_result_branch_wise from
student
inner join
result
using(rno)
group by branch
order by avg(spi);

-- 6. Display average result of CE and ME branch.
select branch, avg(spi) avg_result_branch_wise from
student
inner join
result
using(rno)
where branch in('ce', 'me')
group by branch;

-- 7. Perform the left outer join on Student and Result tables.
select * from
student
left join
result
using(rno);

-- 8. Perform the right outer join on Student and Result tables.
select * from
student
right join
result
using(rno);

-- 9. Perform the full outer join on Student and Result tables.
select * from
student
full join
result
using(rno);

-- 10. Retrieve the names of employee along with their manager’s name from the Employee table.
select e.name, m.name from 
employee as e
inner join
employee as m
on e.managerno = m.empno;


-- 1. Display all the villages of Rajkot city.
select v.name village, c.name city from 
city as c 
inner join
village as v
on c.id = v.cityid
where c.name = 'rajkot';

-- 2. Display city along with their villages & pin code.
select c.name city, v.name village, c.pincode from
city as c
inner join 
village as v
on c.id = v.cityid;

-- 3. Display the city having more than one village.
select c.name city from
city as c
inner join 
village as v
on c.id = v.cityid
group by city having count(*) > 1;


-- 4. Display the city having no village.
select c.name city from
city as c
left join 
village as v
on c.id = v.cityid
group by city having count(v.id) = 0 ;


-- 5. Count the total number of villages in each city.
select c.name city, count(v.id) from 
city as c
left join
village as v
on c.id = v.cityid
group by city;

-- 6. Count the number of cities having more than one village.
select c.name city, count(v.id) numbre_of_villages from 
city as c
left join
village as v
on c.id = v.cityid
group by city having count(v.id) > 1;

