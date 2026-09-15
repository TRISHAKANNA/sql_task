create database demo;

-- To use table in this database
use demo; 

-- Create table
create table Employee
(EmpID int, 
EmpName varchar(20),
EmpNumber int,
Salary decimal(7,2),
deptid int,
country varchar(10)
);

select * from Employee;

-- Alter (adding a table)
Alter table Employee add email varchar(50);
 
select * from Employee;

-- Alter (Modify a column)
Alter table Employee modify salary decimal (10,3);

-- Truncate (Remove the data from the table)
truncate table Employee;

-- Insert into the table
Insert into Employee (EmpID,EmpName,EmpNumber,Salary,deptid,country) values( 2 , "Trisha" , 9821878 , 50000 , 1 , "India");
Insert into Employee (EmpID,EmpName,EmpNumber,Salary,deptid,country) values( 1 , "Dinesh" , 3454365 , 60000 , 2 , "India");
Insert into Employee (EmpID,EmpName,EmpNumber,Salary,deptid,country) values( 1 , "Daksh" , 7775625 , 40000 , 3 , "India");
Insert into Employee (EmpID,EmpName,EmpNumber,Salary,deptid,country) values( 3 , "Rish" , 867688 , 60000 , 4 , "Japan");

use demo;
select * from Employee;

-- Update
Update Employee set EmpID = 4 where EmpName ="Daksh";

select * from Employee;

-- Delete 
delete from Employee where empid = 3;
 
select * from Employee;
use demo;

-- create user2 at localhost and also in home page create user2
create user 'user2'@'localhost' identified by'user2';

-- Grant
Grant select,update on Employee to 'user2'@'localhost';

use demo;

-- Revoked permission 
Revoke update on Employee from 'user2'@'localhost';

select * from employee;
Insert into Employee (EmpID,EmpName,EmpNumber,Salary,deptid,country,email) values( 3 , "Rish" , 867688 , 60000 , 4 , "Japan","rishi@gmail.com");
Insert into Employee (EmpID,EmpName,EmpNumber,Salary,deptid,country,email) values( 5 , "jack" , 543543 , 80000 , 4 , "china","jack@gmail.com");

select * from employee;
update employee set empname = "jill" where empid = 5;

select * from employee;
commit;

use demo;
update employee set empname = "Dakshan.D" where empname ="Dakshan";

select * from employee;

use demo;
select * from employee;

commit;

drop table employee;
rollback;
select * from employee;


-- Create table
create table Student
(StuID int , 
StuName varchar(20),
StuNumber int,
Salary decimal(7,2),
deptid int,
country varchar(10),
email varchar(20)
);

Insert into Student (StuID,StuName,StuNumber,Salary,deptid,country,email) values( 2 , "Trisha" , 9821878 , 50000 , 1 , "India","tri@gmail.com");

select * from Student;

#Alter table by renaming the column
alter table Student rename column salary to IntenshipAmt;

select * from Student;

Insert into Student (StuID,StuName,StuNumber,IntenshipAmt,deptid,country,email) values( 1 , "Dinesh" , 933434554 , 10000 , 2 , "India","dinesh@gmail.com");
Insert into Student (StuID,StuName,StuNumber,IntenshipAmt,deptid,country,email) values( 3 , "Daksh" , 657677687 , 52000 , 3 , "India","dak@gmail.com");

select * from student;

delete from student where stuid = 3;
select * from student;

delete from student where stuid = 1;  

select * from student;
Insert into Student (StuID,StuName,StuNumber,IntenshipAmt,deptid,country,email) values( 3 , "Daksh" , 657677687 , 52000 , 3 , "India","dak@gmail.com");
select * from student;
Insert into Student (StuID,StuName,StuNumber,IntenshipAmt,deptid,country,email) values( 1 , "Dinesh" , 933434554 , 10000 , 2 , "India","dinesh@gmail.com");
select * from student;
delete from student where stuid = 2;  
select * from student;
delete from student where stuid = 1; 

Insert into Student (StuID,StuName,StuNumber,IntenshipAmt,deptid,country,email) values( 3 , "Daksh" , 657677687 , 52000 , 3 , "India","dak@gmail.com");
select * from student;
Insert into Student (StuID,StuName,StuNumber,IntenshipAmt,deptid,country,email) values( 1 , "Dinesh" , 933434554 , 10000 , 2 , "India","dinesh@gmail.com");
select * from student;

-- rollback
rollback;
select * from student;

update student set deptid = 1 where deptid = 2; 

select * from student;
rollback;
select * from student;

-- savepoint
savepoint insert1;
Insert into Student (StuID,StuName,StuNumber,IntenshipAmt,deptid,country,email) values( 5 , "sri" , 45435345 , 34000 , 5 , "china","sri@gmail.com");
select * from student;

rollback to insert1;
select * from student;