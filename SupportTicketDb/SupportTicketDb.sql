-- Create Database
CREATE DATABASE SupportTicketDB;
USE SupportTicketDB;

-- Create Table for Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Create Table for Support Tickets
CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    subject VARCHAR(255),
    description TEXT,
    status ENUM('Open', 'In Progress', 'Resolved', 'Closed') DEFAULT 'Open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Procedure to Raise a Ticket
DELIMITER //
CREATE PROCEDURE RaiseTicket(IN cust_id INT, IN subj VARCHAR(255), IN descr TEXT)
BEGIN
    INSERT INTO Tickets (customer_id, subject, description)
    VALUES (cust_id, subj, descr);
END //
DELIMITER ;

-- Create Procedure to Update Ticket Status
DELIMITER //
CREATE PROCEDURE UpdateTicketStatus(IN t_id INT, IN new_status ENUM('Open', 'In Progress', 'Resolved', 'Closed'))
BEGIN
    UPDATE Tickets SET status = new_status WHERE ticket_id = t_id;
END //
DELIMITER ;

-- Create View to Check Open Tickets
CREATE VIEW OpenTickets AS
SELECT * FROM Tickets WHERE status = 'Open';

-- Create Trigger to Log Ticket Updates
DELIMITER //
CREATE TRIGGER TicketUpdateLog
AFTER UPDATE ON Tickets
FOR EACH ROW
BEGIN
    INSERT INTO TicketLogs(ticket_id, old_status, new_status, updated_at)
    VALUES (OLD.ticket_id, OLD.status, NEW.status, NOW());
END //
DELIMITER ;

-- Create Table for Ticket Logs
CREATE TABLE TicketLogs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    ticket_id INT,
    old_status ENUM('Open', 'In Progress', 'Resolved', 'Closed'),
    new_status ENUM('Open', 'In Progress', 'Resolved', 'Closed'),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ticket_id) REFERENCES Tickets(ticket_id)
);

-- Sample Data Insertion
INSERT INTO Customers (name, email, phone) VALUES ('John Doe', 'john@example.com', '1234567890');
CALL RaiseTicket(1, 'Login Issue', 'Unable to log in with correct credentials.');
