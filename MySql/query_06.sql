CREATE TABLE empl (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Salary DECIMAL(10, 2),
    deptid INT
);

CREATE TABLE Depart (
    deptid INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Empl(EmployeeID, EmployeeName, Salary, Deptid) VALUES
(1, 'John Doe', 5000, 1),
(2, 'Jane Smith', 7000, 1),
(3, 'Mark Johnson', 6000, 2),
(4, 'Linda White', 8000, 3),
(5, 'Robert Brown', 4500, 2);

INSERT INTO Depart (deptid, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

-- Query 1: Employees with a salary higher than anyone in deptid 2
SELECT EmployeeName, Salary
FROM Empl
WHERE Salary > ANY (SELECT Salary FROM Empl WHERE deptid = 2);

-- Query 2: Employees with a salary higher than everyone in deptid 1
SELECT EmployeeName, Salary
FROM Empl
WHERE Salary > ALL (SELECT Salary FROM Empl WHERE deptid = 1);

select * from emp1;
select dname from dept where deptNo = (select deptNo from emp1 where ename = 'smith'); 
select * from dept;

select dname , loc from dept where deptNo = (select deptNo from emp1 where ename = 'King');

select loc from dept where deptNo = (select deptNo from emp1 where empNo = 7902);

select dname, loc, deptNo from dept where deptNo in (select deptNo from emp1 where ename like'%R');

select  ename, sal from emp1 where deptNo = (select deptNo from dept where dname = 'accounting')
and sal > (select sal from emp1 where ename = 'scott');

select * from emp1 where job = 'Manager' and
 deptNo= (select deptNo from dept where loc = 'chicago');


select ename, sal from emp1 where deptno in (select deptNo from dept where dname = 'Accounting') 
and sal > (select sal from emp1 where ename = 'king');