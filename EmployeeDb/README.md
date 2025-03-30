# Employee Attendance & Payroll System

## Overview

This project is a SQL-based **Employee Attendance and Payroll System** that helps businesses track employee attendance and calculate payroll efficiently. It includes stored procedures to manage attendance records and automate salary calculations.

## Features

✅ **Employee Management** - Store employee details like name, email, phone, position, and salary.  
✅ **Attendance Tracking** - Record employee check-ins and check-outs.  
✅ **Payroll Calculation** - Compute monthly salaries based on attendance.  
✅ **Automated Procedures** - Simplifies payroll processing with stored procedures.  
✅ **Data Integrity** - Ensures proper linking between attendance and payroll.

## Database Schema

The system consists of the following tables:

1. **Employees** - Stores employee details.
2. **Attendance** - Tracks employee attendance records.
3. **Payroll** - Maintains payroll details for each employee.

## SQL Procedures

### Stored Procedures:

- **`RecordAttendance(emp_id)`** - Records an employee’s attendance.
- **`CalculatePayroll(emp_id, month_name, year_val)`** - Computes the salary for an employee based on their attendance.

## Installation

1. Clone this repository:
   ```sh
   git clone https://github.com/UdhayaParameshwaran-ai/sql/EmployeeDb.git
   ```
2. Import the `EmployeeDb.sql` file into your MySQL database.
3. Run the stored procedures and test with sample data.

## Sample Data

```sql
INSERT INTO Employees (name, email, phone, position, salary) VALUES ('Alice Johnson', 'alice@example.com', '9876543210', 'Software Engineer', 60000.00);
CALL RecordAttendance(1);
CALL CalculatePayroll(1, 'March', 2025);
```

## Author

**Udhaya parameshwaran** | [GitHub](https://github.com/UdhayaParameshwaran-ai)

## License

This project is licensed under the MIT License.
