create database assignment2;
use assignment2;
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

/*Q.1Select the last name of all employees.*/
select lastname from employees;

/*Q.2Select the last name of all employees, without duplicates.*/
select distinct(lastname) from employees;

/*Q.3Select all the data of employees whose last name is "Smith".*/
select * from employees where lastname="smith";

/*Q.4Select all the data of employees whose last name is "Smith" or "Doe".*/
select * from employees where lastname="smith" || lastname="doe";

/*Q.5Select all the data of employees that work in department 14.*/
select * from employees where department=14;

/*Q.6Select all the data of employees that work in department 37 or department 77.*/
select *from employees where department=37 || department=77;

/*Q.7Select all the data of employees whose last name begins with an "S".*/
select * from employees where lastname like "s%";

/*Q.8Select the sum of all the departments' budgets.*/
select department,sum(budget) as "total budget"
from departments left join employees
on departments.code=employees.department
group by department;

/*Q.9Select the number of employees in each department (you only need to show the department code and the number of employees).*/
select code,count(departments.name)
from departments left join employees
on departments.code=employees.department
group by code;

/*Q.10 Select all the data of employees, including each employee's department's data.*/
select * from  employees join departments
on employees.department=departments.code;

/*Q.11Select the name and last name of each employee, along with the name and budget of the employee's department.*/
select employees.name,lastname,departments.name,budget 
from employees join departments
on employees.department=departments.code;

/*Q.12Select the name and last name of employees working for departments with a budget greater than $60,000.*/
select employees.name,lastname,budget
from employees join departments
on employees.department=departments.code
where budget>60000;

/*Q.13 Select the departments with a budget larger than the average budget of all the departments.*/
select * from departments where budget>(select avg(budget) from departments);

/*Q.14Select the names of departments with more than two employees.*/
select departments.name,count(employees.name)
from departments join employees
on departments.code=employees.department
group by departments.name
having count(employees.name)>2;

/*Q.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.*/
select name,lastname from employees where department in(select code from departments where budget >min(budget)) GROUP BY name;

/*Q.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11.And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.*/
insert into departments (code,name,budget)
values(11,"quality assurance",40000);

insert into employees(SSN,Name,LastName,Department)
values(887-21-9811,"mary","moore",11);

/*Q.17 Reduce the budget of all departments by 10%.*/
update departments set budget = (budget-(budget*0.1));
select budget from departments;

/*Q.18. Reassign all employees from the Research department (code 77) to the IT department (code 14).*/
update employees set department=14 where department=77;

/*Q.19 Delete from the table all employees in the IT department (code 14).*/
delete from employees where department=14;

/*Q.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.*/
delete from employees where department in(select budget from departments where budget>60000);
/*Q.21Delete from the table all employees.*/
delete from employees;