use test;

#practice
select emp_name,salary,
rank()
over(order by salary desc) as rank_no
from employee; 

insert into Employee(emp_id,emp_name,department_id,salary)
values(141,"rishadh",11,40000);
# partition by(group by)+order by

select emp_name,department_id,salary,
rank()
over(partition by department_id
order by salary desc) as rank_no
from employee;

#only using over() with aggregate function:
select emp_name,salary,Avg(salary)
over() as avg_salary 
from employee;

select emp_name,department_id,salary,
row_number() over(
order by emp_name desc) as row_num
from employee;

select emp_name,department_id,salary ,
avg(salary)
over(order by department_id desc) as avg_salary
from employee;

#scenario based question:
/*Scenario 1 – Company Salary Sequence  
Scenario 
The HR department wants to assign a unique sequence number to every employee based on the 
highest salary. 
Display the Employee ID, Employee Name, Department, Salary, and Sequence Number. 
Arrange the employees from the highest salary to the lowest salary.*/

use test;
select emp_id,emp_name,department_id,salary,
row_number()
over
(
order by salary desc
)
as HighestSalaryrow_no
from Employee;

/*Scenario 2 – Department-wise Salary 
Ranking  
Scenario 
The HR team wants to rank employees based on salary within each department. 
Display the Employee Name, Department, Salary, and Rank. 
Highest salary should receive Rank 1 in every department.*/

select emp_name,department_id,salary,
rank()
over
(partition by department_id
order by salary desc) as Rank_no
from Employee;


/*Scenario 3 – Branch-wise Employee 
Numbering  
Scenario 
A company has multiple branches. 
Assign a unique row number to employees within each branch based on Employee ID. 
Display the Employee Name, Branch, Employee ID, and Row Number.*/

use test;

select emp_name,department_id,emp_id,
dense_rank()
over
(partition by department_id
order by emp_id
) as  rownumber from employee;

/*
Scenario 4 – Salary Ranking with Duplicate Salaries  
Scenario 
The Finance department wants employees having the same salary to receive the same rank, and 
the next rank should not skip any number. 
Display the Employee Name, Salary, and Salary Rank.
*/

select emp_name,salary ,
dense_rank()
over(
order by salary ) as salary_rank
from employee;

/*Scenario 5 – Branch and Department-wise 
Ranking  
Scenario 
The company wants to rank employees separately for every Branch and Department 
combination based on salary. 
Display the Employee Name, Branch, Department, Salary, and Rank.*/

use test;
create table EmployeeBranch
(
emp_id int primary key,
emp_name varchar(50),
branch varchar(50),
department varchar(50),
salary decimal(10,2)		
);

INSERT INTO EmployeeBranch (emp_id, emp_name,branch, department,salary)
VALUES 
    (1, 'Ram ','porur' ,'HR',  60000.00),
    (2, 'reka','redhills', 'Engineering',  75000.00),
    (3, 'Brown','Ambattur', 'Marketing',  55000.00),
    (4, 'Prince','madipakkam', 'Engineering',110000.00),
    (5, 'vidhya','kk nagar', 'Finance',  85000.00),
    (6, 'shoba','ashok nagar' ,'Sales',  65000.00),
    (7, 'George','porur' , 'IT', 50000.00),
    (8, 'Hannah','Ambattur' ,'HR',  78000.00),
    (9, 'Ian','Ram nagar', 'Data Science', 130000.00),
    (10, 'Julia','porur' , 'Marketing',  68000.00),
    (11, 'Kevin','ashok nagar' , 'Sales', 95000.00),
    (12, 'ella', 'Ram nagar','IT', 80000.00),
    (13, 'trisha','kk nagar', 'Management', 105000.00),
    (14, 'Nancy','porur' , 'Finance',  70000.00),
    (15, 'peter', 'kk nagar','Accounting', 92000.00),
    (16, 'dakshan' ,'ashok nagar' ,'IT', 100000.0);
  
  INSERT INTO EmployeeBranch (emp_id, emp_name,branch, department,salary)
VALUES (17,'lali','kknagar','accounting',67000.0),(18,'lalitha','kknagar','finance',910000);
    select * from EmployeeBranch;
    select emp_name,branch,department,salary,
    dense_rank()
    over
    (partition by branch ,department
    order by salary desc) as Rank_no
    from EmployeeBranch;
/*
Scenario 6 – Salary Tie Breaker  
Scenario 
The HR department wants employees sorted by highest salary. 
If two employees receive the same salary, arrange them alphabetically by Employee Name. 
Display the Employee Name, Salary, and Row Number.
*/
select emp_name,salary,
ROW_NUMBER()
over
(order by salary desc, emp_name asc) as highest_salary
from employee;

/*Scenario 7 – Department-wise Experience 
Ranking  
Scenario 
The HR department wants to rank employees within each department. 
Employees should first be sorted by Experience (Highest to Lowest). 
If two employees have the same experience, sort them by Salary (Highest to Lowest). 
Display the Employee Name, Department, Experience, Salary, and Rank.
*/
use test;
create table EmployeeExp
(
emp_id int primary key,
emp_name varchar(50),
department varchar(50),
experience int,
salary decimal(10,2)		
);

