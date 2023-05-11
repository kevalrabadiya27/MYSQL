create database `like-example`;

use `like-example`;

create table if not exists student (
	id int primary key not null,
    fname varchar(50),
    lname varchar(50),
    website varchar(50),
    city varchar(50),
    division varchar(50)
);

select * from student;

-- Display the name of students whose name starts with ‘k’
select fname from student where fname like 'k%';

-- Display the name of students whose name consists of five characters
select fname from student where fname like '_____';

-- Retrieve the first name & last name of students whose city name ends with a & contains six characters.
select fname, lname, city from student where city like '_____a';

-- Display all the students whose last name ends with ‘tel’
select lname from student where lname like '%tel';

-- 5. Display all the students whose first name starts with ‘ha’ & ends with ‘t’.
select fname from student where fname like 'ha%' and fname like '%t';

-- 6. Display all the students whose first name starts with ‘k’ and third character is ‘y’.
select fname, lname from student where fname like 'k_y%';

-- 7. Display the name of students having no website and name consists of five characters.
select fname, lname from student where fname like '_____' and website is null;

-- 8. Display all the students whose last name consists of ‘jer’.
select fname, lname from student where lname like '%jer%';

-- 9. Display all the students whose city name starts with either ‘r’ or ‘b’.
select fname, lname, city from student where city like 'r%' or city like 'b%';

-- 10. Display all the name students having websites.
select fname, lname from student where website is not null;

-- 11. Display all the students whose name starts from alphabet A to H.
select fname, lname from student where fname regexp '^[a-h]';

-- 12. Display all the students whose name’s second character is vowel.
select fname, lname from student where fname regexp '.[AEIOU]';

-- 13. Display student’s name whose city name consist of ‘rod’.
-- 14. Retrieve the First & Last Name of students whose website name starts with ‘bi’.
-- 15. Display student’s city whose last name consists of six characters.
-- 16. Display all the students whose city name consist of five characters & not start with ‘ba’.
-- 17. Show all the student’s whose division starts with ‘II’.
-- 18. Find out student’s first name whose division contains ‘bc’ anywhere in division name.
-- 19. Show student id and city name in which division consist of six characters and having website name.
-- 20. Display all the students whose name’s third character is consonant.