CREATE DATABASE EmployeeManagement;
USE EmployeeManagement;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY auto_increment,  
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    ManagerID INT
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL,
    HiringDate DATE NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    DepartmentID INT,
    Position VARCHAR(50) NOT NULL
);

CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    SalaryAmount DECIMAL(10,2) NOT NULL CHECK (SalaryAmount >= 0),
    SalaryDate DATE NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
);
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    AttendanceDate DATE NOT NULL
    );
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(150) NOT NULL,
    ProjectStartDate DATE NOT NULL,
    ProjectEndDate DATE,
    ProjectBudget DECIMAL(12,2) NOT NULL CHECK (ProjectBudget >= 0),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
CREATE TABLE Employee_Projects(
	RecordId INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    ProjectID INT NOT NULL,
    RoleinProject varchar(100) NOT NULL,
    AssignmentDate DATE NOT NULL
)