INSERT INTO EmployeeExp (emp_id, emp_name, department, experience, salary)
VALUES 
    (1, 'Ram ', 'HR', 5, 60000.00),
    (2, 'reka', 'Engineering', 3, 75000.00),
    (3, 'Brown', 'Marketing', 2, 55000.00),
    (4, 'Prince', 'Engineering', 8, 110000.00),
    (5, 'vidhya', 'Finance', 6, 85000.00),
    (6, 'shoba', 'Sales', 4, 65000.00),
    (7, 'George', 'IT', 1, 50000.00),
    (8, 'Hannah', 'HR', 7, 78000.00),
    (9, 'Ian', 'Data Science', 10, 130000.00),
    (10, 'Julia', 'Marketing', 4, 68000.00),
    (11, 'Kevin', 'Sales', 9, 95000.00),
    (12, 'ella', 'IT', 5, 80000.00),
    (13, 'trisha', 'Management', 12, 105000.00),
    (14, 'Nancy', 'Finance', 3, 70000.00),
    (15, 'peter', 'Accounting', 11, 92000.00),
    (16, 'dakshan' ,'IT', 5,100000.0);

select emp_name, department, experience, salary ,
rank()
over(
order by experience desc,salary desc) as rank_no
from employeeExp;

/*
Scenario 8 – Multi-Level Employee Ranking  
Scenario 
The management wants to assign row numbers separately for each Country and Branch. 
Within each group, employees should be sorted by: 
1. Salary (Highest) 
2. Experience (Highest) 
3. Employee Name (Alphabetically) 
Display the Employee Name, Country, Branch, Salary, Experience, and Row Number.*/

use demo;
create table Emp
(
emp_id int primary key,
emp_name varchar(50),
country varchar(50),
branch varchar(50),
experience int,
salary decimal(10,2)	);

insert into Emp(emp_id,emp_name,country,branch,experience,salary) values 
(101,'Trisha','india','QA', 8 ,50000.00),
(102, 'Arjun', 'India', 'IT', 6, 75000.00),
(103, 'Sarah', 'USA', 'SQL', 2, 62000.00),
(104, 'Yuki', 'Japan', 'IT', 8, 95000.00),
(105, 'David', 'UK', 'SQL', 5, 58000.00),
(106, 'Fatima', 'UAE', '.NET', 4, 71000.00),
(107, 'shena', 'Spain', '.NET', 7, 68000.00),
(108, 'rama', 'South Korea', 'EXCEL', 3, 55000.00),
(109, 'jose', 'France', 'HR', 9, 88000.00),
(110, 'Rahul', 'India', 'EXCEL', 5, 60000.00),
(111, 'radha', 'USA', 'QA', 6, 82000.00),
(112, 'Ken', 'Japan', 'HR', 4, 73000.00),
(113, 'raja', 'UK',  'QA',5, 49000.00),
(114, 'ram', 'Nigeria', 'HR', 8, 64000.00),
(115, 'akhi', 'Germany', 'HR', 10, 99000.0);

insert into Emp(emp_id,emp_name,country,branch,experience,salary) values 
(116,'raha','india','QA', 8 ,50000.00),
(117,'riya','France','HR',10, 40000.00);

select emp_name,country,branch,salary,experience,
row_number()
over
(partition by country, branch
order by salary desc, experience desc,emp_name asc)as rownum
from Emp;


/*
Scenario 9 – Product Price Ranking by 
Category  
Scenario 
The inventory team wants to rank products based on price within each product category. 
Products with the same price should receive the same rank. 
Display the Product Name, Category, Price, and Rank. 
*/
use demo;
create table product ( product_id int primary key ,product_name varchar(100),category varchar(100),price decimal(10,2));
insert into product( product_id, product_name,category,price) values 
(101, 'pencil','stationary', 1000),
(102, 'eraser','stationary', 2000),
(103, 'sharpner','stationary', 3000),
(104, 'scale','stationary', 4000),
(105, 'abacus','stationary', 5000),
(106, 'crayon','stationary', 6000),
(107, 'books','stationary', 7000),
(108, 'monitor','electronics', 80000),
(109, 'keyboard','electronics', 9000),
(110, 'laptop','electronics', 10000),
(111, 'hdd','electronics', 11000),
(112, 'ssd','stationary', 12000),
(113, 'hdd','stationary', 13000),
(114, 'software','stationary', 14000),
(115, 'pencil','stationary', 1000),
(116, 'eraser','stationary', 2000),
(117, 'keyboard','electronics', 9000),
(118, 'laptop','electronics', 10000);

select * from product;
select product_name,category,price,
dense_rank()
over
(partition by category
order by price) as rankorder
from product;

/*
Scenario 10 – Customer Order Sequence
An e-commerce company wants to assign order numbers separately for each Customer and 
Order Status. 
Within each group, orders should be arranged by: 
1. Order Date (Latest First) 
2. Order Amount (Highest First) 
Display the Customer
*/
use demo;
create table orders(order_id int primary key,customer_id int,order_status varchar(30),order_date date, order_amount decimal(10,2));

insert into orders(order_id,customer_id,order_status,order_date,order_amount) values(1 ,101, 'success', '2025-10-02', 1000);
insert into orders(order_id,customer_id,order_status,order_date,order_amount) values
(2,102,'success','2023-02-01',2000),
(3,103,'Failed','2023-02-03',3000),
(4,104,'success','2023-02-04',4000),
(5,105,'Failed','2023-02-05',5000),
(6,106,'success','2023-02-06',6000),
(7,107,'Failed','2023-02-07',7000),
(8,108,'success','2023-02-08',8000),
(9,109,'Failed','2023-02-09',9000),
(10,110,'success','2023-02-10',10000),
(11,111,'Failed','2023-02-11',11000),
(12,112,'success','2023-02-12',12000),
(13,113,'Failed','2023-02-13',13000),
(14,114,'success','2023-02-14',14000);

select order_id,customer_id,order_status,order_date,
order_amount, row_number()
over(
partition by  customer_id, order_status 
order by order_date desc,order_amount desc) as customerorder_no
from orders;

