# Book Shop Inventory Management Database

This repository contains SQL scripts for managing a book shop's inventory. It includes schema definitions, sample data insertion, queries, stored procedures, views, and a trigger.

## Schema Description

### Tables:
1. **customer**: Stores customer details such as ID, name, city, street, email, and mobile number.
2. **payment**: Holds payment methods used by customers.
3. **receipt**: Records receipts with book names and associated payment IDs.
4. **publisher**: Contains publisher information like name, ID, city, street, email, and mobile number.
5. **author**: Stores author details including name, ID, city, street, and mobile number.
6. **books**: Manages book information including name, ISBN, quantity, price, type, and title.

### Views:
- **CreditCardCustomers**: Lists customers who made payments via credit card.
- **ReceiptInfo**: Displays receipt details including receipt ID, book name, and payment ID.

### Stored Procedure:
- **ExampleProcedure**: Determines if the total quantity of books in stock exceeds a threshold, providing feedback on the stock status.

### Trigger:
- **books_after_insert**: Triggers an action after inserting a new record into the `books` table, demonstrating automated processes based on new data entries.

## Usage
1. **Database Creation**: Execute `CREATE DATABASE book_shop_inventory_management;` to create the database.
2. **Schema Definition**: Run SQL scripts to create tables (`customer`, `payment`, etc.), views (`CreditCardCustomers`, `ReceiptInfo`), stored procedures (`ExampleProcedure`), and triggers (`books_after_insert`).
3. **Data Population**: Insert sample data into tables (`INSERT INTO table_name VALUES (...)`).
4. **Querying**: Use SQL queries to retrieve information (`SELECT * FROM table_name`) or execute stored procedures (`CALL ExampleProcedure();`).
5. **Maintenance**: Modify schema, add new features, or enhance existing functionality as needed.

## Contributors
- Hardika Tandel

 
