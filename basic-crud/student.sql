create database student;

use student;

create table if not exists students (
	id int primary key not null,
    fname varchar(25),
    lname varchar(25),
    website varchar(50),
    city varchar(25),
    division varchar(25)
);

