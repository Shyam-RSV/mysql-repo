-- table creation college
create table clg (
    id int primary key,
    reg int,
    clgname varchar(200),
    place varchar(200),
    deptNo int);

-- create table students
create table student (
    id int primary key,
    regNo int,
    dept varchar(100),
    deptNo int);

-- insert data to clg
insert into clg(id, reg, clgname, place, deptNo) values
(1, 7001, 'Jaya', 'KK Nagar', 01);
insert into clg(id, reg, clgname, place, deptNo) values
(2, 7002, 'Srm', 'Potheri', 02);
insert into clg(id, reg, clgname, place, deptNo) values
(3, 7003, 'Cresent', 'Vandalur', 03);
insert into clg(id, reg, clgname, place, deptNo) values
(4, 7004, 'Sairam', 'Tambaram', 04);
insert into clg(id, reg, clgname, place, deptNo) values
(5, 7005, 'Sathyabama', 'Pallavaram', 05);

-- insert data to students
insert into student(id, regNo, dept, deptNo) values
(1, 100, 'CSE', 01);
insert into student(id, regNo, dept, deptNo) values
(2, 105, 'EIE', 02);
insert into student(id, regNo, dept, deptNo) values
(3, 110, 'B.Com', 03);

select * from clg;
select * from student;

-- Limit 
select * from clg LIMIT 3;

-- In
select * from clg where place in ('Vandalur', 'potheri');

-- insert new column to table
alter table student add StuName varchar(200);

-- delete entire column in table 
alter table student drop column StuName;

-- Inner join in table clg and student

select c.reg, c.clgname, s.dept from clg as c
inner join student as s on c.deptNo = s.deptNo;

-- Union in table

select deptNo from clg union select deptNo from student;

-- insert specific column in table
insert into student (id, dept) values
(4, 'MBA');

-- delete row with null
delete from student where regNo is null;
select * from student;

