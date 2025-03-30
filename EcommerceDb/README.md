# E-Commerce Order Management System

## Overview

This project is a SQL-based **E-Commerce Order Management System** that helps manage customers, products, orders, and order items efficiently. The system includes stored procedures, triggers, and views to automate processes and improve order management.

## Features

✅ **Customer Management** - Store customer details like name, email, phone, and address.  
✅ **Product Management** - Manage product inventory with price and stock availability.  
✅ **Order Processing** - Place and update orders with status tracking.  
✅ **Order Items Handling** - Maintain order details, including quantity and price.  
✅ **Stock Management** - Automatically reduce product stock when an order is placed.  
✅ **Database Views** - Retrieve pending orders for quick processing.

## Database Schema

The system consists of the following tables:

1. **Customers** - Stores customer details.
2. **Products** - Stores product information.
3. **Orders** - Stores order records linked to customers.
4. **OrderItems** - Stores product details linked to orders.

## SQL Procedures and Triggers

### Stored Procedures:

- **`PlaceOrder(cust_id)`** - Creates a new order for a customer.
- **`UpdateOrderStatus(order_id, new_status)`** - Updates the status of an order.

### Triggers:

- **`ReduceStock`** - Reduces product stock after an order is placed.

### Views:

- **`PendingOrders`** - Retrieves all pending orders.

## Installation

1. Clone this repository:
   ```sh
   git clone https://github.com/UdhayaParameshwaran-ai/sql/EcommerceDb.git
   ```
2. Import the `EcommerceDb.sql` file into your MySQL database.
3. Run the stored procedures and test with sample data.

## Sample Data

```sql
INSERT INTO Customers (name, email, phone, address) VALUES ('Alice Johnson', 'alice@example.com', '9876543210', '123 Main St, City');
INSERT INTO Products (name, description, price, stock) VALUES ('Laptop', 'Gaming Laptop', 1200.00, 10);
CALL PlaceOrder(1);
```

## Author

**Udhaya parameshwaran** | [GitHub](https://github.com/UdhayaParameshwaran-ai)

## License

This project is licensed under the MIT License.
