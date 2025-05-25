# ✈️ Airline Management System

A full-stack airline reservation and operations backend built with **Python + MySQL + Oracle JDBC**, simulating real-world airline workflows like flight booking, payments, food ordering, and ticket cancellations.

---

## 🧠 Overview

This CLI-based project replicates key airline system functionalities including:

- 👤 Passenger registration  
- 🛫 Flight management  
- 🧾 Ticket booking and fare calculation  
- 💳 Payments with discount logic  
- 🍱 Optional in-flight food ordering  
- 📡 Live flight status view  
- ❌ Ticket cancellation and partial refund  
- 🔍 Search & sort flights with filters  

All data is stored in a **normalized MySQL schema** with proper **primary/foreign key constraints**, ensuring referential integrity and efficient querying.

---

## 🛠 Tech Stack

| Category          | Tools/Technologies            |
|-------------------|-------------------------------|
| Language          | `Python 3`                    |
| Database          | `MySQL`                       |
| Integration       | `MySQL Connector for Python, Oracle JDBC Driver`  |
| Interface         | `Command Line Interface (CLI), MySQL`|
| Design Concepts   | Relational DB, PK/FK, Joins, Normalization |

---

## 📁 Modules & Features

### 👤 Passenger Management
- Add passengers with name, phone, age, Aadhar, and email
- Stored in `passenger` table with validations

### 🛫 Flight & Airline Module
- Add airlines with flight number, type, schedule, and price
- Relationships established with ticket and passenger tables

### 🧾 Ticket Booking System
- Book flights by choosing source, destination, date
- Generates unique PNR, allocates seat
- Calculates price based on distance and extras

### 💳 Payment & Discount Engine
- Payment via UPI / Cards / GPay
- Discounts:
  - ₹3000–₹5000 → 5%
  - ₹5000–₹10000 → 10%

### 🍱 In-flight Food Ordering
- Select meals during ticket booking
- Meals are airline-specific

### 📡 Real-Time Flight Status
- View current status/location of a flight by airline ID

### 🔍 Flight Search & Filters
- Sort flights by:
  - Price (low-high, high-low)
  - Duration (shortest/longest)

### ❌ Ticket Cancellation
- 50% refund on cancellation
- Deletes booking from all linked tables

---

## 🧱 Sample Database Schema

```sql
CREATE TABLE passenger (
    passenger_id INT PRIMARY KEY,
    f_name VARCHAR(15),
    l_name VARCHAR(15),
    phnum INT,
    age INT,
    address VARCHAR(50),
    email VARCHAR(50),
    aadhar_num INT NOT NULL
);

More tables: airline, ticket, payments, discount, food, available_flights, flight_status, source, destination, etc.
```

---
## Sample Working Screenshots
![1_passenger](https://github.com/user-attachments/assets/097def1a-abdb-499f-8802-276873051688)
![2_airlines](https://github.com/user-attachments/assets/f69283ad-6a31-40a3-bc3d-04bf84d06a60)
![3_source](https://github.com/user-attachments/assets/9b0dea80-78f4-4e3c-a37a-3765f7d4889a)
![16_cancellation](https://github.com/user-attachments/assets/de879072-970e-44e0-a5b1-0cd3298a37da)
![HOMEPAGE](https://github.com/user-attachments/assets/3abe0bd0-fc21-4694-a472-1c96be3142ba)
![INDEXPAGE](https://github.com/user-attachments/assets/bdd05c34-07f2-4686-88cb-e2aa40ca4bef)
![initial_output](https://github.com/user-attachments/assets/833024a7-f4ea-4f79-81f9-b01cd72fd5f7)


## 🚀 How to Run

```bash
# 1. Start MySQL Server

# 2. Create the database and import schema
mysql -u root -p < MainTables.sql

# 3. Run the Python backend
python3 airline_system.py
```


## 🤹‍♂️ What I Learned

- 📘 Real-world DB design with relational integrity  
- 🔄 Integrating Python scripts with live MySQL transactions  
- 💼 Modeling operational workflows in backend systems  
- 🧪 Building CLI tools for real-time booking logic  

---

## 📌 Ideal For

- Data Engineering & Backend Interviews  
- SQL schema design showcase  
- Demonstrating Python-MySQL integration skills  
