create database prem;
use prem;

create table doctor(
	doctorid int primary key not null,
    name varchar(20),
    cityid int,
    stateid int,
    countryid int,
    foreign key (cityid) 
		references city(cityid) 
		on delete cascade,
    foreign key (stateid) 
		references state(stateid) 
        on delete cascade,
	foreign key (countryid) 
		references country(countryid ) 
        on delete cascade
);

create table city(
	cityid int primary key not null,
    name varchar(20)
);

create table state(
	stateid int primary key not null,
    name varchar(20)
);

create table country(
	countryid int primary key not null,
    name varchar(20)
);

create table patient (
	patientid int primary key not null,
    name varchar(20)
);

create table patientwisedoctor(
	id int primary key not null,
    doctorid int,
    userid int,
    foreign key (doctorid) references doctor(doctorid) on delete cascade,
    foreign key (userid) references patient(patientid) on delete cascade,
    date datetime
);

select pwd.id, d.name as doctor, p.name as patient, c.name as city, s.name as state, co.name as country, pwd.date from
patientwisedoctor as pwd
inner join 
doctor as d
on pwd.doctorid = d.doctorid
inner join 
patient as p
on p.patientid = pwd.userid
inner join 
city as c
on c.cityid = d.cityid
inner join 
state as s
on s.stateid = d.stateid
inner join 
country as co
on co.countryid = d.countryid;
