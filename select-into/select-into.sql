create database `select-into-example`;

use `select-into-example`;

create table cricket
(
    name varchar(50) not null,
    city varchar(50) not null,
    age int not null
);

select * from cricket;

-- 1. Create table World cup from cricket with all the columns.
create table worldcup as select * from cricket;

-- 2. Create table T20 from cricket with first two columns with no data.
create table t20 as select name, city from cricket where 1 = 0;
select * from t20;

-- 3. Create table IPL From Cricket with No Data
create table ipl as select * from cricket where 1 = 0;

-- 4. Insert the Data into IPL from Cricket Whose Second Character Should Be ‘A’ And String Should Have At least 7 Characters in Cricket Name Field.
insert into ipl select * from cricket where name like '_A_____%';
select * from ipl;

-- 5. Delete All the Rows From IPL.
truncate table ipl;

-- 6. Delete the Detail of Cricketer Whose City is Jharkhand.
delete from cricket where city = 'jharkhand';

-- 7. Rename the Table IPL to IPL2018.
alter table ipl rename to ipl2018;

-- 8. Destroy table T20 with All the Data.
drop table t20;
