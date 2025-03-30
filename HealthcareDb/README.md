# Healthcare Appointment Booking System

## Overview

This project is a **Healthcare Appointment Booking System** built using SQL. It helps manage patient records, doctor information, and appointment scheduling efficiently.

## Features

✅ **Patient Management** - Store patient details including name, email, phone, and address.  
✅ **Doctor Management** - Maintain doctor records with their specialty.  
✅ **Appointment Scheduling** - Allow patients to book, reschedule, or cancel appointments.  
✅ **Stored Procedures** - Automate appointment booking and cancellations.  
✅ **Views for Insights** - Retrieve upcoming appointments quickly.

## Database Schema

The system consists of the following tables:

1. **Patients** - Stores patient details.
2. **Doctors** - Stores doctor information.
3. **Appointments** - Manages scheduled appointments.

## SQL Procedures

### Stored Procedures:

- **`ScheduleAppointment(patient_id, doctor_id, appointment_date)`** - Books an appointment for a patient.
- **`CancelAppointment(appointment_id)`** - Cancels an appointment.

### Views:

- **`UpcomingAppointments`** - Retrieves all upcoming scheduled appointments.

## Installation

1. Clone this repository:
   ```sh
   git clone https://github.com/UdhayaParameshwaran-ai/sql/HealthcareDb.git
   ```
2. Import the `HealthcareDb.sql` file into your MySQL database.
3. Run the stored procedures and test with sample data.

## Sample Data

```sql
INSERT INTO Patients (name, email, phone, date_of_birth, address) VALUES ('John Doe', 'john@example.com', '1234567890', '1990-05-10', '123 Main St, City');
INSERT INTO Doctors (name, specialty, email, phone) VALUES ('Dr. Smith', 'Cardiologist', 'drsmith@example.com', '9876543210');
CALL ScheduleAppointment(1, 1, '2025-04-05 10:00:00');
```

## Author

**Udhaya parameshwaran** | [GitHub](https://github.com/UdhayaParameshwaran-ai)

## License

This project is licensed under the MIT License.
