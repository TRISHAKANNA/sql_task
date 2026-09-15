create database test;

use test;
# constraints
#primary key(unique and notnull)
create table student(
std_id int Primary key Auto_increment , 
std_name varchar(20) not null, 
course varchar(20) default("DE"),
fees decimal(10,2) not null,
 age varchar(15) check(age >= 20),
 mail varchar(20) unique);  
 
 #insert into the table
insert into student(std_id,std_name,fees,age,mail) values(101,"Trisha",12000,23,"tri@gmail.com");
select * from student;
insert into student(std_name,fees,age,mail) values("Dinesh",15000,27,"din@gmail.com");
insert into student(std_name,fees,age,mail) values("Dakshu",16000,20,"dak@gmail.com");
select * from student;

use test;
#creating another table
create table Trainer
(trainer_id int primary key,
trainer_name varchar(30) unique not null,
std_id int , 
foreign key (std_id) 
references student(std_id));

#insert into the table
insert into Trainer(trainer_id, trainer_name,std_id)
values(1,"ram",101),(2,"Meena",102),(3,"Raja",null);

select * from trainer;
select * from student;

insert into student(std_name,fees,age,mail) values("kavi",17000,27,"kavi@gmail.com");
insert into student(std_name,fees,age,mail) values("aish",18000,28,"aish@gmail.com");

insert into Trainer(trainer_id, trainer_name,std_id)
values(4,"ravi",104),(5,"radha",105),(6,"ri",106);

# Functions
-- upper() function
select trainer_id ,upper(Trainer_name) as Upper_name from Trainer;

-- Length() function
select trainer_id ,trainer_name,length(Trainer_name) as len_name ,std_id from Trainer;
 
 -- concat() function
 select concat(trainer_id ,' - ', trainer_name) as Trainer_Details  from Trainer;
 
 -- substring()
 select trainer_id,substring(trainer_name , 1, 2)as first_two_characters from Trainer ;
 
 -- instr() - tells the position of the alphabet
 select trainer_id,instr(trainer_name,	'a')as position from Trainer;
 
 -- curdate() - returns current system date
 select curdate() as todays_Date;

 select now() as Current_Date_Time;
 
 select curtime() as Current_TimeSystem;
 -- CAST
 # cast - convert number to char
 select trainer_id, cast(trainer_id as char)as trainer_id_text from trainer;

# cast - decimals converted into integer
select cast(1250.95 as signed) as converted_value;

#cast - convert text to date
SELECT CAST('2026-07-06' AS DATE) AS Joining_Date;

-- CONVERT

-- Convert - Convert Number to Character
select std_name ,
 fees,
 convert(fees,char) as converted_fees
 from Student;

-- Convert Text to Date
SELECT CONVERT('2026-09-15', DATE) AS Holiday_Date;
-- Convert Decimal to Integer
select convert(fees , signed) as integer_value from student; 

select * from student;

insert into student(std_name,fees,age,mail)values("meena",13000,30,"meena@gmail.com");

# ifnull
# The IFNULL() function returns a specified value if the expression is NULL.
# Otherwise, it returns the original value
select std_name, fees , ifnull(fees,0) as bonus_amount from student;

# nullif
# The NULLIF() function compares two values.
#• If both values are equal, it returns NULL.
#• If they are different, it returns the first value.
select std_name, fees, nullif(fees, 15000)as result from student;