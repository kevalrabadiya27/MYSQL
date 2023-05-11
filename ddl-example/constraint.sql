use `ddl-example`;

create table if not exists student_master 
(
	sid int primary key auto_increment not null,
    enrno varchar(20) unique not null,
    name varchar(25) not null,
    cpi decimal(5, 2) constraint cpi_limit check(cpi<=10),
    joining_date datetime default current_timestamp not null,
    backlog int constraint backlog_limit check(backlog>=0) not null,
	cityid int not null,
	state_name varchar(50) default 'gujarat',
    foreign key (cityid) references city_master(cityid) on delete cascade
);

create table if not exists city_master
(
	cityid int primary key auto_increment not null,
    name varchar(20) unique not null,
    pincode varchar(10) null,
    stdcode varchar(10) null
);