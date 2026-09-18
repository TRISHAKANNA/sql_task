#joins
use test;
create table Employee
(emp_id int primary key,
emp_name varchar(100),
department_id int,
salary decimal(10,2)
);

insert into Employee(emp_id,emp_name,department_id,salary)
values(101,"Trisha",11,40000),(102,"Dinesh",12,35000),(103,"Dakshu",13,50000),(104,"Rish",14,29000),
(105,"radha",15,31000),(106,"ravi",16,32000),(107,"ram",17,33000),(108,"ramesh",18,34000),(109,"padu",19,35000),(110,"abi",17,36000),
(111,"tri",16,37000),(112,"dakshan",15,100000),(113,"sati",14,80000),(114,"lali",13,90000) ;

select * from Employee;
create table Department
(
department_id int primary key,
department_name varchar(50)
);

insert into Department (department_id,department_name) values(11,"DE"),(12,"IOT"),(13,"DE"),(14,"SQL"),(15,"C++"),(17,".NET");

update Employee SET emp_name = "Rishi" where emp_id = 104; 
select * from Department;

select E.emp_id,E.emp_name,D.department_name,E.salary from Employee E left join Department D 
on E.department_id = D.department_id 
where D.department_id  IS NOT NULL 
order by E.salary desc;

# 2) Customers Without Orders

create table Customer
(Customer_id int primary key,
Customer_name varchar(100),
city varchar(50));

insert into Customer(Customer_id,Customer_name,city) values
 (101,"Trisha","chennai"),
 (102,"Dinesh","bangalore"),
 (103,"Dakshu","hyderabad"),
 (104,"Rish","chennai"),
 (105,"radha","assam"),
(106,"ravi","vizag"),
(107,"ram","kerala"),
(108,"ramesh","Mumbai"),
(109,"padu","kolkata"),
(110,"abi","noida"),
(111,"tri","kerala"),
(112,"dakshan","vizag"),
(113,"sati","kerala"),
(114,"lali","Mumbai"),
(115,"kiki","assam");

select * from Customer;

create table orders(order_id int primary key,customer_id int, order_Date DATE, order_amount decimal(10,2));

insert into orders(order_id,customer_id,order_Date,order_amount) value(1,101,'2023-01-31',1000);
insert into orders(order_id,customer_id,order_Date,order_amount) values
(2,102,'2023-02-01',2000),
(3,103,'2023-02-03',3000),
(4,104,'2023-02-04',4000),
(5,105,'2023-02-05',5000),
(6,106,'2023-02-06',6000),
(7,107,'2023-02-07',7000),
(8,108,'2023-02-08',8000),
(9,109,'2023-02-09',9000),
(10,110,'2023-02-10',10000),
(11,111,'2023-02-11',11000),
(12,112,'2023-02-12',12000),
(13,113,'2023-02-13',13000),
(14,114,'2023-02-14',14000),
(15,115,'2023-02-15',15000);

select * from orders;
select C.Customer_id,C.Customer_name,C.city,O.order_id from Customer C left join Orders O on
C.Customer_id = O.Customer_id order by C.Customer_name asc;
 
# 3)dept without employees
select C.Customer_id,C.Customer_name,C.city,O.order_id from Customer C inner join Orders O on
C.Customer_id = O.Customer_id order by C.Customer_name asc;

select D.department_id, D.Department_name, E.emp_id, E.emp_name from  department D right join Employee E on D.department_id = E.department_id order by D.Department_name ;  

# 4)product inventory verification
create table Product_Master 
(product_id int primary key,
product_name varchar(100));

insert into Product_Master(product_id,product_name)values
(101,"Mouse"),
(102,"keyboard"),
(103,"monitor"),
(104,"cpu"),
(105,"speaker"),
(106,"usb"),
(107,"bluetooth"),
(108,"monitor"),
(109,"Mouse"),
(110,"wires"),
(111,"board"),
(112,"chip"),
(113,"HD"),
(114,"SSD"),
(115,"laptop")
;

create table warehouse_stock 
(product_id int,
quantity int
);
insert into warehouse_stock(product_id,quantity)values
(101,10),
(102,20),
(103,30),
(104,40),
(105,50),
(106,35),
(107,43),
(108,90),
(109,23),
(110,78),
(111,45),
(112,89);

# products available in both tables -used full outer join achieved using union
select * from warehouse_stock;
use test;
select P.Product_id,P.Product_name,W.quantity from Product_Master P  left join Warehouse_Stock W on P.Product_id = W.Product_id
Union
select P.Product_id,P.Product_name,W.quantity from Product_Master P  right join Warehouse_Stock W on P.Product_id = W.Product_id order by Product_id;

# products available only in Product_Master
select P.Product_id,P.Product_name from Product_Master P  left join Warehouse_Stock W on P.Product_id = W.Product_id;

# products available only in Warehouse_Stock
select P.Product_id,W.quantity from Product_Master P  right join Warehouse_Stock W on P.Product_id = W.Product_id;



# CTE
WITH EmployeeSalary AS ( SELECT * FROM Employee WHERE Salary > 32000 )  SELECT * FROM EmployeeSalary; 

# select * from EmployeeSalary;
use test;
#Temporary table - table exist till the seesion ends
create temporary table EmployeeSalary as Select * from Employee where salary > 50000 ;
select * from EmployeeSalary;

#5) Employee Reporting Hierarchy -like self join 
use demo;

create table EmployeeManager
(emp_id int primary key,
emp_name varchar(100),
manager_id int,
dept varchar(50)
);

insert into EmployeeManager(emp_id,emp_namemanager_id,dept)
values(101,"Trisha",11,"Product"),(102,"Dinesh",12,"Design"),(103,"Dakshu",13,"Testing"),(104,"Rish",14,"Logistics"),
(105,"radha",15,"UX"),(106,"ravi",16,"Admin"),(107,"ram",17,"Design"),(108,"ramesh",18,"Testing"),(109,"padu",19,"UX"),(110,"abi",17,"Admin"),
(111,"tri",16,"Product"),(112,"dakshan",15,"Design"),(113,"sati",14,"Logistics"),(114,"lali",13,"UX");

select * from EmployeeManager;
insert into EmployeeManager(emp_id,emp_name,manager_id,dept) values (115,"rajesh",null,"UX") ;

select E.emp_name as EmployeeName, M.manager_id as ReportingManagerName 
From EmployeeManager E  left join EmployeeManager M on E.emp_id = M.emp_id;

use test;
SELECT * FROM demo.studentinfo;
select * from test.trainer;

#
select demo.SI.std_id, test.T.trainer_name 
from demo.studentinfo SI inner join trainer T on demo.SI.std_id = test.T.Std_ID;


