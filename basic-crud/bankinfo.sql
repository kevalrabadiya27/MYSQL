CREATE DATABASE BANK_INFO;

use BANK_INFO;

create table if not exists deposit (
	actno int primary key not null,
    cname varchar(50),
    bname varchar(50),
    amount decimal(8,2),
    adate datetime
);

create table if not exists branch (
	bname varchar(50),
    city varchar(50)
);

create table if not exists customers (
	cname varchar(50),
    city varchar(50)
);

create table if not exists borrow (
	loanno int,
    cname varchar(50),
    bname varchar(50),
    amount decimal(8,2)
);

-- Retrieve all data from table DEPOSIT
select * from deposit;

-- Retrieve all data from table CUSTOMERS
select * from customers;

-- Retrieve all data from table BORROW
select * from borrow;

-- Display Account No, Customer Name & Amount from DEPOSIT
select actno, cname, amount from deposit;

-- Display Loan No, Amount from BORROW
select loanno, amount from borrow;

-- Display loan details of all customers who belongs to ‘ANDHERI’ branch
select * from borrow where bname = 'andheri';

-- Give account no and amount of depositor, whose account no is equals to 106
select actno, amount from deposit where actno = 106;

-- Give name of borrowers having amount greater than 5000. 
select cname from borrow where amount > 5000;

-- Give name of customers who opened account after date '1-12-96'. 
select cname from deposit where adate > '1996-12-01';

-- Display name of customers whose account no is less than 105.
select cname, actno from deposit where actno < 105;

-- Display name of customer who belongs to either ‘NAGPUR’ Or ‘DELHI’.
-- select * from customers where city = 'nagpur' or city = 'delhi';
select * from customers where city in('nagpur', 'delhi');

-- Display name of customers with branch whose amount is greater than 4000 and account no is less than 105
select * from deposit where amount > 4000 and actno < 105;

-- Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000.
select * from borrow where amount >= 3000 and amount <= 8000;

-- Find all depositors who do not belongs to ‘ANDHERI’ branch.
select * from deposit where bname != 'andheri';

-- Display the name of borrowers whose amount is NULL.
select * from borrow where amount is NULL;

-- Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’ Or ‘M.G. ROAD’ and Account No is less than 104
select actno, cname, bname, amount from deposit where bname in ('ajni', 'karolbagh','m.g. road') and actno < 104;

-- Display all the details of first five customers
select * from customers limit 5;

-- Display all the details of first three depositors whose amount is greater than 1000
select * from deposit where amount > 1000 limit 3;

-- Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to ‘ANDHERI’.
select loanno, cname from borrow where bname <> 'andheri' limit 5;

-- Retrieve all unique cities using DISTINCT. (Use Customers Table)
select distinct city from customers;

-- Retrieve all unique branches using DISTINCT. (Use Branch Table)
select distinct bname from branch;

-- Retrieve all the records of customer table as per their city name in ascending order
select * from customers order by city asc;

-- Retrieve all the records of deposit table as per their amount column in descending order
select * from deposit order by amount desc;

-- Retrieve all the details of customers in which descending order of their city name.
select * from customers order by city desc;

-- Show all unique borrowers & label the column UNI_Borrowers. (Display only Names)
select cname as UNI_Borrowers from borrow;

use bank_info;

-- Update deposit amount of all customers from 3000 to 5000
update deposit 
set amount = 5000 
where amount = 3000;

-- Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table) 
update borrow
set bname = 'c.g road'
where cname = 'anil';

-- Update Account No of SANDIP to 111 & Amount to 5000.
update deposit 
set actno = 111, amount = 5000
where cname = 'sandeep';

select * from borrow;

-- Give 10% Increment in Loan Amount.
update borrow
set amount = amount + (amount * 0.1);

-- Update deposit amount of all depositors to 5000 whose account no between 103 & 107.
update deposit
set amount = 5000
where actno between 103 and 107;

-- Update amount of loan no 321 to NULL.
update borrow 
set loanno = null
where loanno = 321;

-- Change Loan number from 201 to 401 & also change branch name from VRCE to AJNI.
update borrow
set loanno = 401, bname = 'ajni'
where loanno = 201 and bname = 'vrce';

-- Delete records of Customer table that belongs to BOMBAY City
delete from customers
where city = 'bombay';

-- Delete all account numbers whose amount less than equals to 1000.
delete from deposit 
where amount < 1000;

-- Delete borrowers whose branch name is ‘AJNI’
delete from borrow
where bname = 'ajni';

-- Delete all the borrowers whose loan number between 201 to 210
delete from borrow
where loanno between 201 and 210;

-- Delete customers who opened account after date '01-DEC-96'. (Use DEPOSIT table)
delete from deposit
where adate > '1996-12-01';

-- Delete all the records of Customers table. (Use TRUNCATE)
truncate table customers;

-- Remove all customers whose name is ANIL & Account Number is 101.
delete from deposit
where cname = 'anil' and actno = 101;

-- Delete all the depositors who do not belongs to ‘ANDHERI’ branch.
delete from deposit
where bname <> 'andheri';

-- Delete all the borrowers whose loan amount is less than 2000 and does not belong to VRCE branch.
delete from borrow
where amount < 2000 and bname <> 'vrce';

-- Remove Branch table. (Use DROP)
drop table branch;