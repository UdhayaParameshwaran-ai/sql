-- Create Database
CREATE DATABASE HealthcareDB;
USE HealthcareDB;

-- Create Table for Patients
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    date_of_birth DATE,
    address TEXT
);

-- Create Table for Doctors
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialty VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Create Table for Appointments
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Create Procedure to Schedule an Appointment
DELIMITER //
CREATE PROCEDURE ScheduleAppointment(IN p_id INT, IN d_id INT, IN a_date DATETIME)
BEGIN
    INSERT INTO Appointments (patient_id, doctor_id, appointment_date) 
    VALUES (p_id, d_id, a_date);
END //
DELIMITER ;

-- Create Procedure to Cancel an Appointment
DELIMITER //
CREATE PROCEDURE CancelAppointment(IN a_id INT)
BEGIN
    UPDATE Appointments SET status = 'Cancelled' WHERE appointment_id = a_id;
END //
DELIMITER ;

-- Create View for Upcoming Appointments
CREATE VIEW UpcomingAppointments AS
SELECT a.appointment_id, p.name AS patient_name, d.name AS doctor_name, a.appointment_date, a.status 
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE a.status = 'Scheduled';

-- Sample Data Insertion
INSERT INTO Patients (name, email, phone, date_of_birth, address) VALUES ('John Doe', 'john@example.com', '1234567890', '1990-05-10', '123 Main St, City');
INSERT INTO Doctors (name, specialty, email, phone) VALUES ('Dr. Smith', 'Cardiologist', 'drsmith@example.com', '9876543210');
CALL ScheduleAppointment(1, 1, '2025-04-05 10:00:00');
