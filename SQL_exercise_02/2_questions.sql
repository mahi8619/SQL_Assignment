 
create database exercise22db;

use exercise22db;

CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);

INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);

select * from employees;


-- 2.1 Select the last name of all employees.
-- 2.2 Select the last name of all employees, without duplicates.
-- 2.3 Select all the data of employees whose last name is "Smith".
-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
-- 2.5 Select all the data of employees that work in department 14.
-- 2.6 Select all the data of employees that work in department 37 or department 77.
-- 2.7 Select all the data of employees whose last name begins with an "S".
-- 2.8 Select the sum of all the departments' budgets.
-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).
-- 2.10 Select all the data of employees, including each employee's department's data.
-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
-- 2.13 Select the departments with a budget larger than the average budget of all the departments.
-- 2.14 Select the names of departments with more than two employees.
-- 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.
-- 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
-- And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
-- 2.17 Reduce the budget of all departments by 10%.
-- 2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
-- 2.19 Delete from the table all employees in the IT department (code 14).
-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
-- 2.21 Delete from the table all employees.

select * from deparments;

