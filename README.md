# Inventory Management System Database

## Overview
This project provides an Inventory Management System database implemented in **Oracle DB**. It contains tables for managing customers, orders, suppliers, products, and inventory, and includes setup scripts, sample data, and queries to interact with the database.

---

## Features

### Schema Design
1. **Customer Table:** Stores customer information.
   - Columns: Customer ID, Name, Address, Phone Number.
2. **Order Table:** Captures order details linked to customers and products.
   - Columns: Order ID, Product ID, Order Date, Customer ID, Total Amount.
3. **Supplier Table:** Manages supplier details.
   - Columns: Supplier ID, Supplier Name, Contact Number, Address.
4. **Product Table:** Maintains product details with supplier relationships.
   - Columns: Product ID, Name, Description, Quantity, Price, Category, Supplier ID.
5. **Inventory Table:** Tracks inventory levels for products.
   - Columns: Inventory ID, Product ID, Quantity Available.

### Key Features
- **Primary Keys:** Ensure unique identification of records.
- **Foreign Keys:** Establish relationships between tables (e.g., orders and customers).
- **Indexes:** Optimize queries on key columns.
- **Sample Data:** Preloaded example records for quick testing.
- **Comprehensive Queries:** Includes CRUD operations and advanced data retrieval.

---

## Setup Instructions

### Prerequisites
- **Oracle Database** (installed and running).
- **SQL Developer** or any Oracle-compatible SQL client.

### Steps to Set Up
1. Open your Oracle SQL client.
2. Execute the `setup.sql` script to create tables and insert sample data.
   ```sql
   @setup.sql
   ```
3. Run `queries.sql` to test queries and interact with the database.

---

## Sample Queries
Here are some example operations included in `queries.sql`:

- **Retrieve all customers:**
  ```sql
  SELECT * FROM "Customer ";
  ```
- **Get all orders with customer details:**
  ```sql
  SELECT
      O."orderID",
      O."orderDate",
      O."Totalamount",
      C."Name" AS CustomerName,
      C."Address" AS CustomerAddress
  FROM
      "Order" O
  JOIN
      "Customer " C
  ON
      O."CustomerID" = C."Customer id";
  ```
- **Insert a new product:**
  ```sql
  INSERT INTO "product " ("product id", "Name", "Description", "Quantity", "price", "category", "Supplier id")
  VALUES ('PROD004', 'Tablet', 'Latest generation tablet', 25, 500.00, 'Electronics', 'SUP001');
  ```

---

## Files Included

1. **`setup.sql`:**
   - Creates the database schema and inserts sample data.
2. **`queries.sql`:**
   - Contains SQL queries for data manipulation and retrieval.

---

## Relationships Between Tables

- **Customer to Order:** One-to-Many (One customer can place multiple orders).
- **Order to Product:** Many-to-One (Multiple orders can include the same product).
- **Product to Supplier:** Many-to-One (Multiple products can belong to one supplier).
- **Product to Inventory:** One-to-One (Each product has one inventory record).

---

## Usage Scenarios

- **Business Use Case:**
  - Track customers, their orders, and products sold.
  - Monitor supplier details and ensure inventory levels are sufficient.
- **Data Analysis:**
  - Calculate total sales per customer.
  - Identify low-stock products.
  - Find the most expensive product.

---

## How to Contribute
Feel free to fork this repository, improve the scripts, or add new features. Open a pull request to share your changes!

---

## License
This project is licensed under the MIT License.

---

## Author
**Mohamed Arfin**

---

## Contact
For any questions or feedback, feel free to reach out via GitHub or email.

