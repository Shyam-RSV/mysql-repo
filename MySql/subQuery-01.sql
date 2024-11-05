-- Create the employee table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    empname VARCHAR(50),
    jobDesc VARCHAR(100),
    salary DECIMAL(10, 2),
    branchId INT
);

-- Insert 7 rows into the employee table
INSERT INTO employee (emp_id, empname, jobDesc, salary, branchId) 
VALUES (1, 'John Doe', 'Software Engineer', 75000.00, 101);
INSERT INTO employee (emp_id, empname, jobDesc, salary, branchId) 
VALUES (2, 'Jane Smith', 'Data Analyst', 68000.00, 102);
INSERT INTO employee (emp_id, empname, jobDesc, salary, branchId) 
VALUES (3, 'Mike Brown', 'Project Manager', 90000.00, 103);
INSERT INTO employee (emp_id, empname, jobDesc, salary, branchId) 
VALUES (4, 'Sara Lee', 'UX Designer', 65000.00, 102);
INSERT INTO employee (emp_id, empname, jobDesc, salary, branchId) 
VALUES (5, 'Emily White', 'DevOps Engineer', 80000.00, 101);
INSERT INTO employee (emp_id, empname, jobDesc, salary, branchId) 
VALUES (6, 'Robert Black', 'System Admin', 70000.00, 102);
INSERT INTO employee (emp_id, empname, jobDesc, salary, branchId) 
VALUES (7, 'Anna Blue', 'Marketing Manager', 72000.00, 103);

select * from employee;

-- Create the branch table
CREATE TABLE branches (
    branchId INT PRIMARY KEY,
    branchName VARCHAR(50),
    branchAddr VARCHAR(100)
);

-- Insert 3 rows into the branch table
INSERT INTO branches (branchId, branchName, branchAddr) 
VALUES (101, 'Chennai', '123 Main St');
INSERT INTO branches (branchId, branchName, branchAddr) 
VALUES (102, 'Bangalore', '456 Sunset Blvd');
INSERT INTO branches (branchId, branchName, branchAddr) 
VALUES (103, 'Bombay', '789 Lakeshore Dr');

select * from branches;

select empName from employee where branchid =   
(select branchid from branches where branchname = 'chennai');

select * from employee as e where exists 
(select 1 from branches as b where b.branchId = e.branchid and branchId >= 102);

-- Insert into select
CREATE TABLE employeesIIS (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE employee_archive (
    archive_id INT PRIMARY KEY,
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO employeesIIS (employee_id, first_name, last_name, department)
VALUES (1, 'John', 'Doe', 'HR');

INSERT INTO employeesIIS (employee_id, first_name, last_name, department)
VALUES (2, 'Jane', 'Smith', 'Finance');

INSERT INTO employeesIIS (employee_id, first_name, last_name, department)
VALUES (3, 'Michael', 'Brown', 'HR');

INSERT INTO employeesIIS (employee_id, first_name, last_name, department)
VALUES (4, 'Emily', 'Davis', 'IT');

INSERT INTO employeesIIS (employee_id, first_name, last_name, department)
VALUES (5, 'David', 'Wilson', 'Marketing');

select * from employeesIIS;


insert into employee_archive(archive_id, employee_id, first_name, last_name, department)
select employee_id, employee_id, first_name, last_name, department from employeesIIS
where 1 limit 3;

delete from employee_archive where employee_id between 1 and 5;
select * from employee_archive;

select * from employee;

-- case
select empname, salary,
case
    when salary > 78000 then 'You are approved for marraige'
    when salary < 78000 then 'Work hard'
    else 'Go and get a job first'

end as marraigeApproval
from employee;
select * from employee;

-- null function 
select * from frnds;

insert into frnds(id, name, age, place) VALUES
(5, 'Thomas', 25,  'Puluthiur');

delete from frnds where deptNo is null;

select deptNo from frnds where id = 5;

select name, (age + ifnull(salary, 0)) as investments from frnds;
update frnds set deptNo = 25 where id = 5;
