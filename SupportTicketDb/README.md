# Support Ticket Management System

## Overview

This project is a **Support Ticket Management System** built using SQL. It helps businesses manage customer support requests efficiently by tracking ticket status and responses.

## Features

✅ **Customer Management** - Store customer details including name, email, and phone.  
✅ **Ticket Tracking** - Allow customers to submit and track support tickets.  
✅ **Status Management** - Track ticket status (Open, In Progress, Resolved, Closed).  
✅ **Automated Procedures** - Create and update tickets using stored procedures.  
✅ **Data Insights** - Retrieve pending tickets using SQL views.

## Database Schema

The system consists of the following tables:

1. **Customers** - Stores customer details.
2. **Tickets** - Stores ticket information, including status and issue description.
3. **Responses** - Tracks customer support responses to tickets.

## SQL Procedures

### Stored Procedures:

- **`CreateTicket(customer_id, issue_description)`** - Creates a new support ticket.
- **`UpdateTicketStatus(ticket_id, new_status)`** - Updates the status of a ticket.
- **`AddResponse(ticket_id, response_text)`** - Adds a response to a ticket.

### Views:

- **`PendingTickets`** - Retrieves all unresolved tickets.

## Installation

1. Clone this repository:
   ```sh
   git clone https://github.com/UdhayaParameshwaran-ai/Sql/SupportTicketDb.git
   ```
2. Import the `SupportTicketDb.sql` file into your MySQL database.
3. Run the stored procedures and test with sample data.

## Sample Data

```sql
INSERT INTO Customers (name, email, phone) VALUES ('John Doe', 'john@example.com', '1234567890');
CALL CreateTicket(1, 'Unable to login to the system');
CALL UpdateTicketStatus(1, 'In Progress');
CALL AddResponse(1, 'We are looking into your issue.');
```

## Author

**Udhaya parameshwaran** | [GitHub](https://github.com/UdhayaParameshwaran-ai)

## License

This project is licensed under the MIT License.
