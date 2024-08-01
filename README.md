```markdown
# Restaurant Management System Database

## Overview

This project implements a relational database for managing the operations of a restaurant, covering data related to customers, employees, orders, suppliers, and utilities. The system is designed to manage core areas of restaurant management, such as reservations, billing, staff attendance, and more.

## Database Structure

### 1. Restaurant Information
- **Table: RESTAURANT**
  - Manages restaurant details.
  - **Columns**: `Rest_Id`, `Rest_Name`, `Rest_Address`, `Rest_Contact`

### 2. Customer Management
- **Table: CUSTOMERS**
  - Stores customer details, table assignments, and dining dates.
  - **Columns**: `Cust_Id`, `Cust_Name`, `Cust_Email`, `Cust_Address`, `Cust_Table_No`, `Cust_Dinning_date`

### 3. Employee Management

#### Managers
- **Table: MANAGERS**
  - Stores manager details, associated with the restaurant.
  - **Columns**: `Manager_Id`, `Rest_Id`, `Manager_Name`, `Manager_Address`, `Manager_Join_Date`, `Manager_Contact`

#### Waiters
- **Table: WAITERS**
  - Details of waiters, linked to their respective managers.
  - **Columns**: `Waiter_Id`, `Manager_Id`, `Waiter_Name`, `Waiter_Address`, `Waiter_Join_Date`, `Waiter_Contact`

#### Chefs
- **Table: CHEFS**
  - Stores chef details, linked to their respective managers.
  - **Columns**: `Chef_Id`, `Manager_Id`, `Chef_Name`, `Chef_Address`, `Chef_Join_Date`, `Chef_Contact`

### 4. Order Management

#### Orders
- **Table: ORDERS**
  - Stores information about customer orders, including waiter assignments.
  - **Columns**: `Order_Id`, `Cust_Id`, `Waiter_Id`, `No_of_items`, `Order_type`

#### Order Items
- **Table: ITEMINORDER**
  - Manages the relationship between orders and items.
  - **Columns**: `Order_Id`, `Item_Id`

### 5. Menu Items

#### Items
- **Table: ITEMS**
  - Stores menu items and their prices.
  - **Columns**: `Item_Id`, `Item_Name`, `Item_Price`

#### Raw Materials in Items
- **Table: RAWINITEM**
  - Links raw materials to menu items.
  - **Columns**: `Item_Id`, `Raw_Id`

### 6. Suppliers and Raw Materials

#### Suppliers
- **Table: SUPPLIERS**
  - Stores supplier details.
  - **Columns**: `Supplier_Id`, `Supplier_Name`

#### Raw Materials
- **Table: RAW_MATERIALS**
  - Manages raw material details, linked to suppliers.
  - **Columns**: `Raw_Id`, `Supplier_Id`, `Raw_Name`, `Raw_Expiery`, `Raw_Quantity`

### 7. Billing

- **Table: BILL**
  - Manages billing details, linked to orders.
  - **Columns**: `Bill_Id`, `Order_Id`, `Bill_Method`, `Bill_Date`, `Bill_Time`

### 8. Feedback

- **Table: FEEDBACK**
  - Stores customer feedback on food quality and restaurant services.
  - **Columns**: `FeedBack_Id`, `Cust_Id`, `Food_Quality`, `Suggestion`, `Res_Services`

### 9. Salaries

- **Table: SALARIES**
  - Manages monthly salaries for managers, chefs, and waiters.
  - **Columns**: `Date_Month`, `Manager_Id`, `Chef_Id`, `Waiter_Id`, `Manager_salary`, `Chef_salary`, `Waiter_salary`

### 10. Utilities

- **Table: UTILITIES**
  - Stores monthly utility bills (Electricity, Water, Gas) for the restaurant.
  - **Columns**: `Utl_Month`, `Rest_Id`, `Electricity_Bill`, `Water_Bill`, `Gas_Bill`

### 11. Reservations

- **Table: RESERVATIONS**
  - Manages customer reservations.
  - **Columns**: `Res_Id`, `Res_date`, `Cust_Id`, `rest_time`, `personcount`

### 12. Employee Attendance

- **Table: ATTENDANCE**
  - Tracks daily attendance for managers, chefs, and waiters.
  - **Columns**: `Manager_Id`, `Chef_Id`, `Waiter_Id`, `At_Date`, `At_Day`, `Att_Manager`, `Att_Chef`, `Att_Waiter`

## Installation and Setup

### Create the Database:

```sql
CREATE DATABASE Restaurant_Management;
USE Restaurant_Management;
```

### Create Tables:

- Execute the provided SQL script to create all tables and relationships.

### Insert Data:

- Use the provided `INSERT` statements to populate the database with sample data.

## Usage

- **Querying Data**: Use SQL `SELECT` statements to query and interact with the database.
- **Managing Relationships**: The database supports complex relationships such as many-to-many relationships for chefs preparing multiple orders and raw materials used in multiple items.

## Note

- The program is designed for educational purposes and may not be suitable for production without modifications and enhancements.
- The user interface is text-based, running entirely in a console window.

## Authors

- **Umair Munir**
- **Qirab Hassan**
- **Omar Ikarm**

---

**💻 Keep coding, keep improving—every line you write brings you closer to mastering the craft. 🚀**
```
