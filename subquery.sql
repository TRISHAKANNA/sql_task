use test;
#scenario 1
select Emp_id,Emp_name,Department_id,salary from Employee 
where salary > (select Avg(salary) from Employee) order by salary desc;

#scenario 2
# scenario 2:corelated subquery:

create table Employee_demo(
Employee_id int primary key,
Employee_name varchar(20) , 
Department varchar(20),
salary int,
Experience int
);
insert into Employee_demo(Employee_id,Employee_name,Department,salary,Experience) values 
(101,"Trisha","sales",45000,3),
(102,"dinesh","IT",55000,5),
(103,"krupa","Logistics",75000,3),
(104,"sat","QA",95000,8),
(105,"lali","Devops",75000,13),
(106,"sara","Admin",85000,5),
(107,"lali","sales",75000,8),
(108,"dakshu","IT",65000,2),
(109,"Trisha","Logistics",85000,7),
(110,"ram","QA",35000,9),
(111,"ramu","Devops",195000,3),
(112,"raja","sales",15000,2),
(113,"Trisha","IT",95000,9),
(114,"Trisha","QA",93000,1),
(115,"dinesh","HR",34000,4),
(116,"Trisha","HR",45000,3);

select * from Employee_demo;


select Employee_name,Department,salary,Experience from Employee_demo E
where salary =
(select max(salary) from Employee_demo where Department = E.Department);

#scenario 3:
/*
An e-commerce company wants to identify customers who placed the highest-value order.
Display the Customer Name, City, Order ID, and Order Amount.
Arrange the report alphabetically by Customer Name
*/
select * from customer;
select * from orders;

use test;
select C.customer_name, C.city, O.order_id, O.order_amount from Customer C join Orders O on C.Customer_id = O.Customer_id
where O.order_amount = (select max(order_amount) from Orders )
order by C.customer_name ASC ;

/*
Scenario 4 – Employees Working in Departments with More Than Three Employees
The HR department wants to generate a report of employees who work in departments having more than three employees.
Display the Employee Name, Department, Salary, and Age
Sort the result by Department and then by Salary in descending order
*/
use test;
insert into Employee_demo(Employee_id,Employee_name,Department,salary,Experience) value
(117,"Bala","sales",95000,3);
select * from Employee_Demo;
select employee_Name,department,salary  from employee_demo where 
 department in (select department from employee_demo 
 group by department having count(employee_id) >3 ) order by department, salary desc;
 
 
 /*Scenario 5 – Products Never Ordered
Scenario
An online shopping company wants to identify products that have never been ordered.
Display the Product ID, Product Name, Category, and Price.
Sort the report by Product Name.*/

create table product (
Product_Id int primary key,
Product_name varchar(100),
Category varchar(50),
Price decimal(10,2));

insert into product (Product_Id,Product_name,Category,Price) values
(101,"Mouse","A",2000),
(102,"keyboard","B",4000),
(103,"monitor","D",4000),
(104,"cpu","C",2000),
(105,"speaker","B",6000),
(106,"usb","C",3000),
(107,"bluetooth","A",1000),
(108,"monitor","A",5000),
(109,"Mouse","B",7000),
(110,"wires","C",3000),
(111,"board","D",9000),
(112,"chip","E",2000),
(113,"HD","B",12000),
(114,"SSD","A",15000),
(115,"laptop","C",5000),
(116,"board","D",9000),
(117,"chip","E",12000),
(118,"HD","B",12000),
(119,"SSD","A",25000),
(120,"laptop","C",5000)
;
create table Order_Items( Order_ID  int primary key,
Product_ID int,
Quantity int );

insert into Order_Items(order_id,product_id,quantity)values
(1,101,10),
(2,102,20),
(3,103,30),
(4,104,40),
(5,105,50),
(6,106,35),
(7,107,43),
(8,108,90),
(9,109,23),
(15,115,75),
(18,116,54),
(19,117,23),
(20,118,34),
(21,119,44),
(22,120,32);
select * from product,Order_Items;
select P.product_id,P.Product_name,P.Category,P.Price from product P left join order_items O 
on P.product_id = O.product_id where o.order_id is NULL order by P.Product_name ;

/*Scenario 6 – Employees Matching
Department and Experience
Scenario
The HR team wants to identify employees whose Department and Experience match the
Department and Experience of employees working in the sales department.
Display the Employee Name, Department, Experience, and Salary.
Arrange the report by Experience in descending order.*/
select * from Employee_demo;
select Employee_name,Department,Experience,Salary from Employee_demo 
where (Department , Experience) in 
(select Department,experience from Employee_demo where department = "sales" ) 
order by experience desc;

#other way:
select Employee_name,Department,Experience,Salary from Employee_demo 
where Experience in 
(select distinct experience from Employee_demo where department = "sales" ) 
order by experience desc;
#where O.order_amount IN (Select max(O.order_amount) from Orders ) ;

/*
Scenario 7 – Employees Reporting to the
Manager with the Highest Salary
Scenario
The company wants to identify employees who report directly to the manager who receives the
highest salary in the organization.
Display the Employee Name, Manager ID, Department, and Salary.
Sort the report by Employee Name.
*/
create table EmployeeManagerDemo
(emp_id int primary key,
emp_name varchar(100),
manager_id int,
dept varchar(50),
salary decimal (10,2)
);

insert into EmployeeManagerDemo(emp_id,emp_name,manager_id,dept,salary)
values(101,'Trisha',104,'Product',20000),(102,'Dinesh',12,'Design',21000),
(103,'Dakshu',NULL,'Testing',22000),
(104,'Rish',101,'Logistics',23000),
(105,'radha',106,'UX',23000),(106,'ravi',NULL,'Admin',25000),
(107,'ram',111,'Design',26000),(108,'ramesh',102,'Testing',27000),
(109,'padu',102,'UX',28000),(110,'abi',107,'Admin',29000),
(111,'tri',106,'Product',30000),(112,'dakshan',105,'Design',31000),
(113,'sati',104,'Logistics',32000),(114,'lali',103,'UX',33000);
#confusing
select * from EmployeeManagerDemo;
select emp_name,manager_id,dept,salary from EmployeeManagerDemo
where manager_id in (select emp_id from EmployeeManagerDemo where salary = 
(Select max(salary) from EmployeeManagerDemo WHERE Emp_ID IN (SELECT DISTINCT Manager_ID FROM EmployeeManagerDemo)))
order by emp_name;

#practice
select Emp_id,Emp_name,Department_id,salary from Employee E
where salary > 
(select Avg(salary) from Employee where department_id = E.department_id ) ;
# inner query alone executed separately:
select Department_id,Avg(salary) from Employee  group by department_id;


