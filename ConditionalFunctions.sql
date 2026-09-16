
use demo;

CREATE TABLE studentInfo
( 
std_id int primary key ,
std_name varchar(20) not null,
marks int,
course varchar(10)
);

INSERT INTO studentInfo
(std_id, std_name, marks, course) VALUES (101, "radha", 98, "IOT"),(102, "trisha", 88, "DE"),(103, "rekha", 68);

select * from studentInfo;

#if condition()
select std_id, course, marks,  if (marks >= 50 ,'PASS','FAIL')as RESULT from studentInfo;

INSERT INTO studentInfo
(std_id, std_name, marks, course) VALUES (104, "kirthi", 48, "SQL"),(105 ,"dinesh",49, "EXCEL"),(106, "dakshan", 100, "PYTHON");

alter table studentInfo add column Inten_amt int;
alter table studentInfo drop column Intenship_amt ;

update studentInfo SET intensalary = 12000 where std_id = 101; 
update studentInfo SET intensalary = 5000 where std_id = 102; 
update studentInfo SET intensalary = 2000 where std_id = 103; 
update studentInfo SET intensalary = 500 where std_id = 104; 
update studentInfo SET intensalary = 1500 where std_id = 105; 
update studentInfo SET intensalary = 2500 where std_id = 106;
 
#if else condition()
select std_id, std_name ,intensalary,
case  when intensalary >=5000 
then ' HIGH SALARY ' 
else 'LOW SALARY' end as FinalResult 
From studentinfo;

# Nested if condition()
select std_id,std_name, marks,
case 
when marks >= 90 then 'EXCELLENT'
when marks >=80 then 'VERY GOOD'
when marks >=50 then 'PASS'
else 'FAIL'
end as RESULT
from Studentinfo;

#Operators
select intensalary as old_salary,intensalary + 5000 as updated_salary from studentinfo;

select * from studentInfo where intensalary > 5000;

select * from studentInfo where marks != 98;

select * from studentInfo where intensalary between 1000 and 7000 ;

select * from studentInfo where course IN("DE","SQL","PYTHON"); 
select * from studentInfo where course NOT IN("DE","SQL","PYTHON");

select * from studentInfo where marks IS NOT NULL; 
select * from studentInfo where marks IS NULL;

# name starting with D
select * from studentInfo where std_name like 'd%';

# name ending with D
select * from studentInfo where std_name like "%a";

select * from studentInfo where std_name like '%sh%';

# name based on D and 5 letters so comes output as dinesh
select * from studentInfo where std_name like 'D_____';
select * from studentInfo where std_name like '_____a';

# name  with exactly 5 letters so 5 dashes
select * from studentInfo where std_name like '______';

# name starts with t and ends with a
select * from studentInfo where std_name like 't%a';

# name with second letter is a
select * from studentInfo where std_name like '_a%';

# name ends with a
select * from studentInfo where std_name like '_%a';

#name that doesnot match j
SELECT *
FROM studentInfo
WHERE std_name NOT LIKE 'J%';



