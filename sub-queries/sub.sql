create database `sub-query`;

use `sub-query`;

create table student
(
    rno int primary key not null,
    name varchar(50),
    city varchar(50),
    did int,
    foreign key (did) references department(did) on delete cascade
);

create table academic
(
    rno int,
    spi decimal(3, 1),
    bklog int,
    foreign key (rno) references student(rno) on delete cascade
);

create table department
(
    did int primary key not null,
    dname varchar(20)
);



-- 1. Display details of students who are from computer department.
select * from student where did = (
	select did from department where dname = 'computer'
);

-- 2. Display name of students whose SPI is more than 8.
select * from student where rno in (
	select rno from academic where spi > 8
);

-- 3. Display details of students of computer department who belongs to Rajkot city.
select * from student where did = (
	select did from department where dname = 'computer'
) and city = 'rajkot';

-- 4. Find total number of students of electrical department
select count(*) total_elec_stud from student where did = (
	select did from department where dname = 'electrical'
);

-- 5. Display name of student who is having maximum SPI.
select * from student where rno = (
	select rno from academic order by spi desc limit 1
);

-- 6. Display details of students having more than 1 backlog.
select * from student where rno in (
	select rno from academic where bklog > 1
);

-- 7. Display name of student who is having second highest SPI.
select * from student where rno = (
	select rno from academic where spi < (
		select spi from academic order by spi desc limit 1
    ) order by spi desc limit 1
);

-- 8. Display name of students who are either from computer department or from mechanical department.
select * from student where did in (
	select did from department where dname in('computer', 'mechanical')
);

-- 9. Display name of students who are in same department as 102 studying in.
select * from student where did = (
	select did from student where rno = 102
);

-- 10. Display name of students whose SPI is more than 9 and who is from electrical department.
select * from student where rno in (
	select rno from academic where spi > 9 
) and did = (
	select did from department where dname = 'electrical'
);

-- 11. find details of student having 4th highest spi
select * from student where rno = (
	select rno from academic order by spi desc limit 3, 1
)
-- limit 3,1 => skip first 3 then select 1

