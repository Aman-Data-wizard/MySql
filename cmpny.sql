CREATE DATABASE COMPANYDB;
USE COMPANYDB;

CREATE TABLE Employees(
EmployeeID INT PRIMARY KEY auto_increment,
Firstname varchar(10),
Lastname varchar(10),
Age INT,
DepartmentID INT,
Salary DECIMAL(10,5)
);

CREATE TABLE Departments(
DepartmentId INT PRIMARY KEY auto_increment,
DepartmentName varchar(100)
);

INSERT INTO Departments(DepartmentName) VALUES ("HR", "IT", "Finance");
INSERT INTO Employees(Firstname, Lastname, Age, DepartmentID, Salary )
VALUES 
('John', 'Doe', 30, 2, 60000.00),
('Jane', 'Smith', 28, 1, 55000.00),
('Alice', 'Johnson', 35, 3, 70000.00);
SELECT * FROM Employees;