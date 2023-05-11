create database functions;

use functions;

-- math function

select 5*3;

select abs(-25);

select ceiling(25.2);
select ceil(25.2);

select floor(25.2);

select 5%3;

select power(3,2);

select sqrt(30);

select pi();

SELECT ROUND(157.732,2),ROUND(157.732,0),ROUND(157.732,-2);

-- string functions

select length(null), length("abc"), length(""), length("   hi ");

select lower("ABC");

select UPPER("abc");

select substr("iamuttam", 1,3);
select substr("iamuttam", 3);

