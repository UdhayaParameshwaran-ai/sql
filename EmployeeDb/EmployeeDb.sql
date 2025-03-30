-- Create Database
CREATE DATABASE EmployeeDB;
USE EmployeeDB;

-- Create Table for Employees
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    position VARCHAR(100),
    salary DECIMAL(10,2)
);

-- Create Table for Attendance
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    check_in TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    check_out TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Create Table for Payroll
CREATE TABLE Payroll (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    month VARCHAR(20),
    year INT,
    total_days_worked INT,
    total_salary DECIMAL(10,2),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Create Procedure to Record Attendance
DELIMITER //
CREATE PROCEDURE RecordAttendance(IN emp_id INT)
BEGIN
    INSERT INTO Attendance (employee_id) VALUES (emp_id);
END //
DELIMITER ;

-- Create Procedure to Calculate Payroll
DELIMITER //
CREATE PROCEDURE CalculatePayroll(IN emp_id INT, IN month_name VARCHAR(20), IN year_val INT)
BEGIN
    DECLARE days_worked INT;
    SELECT COUNT(*) INTO days_worked FROM Attendance WHERE employee_id = emp_id AND MONTH(check_in) = MONTH(STR_TO_DATE(month_name, '%M')) AND YEAR(check_in) = year_val;
    
    INSERT INTO Payroll (employee_id, month, year, total_days_worked, total_salary)
    SELECT emp_id, month_name, year_val, days_worked, (days_worked * salary / 30)
    FROM Employees WHERE employee_id = emp_id;
END //
DELIMITER ;

-- Sample Data Insertion
INSERT INTO Employees (name, email, phone, position, salary) VALUES ('Alice Johnson', 'alice@example.com', '9876543210', 'Software Engineer', 60000.00);
CALL RecordAttendance(1);
CALL CalculatePayroll(1, 'March', 2025);
