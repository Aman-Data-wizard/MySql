CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Departments(
	DepartmentID INT PRIMARY KEY auto_increment,
    DepartmentName varchar(20) NOT NULL,
    ManagerID INT
);

CREATE TABLE Employees(
	EmployeeID INT PRIMARY KEY auto_increment,
    Emp_Name varchar(20) NOT NULL,
    Email varchar(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    DepartmentID INT,
    Position varchar(20),
    foreign key (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Salaries(
	SalaryID INT PRIMARY KEY auto_increment,
    EmployeeID INT,
    SalaryDate DATE NOT NULL,
    foreign key(EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Attendance (
	AttendanceID INT PRIMARY KEY auto_increment,
    EmployeeID INT,
    Atten_Date DATE NOT NULL,
    Status ENUM('Present', 'Absent', 'Leave') NOT NULL,
    foreign key(EmployeeID)  REFERENCES Employees(EmployeeID)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(30) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    Budget DECIMAL(15,2),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE EmployeeProjects (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    ProjectID INT,
    Role VARCHAR(30),
    AssignmentDate DATE NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

-- Task 2 Data Insertion:
INSERT INTO Departments (DepartmentName, ManagerID) VALUES
('HR', NULL),
('IT', NULL),
('Finance', NULL),
('Marketing', NULL),
('Operations', NULL);

INSERT INTO Employees (Emp_name, Email, Phone, HireDate, Salary, DepartmentID, Position) VALUES
('Alice Johnson', 'alice@example.com', '1234567890', '2023-01-15', 60000, 1, 'HR Manager'),
('Bob Marley', 'bob@example.com', '1234567891', '2022-03-10', 70000, 2, 'Software Engineer'),
('Charlie Brown', 'charlie@example.com', '1234567892', '2021-06-20', 50000, 3, 'Accountant'),
('David Wilson', 'david@example.com', '1234567893', '2020-09-05', 55000, 2, 'IT Support'),
('Eva Davis', 'eva@example.com', '1234567894', '2023-11-11', 62000, 4, 'Marketing Analyst');

INSERT INTO Salaries (EmployeeID, SalaryID, SalaryDate) VALUES
(1, 60000, '2024-01-01'),
(2, 70000, '2024-01-01'),
(3, 50000, '2024-01-01'),
(4, 55000, '2024-01-01'),
(5, 62000, '2024-01-01');

INSERT INTO Attendance (EmployeeID, Atten_Date, Status) VALUES
(1, '2024-02-01', 'Present'),
(2, '2024-02-01', 'Absent'),
(3, '2024-02-01', 'Present'),
(4, '2024-02-01', 'Leave'),
(5, '2024-02-01', 'Present');

INSERT INTO Projects (ProjectName, StartDate, EndDate, Budget, DepartmentID) VALUES
('Website Revamp', '2024-01-01', '2024-06-30', 50000, 2),
('HR Training Program', '2024-02-01', '2024-07-31', 20000, 1),
('Financial Audit', '2024-03-01', '2024-08-31', 30000, 3),
('Marketing Campaign', '2024-04-01', '2024-09-30', 40000, 4),
('Logistics Optimization', '2024-05-01', '2024-10-31', 35000, 5);

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, Role, AssignmentDate) VALUES
(1, 2, 'Coordinator', '2024-02-01'),
(2, 1, 'Developer', '2024-01-15'),
(3, 3, 'Auditor', '2024-03-10'),
(4, 1, 'Tester', '2024-01-20'),
(5, 4, 'Marketing Lead', '2024-04-10');

-- Queries for Task 3
-- 1. Retrieve all employees and their department names
SELECT Employees.EmployeeID, Employees.Emp_Name, Departments.DepartmentName 
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- 2. Find all employees who were hired before 2023-01-01
SELECT * FROM Employees WHERE HireDate < '2023-01-01';

-- 3. List all employees with a salary greater than 50,000
SELECT * FROM Employees WHERE Salary > 50000;

-- 4. Count how many employees are in each department
SELECT Departments.DepartmentName, COUNT(Employees.EmployeeID) AS EmployeeCount 
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
GROUP BY Departments.DepartmentName;

-- 5. Find all projects assigned to the "IT" department
SELECT Projects.* FROM Projects
JOIN Departments ON Projects.DepartmentID = Departments.DepartmentID
WHERE Departments.DepartmentName = 'IT';

-- Queries for Task 4

-- 1. Display employee names, their project names, and their roles
SELECT Employees.Name, Projects.ProjectName, EmployeeProjects.Role
FROM EmployeeProjects
JOIN Employees ON EmployeeProjects.EmployeeID = Employees.EmployeeID
JOIN Projects ON EmployeeProjects.ProjectID = Projects.ProjectID;

-- 2. Show the total salary paid per department
SELECT Departments.DepartmentName, SUM(Employees.Salary) AS TotalSalary
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
GROUP BY Departments.DepartmentName;

-- 3. Find employees who were absent more than 3 times in the last 30 days
SELECT Employees.Name, COUNT(*) AS Absences
FROM Attendance
JOIN Employees ON Attendance.EmployeeID = Employees.EmployeeID
WHERE Status = 'Absent' AND AttendanceDate >= CURDATE() - INTERVAL 30 DAY
GROUP BY Employees.EmployeeID
HAVING COUNT(*) > 3;

-- 4. Identify the department with the highest number of employees
SELECT DepartmentName FROM Departments
ORDER BY (SELECT COUNT(*) FROM Employees WHERE Employees.DepartmentID = Departments.DepartmentID) DESC
LIMIT 1;

-- 5. Show employees whose salaries are above the department's average salary
SELECT Employees.Name, Employees.Salary, Departments.DepartmentName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Employees.Salary > (SELECT AVG(Salary) FROM Employees WHERE DepartmentID = Employees.DepartmentID);

-- Queries for Task 5

-- 1. Find employees whose names start with 'A'
SELECT * FROM Employees WHERE Emp_Name LIKE 'A%';

-- 2. Calculate the number of years each employee has worked in the company
SELECT Emp_Name, TIMESTAMPDIFF(YEAR, HireDate, CURDATE()) AS YearsWorked FROM Employees;

-- 3. Retrieve projects that started in the last 6 months
SELECT * FROM Projects WHERE StartDate >= CURDATE() - INTERVAL 6 MONTH;

-- 4. Display employees who haven’t been assigned any projects
SELECT Employees.Emp_Name FROM Employees
LEFT JOIN EmployeeProjects ON Employees.EmployeeID = EmployeeProjects.EmployeeID
WHERE EmployeeProjects.EmployeeID IS NULL;

