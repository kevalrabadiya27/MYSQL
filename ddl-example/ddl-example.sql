create database `ddl-example`;

use `ddl-example`;

create table student (
	enrno varchar(50) primary key not null,
    name varchar(25),
    cpi decimal(8,2),
    dob datetime
);

-- 1. Add two more columns City VARCHAR (20) NULL and Backlog INT NOT NULL.
alter table student add city varchar(20) null;
alter table student add backlog int not null;

-- 2. Change the size of NAME column of student from VARCHAR (25) to VARCHAR (35).
alter table student modify name varchar(35);

-- 3. Change the data type DECIMAL to INT in CPI Column.
alter table student modify cpi int;

-- 4. Rename Column Enrollment No to ENO.
alter table student rename column enrno to eno;

-- 5. Delete Column City from the STUDENT table.
alter table student drop column city;

-- 6. Change name of table STUDENT to STUDENT_MASTER.
alter table student rename student_master;

-- 7. Remove Column Backlog from the table.
alter table student_master drop column backlog;

-- 8. Change Constraint of Name Column from NULL to NOT NULL.
alter table student_master modify name varchar(50) not null;

-- 9. Rename Column dob to BDate.
alter table student_master rename column dob to BDate;

-- 10. Change the datatype of ENO Column from VARCHAR (20) to VARCHAR (12)
alter table student_master modify eno varchar(12);
