-- Create Database
CREATE DATABASE EcommerceDB;
USE EcommerceDB;

-- Create Table for Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT
);

-- Create Table for Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10,2),
    stock INT
);

-- Create Table for Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Table for Order Items
CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Create Procedure to Place an Order
DELIMITER //
CREATE PROCEDURE PlaceOrder(IN cust_id INT)
BEGIN
    INSERT INTO Orders (customer_id, total_amount) VALUES (cust_id, 0);
    
    SET @order_id = LAST_INSERT_ID();
    
    SELECT @order_id AS order_id;
END //
DELIMITER ;

-- Create Procedure to Update Order Status
DELIMITER //
CREATE PROCEDURE UpdateOrderStatus(IN o_id INT, IN new_status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled'))
BEGIN
    UPDATE Orders SET status = new_status WHERE order_id = o_id;
END //
DELIMITER ;

-- Create Trigger to Reduce Stock on Order Placement
DELIMITER //
CREATE TRIGGER ReduceStock
AFTER INSERT ON OrderItems
FOR EACH ROW
BEGIN
    UPDATE Products SET stock = stock - NEW.quantity WHERE product_id = NEW.product_id;
END //
DELIMITER ;

-- Create View for Pending Orders
CREATE VIEW PendingOrders AS
SELECT * FROM Orders WHERE status = 'Pending';

-- Sample Data Insertion
INSERT INTO Customers (name, email, phone, address) VALUES ('Alice Johnson', 'alice@example.com', '9876543210', '123 Main St, City');
INSERT INTO Products (name, description, price, stock) VALUES ('Laptop', 'Gaming Laptop', 1200.00, 10);
CALL PlaceOrder(1);
