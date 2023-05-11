create database `aggregation`;

use aggregation;

create table if not exists student_marks
(
	sid int primary key not null, 
    name varchar(50) not null,
    marks int not null
);

insert into student_marks values
(1, 'john', 90),
(2, 'martin', 80),
(3, 'carol', 89),
(4, 'jack', 99),
(5, 'rose', 88),
(6, 'mary', 90);

select * from student_marks;

-- Find total number of students
select count(*) as total_students from student_marks;

-- Find total of marks scored by all students.
select sum(marks) as total_marks from student_marks;

-- Find average marks of all students.
select avg(marks) as avg_marks from student_marks;

-- Find minimum marks scored from all students.
select min(marks) as minimum_marks from student_marks;

-- Find maximum marks scored from all students.
select max(marks) as maximum_marks from student_marks;

create table if not exists employee
(
	eid int primary key not null,
    name varchar(25) not null,
    department varchar(50) not null,
    salary decimal(8,2) not null,
    joining_date datetime not null,
    city varchar(30) not null
);

select * from employee;

-- 1. Display the Highest, Lowest, Total, and Average salary of all employees& label the columns Maximum, Minimum, Total_Sal and Average_Sal, respectively.
select max(salary) maximum, min(salary) minimum, sum(salary) total, avg(salary) average from employee;

-- 2. Find total number of employees of EMPLOYEE table.
select count(*) total_employees from employee;

-- 3. Retrieve maximum salary from IT department.
select max(salary) max_salary_of_it from employee where department = 'it';

-- 4. Count total number of cities of employee without duplication.
select count(distinct city) total_cities from employee;

-- 5. Display city with the total number of employees belonging to each city.
select city, count(*) total_employees from employee group by city;

-- 6. Display city having more than one employee.
select city from employee group by city having count(*) > 1;

-- 7. Give total salary of each department of EMPLOYEE table.
select department, sum(salary) from employee group by department;

-- 8. Give average salary of each department of EMPLOYEE table without displaying the respective department name.
select avg(salary) avg_salary_department_wise from employee group by department;

-- 9. Give minimum salary of employee who belongs to Ahmedabad.
select min(salary) from employee where city = 'ahmedabad' group by city;

-- 10. List the departments having total salaries more than 50000 and located in city Rajkot.
select department, city from employee where city = 'rajkot' group by department having sum(salary) > 50000;

-- 11. Count the number of employees living in Rajkot.
select count(*) from employee where city = 'rajkot';

-- 12. Display the difference between the highest and lowest salaries. Label the column name to SAL_DIFFERENCE.
select max(salary) - min(salary) as SAL_DIFFERENCE from employee;

-- 13. Display the total number of employees hired before 1st January, 1991.
select count(*) from employee where joining_date < '1991-01-01';

-- 14. Display total salary of each department with total salary exceeding 35000 and sort the list by total salary.
select department, sum(salary) total_salary from employee group by department having sum(salary) > 35000 order by total_salary desc;

-- 15. List out department names in which more than two employees.
select department, count(*) total_emplpyee from employee group by department having count(*) > 2;

-- 16. Display Minimum salary of Rajkot City.
select min(salary) min_salary_rajkot from employee where city = 'rajkot' group by city ;

-- 17. Display City wise total employees count.
select city, count(*) total_employees from employee group by city;

-- 18. List all departments with minimum salaries.
select department, min(salary) min_salary from employee group by department;

-- 19. Give Total salaries of each city without displaying the respective city name.
select sum(salary) from employee group by city;

-- 20. Find department wise Minimum, Maximum & Total Salaries.
select department, min(salary) minimum, max(salary) maximum, sum(salary) total from employee group by department;

