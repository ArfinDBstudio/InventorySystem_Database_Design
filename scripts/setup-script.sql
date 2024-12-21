-- Drop tables if they already exist
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE "Inventory" CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE "product " CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE "supplier" CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE "Order" CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE "Customer " CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- Create the Customer table
CREATE TABLE "Customer " (
    "Customer id" VARCHAR2(20),
    "Name" VARCHAR2(15),
    "Address" VARCHAR2(50),
    "Phone Number" NUMBER(15),
    CONSTRAINT "PK_Customer" PRIMARY KEY ("Customer id")
);

-- Create an index on Customer table
CREATE INDEX "Customer_Key" ON "Customer " ("Name", "Address", "Phone Number");

-- Insert sample data into Customer table
INSERT INTO "Customer " ("Customer id", "Name", "Address", "Phone Number") VALUES
('CUST001', 'John Doe', '123 Elm Street', 9876543210);
INSERT INTO "Customer " ("Customer id", "Name", "Address", "Phone Number") VALUES
('CUST002', 'Jane Smith', '456 Oak Avenue', 9123456780);
INSERT INTO "Customer " ("Customer id", "Name", "Address", "Phone Number") VALUES
('CUST003', 'Alice Johnson', '789 Pine Road', 9988776655);

-- Create the Order table
CREATE TABLE "Order" (
    "orderID" VARCHAR2(20),
    "product id" VARCHAR2(15),
    "orderDate" DATE,
    "CustomerID" VARCHAR2(20),
    "Totalamount" NUMBER(10, 2),
    CONSTRAINT "PK_Order" PRIMARY KEY ("orderID"),
    CONSTRAINT "FK_Order_Customer" FOREIGN KEY ("CustomerID") REFERENCES "Customer " ("Customer id")
);

-- Create an index on Order table
CREATE INDEX "Order_Key" ON "Order" ("orderDate", "Totalamount");

-- Insert sample data into Order table
INSERT INTO "Order" ("orderID", "product id", "orderDate", "CustomerID", "Totalamount") VALUES
('ORD001', 'PROD001', TO_DATE('2024-12-01', 'YYYY-MM-DD'), 'CUST001', 150.50);
INSERT INTO "Order" ("orderID", "product id", "orderDate", "CustomerID", "Totalamount") VALUES
('ORD002', 'PROD002', TO_DATE('2024-12-02', 'YYYY-MM-DD'), 'CUST002', 200.00);
INSERT INTO "Order" ("orderID", "product id", "orderDate", "CustomerID", "Totalamount") VALUES
('ORD003', 'PROD003', TO_DATE('2024-12-03', 'YYYY-MM-DD'), 'CUST003', 300.75);

-- Create the Supplier table
CREATE TABLE "supplier" (
    "Supplier id" VARCHAR2(10),
    "Supplier name" VARCHAR2(20),
    "Contact Number" NUMBER(15),
    "Address" VARCHAR2(50),
    CONSTRAINT "PK_Supplier" PRIMARY KEY ("Supplier id")
);

-- Create an index on Supplier table
CREATE INDEX "Supplier_Key" ON "supplier" ("Supplier name", "Contact Number", "Address");

-- Insert sample data into Supplier table
INSERT INTO "supplier" ("Supplier id", "Supplier name", "Contact Number", "Address") VALUES
('SUP001', 'ABC Supplies', 9871234567, '12 Industrial Zone');
INSERT INTO "supplier" ("Supplier id", "Supplier name", "Contact Number", "Address") VALUES
('SUP002', 'XYZ Traders', 9981234567, '45 Market Street');
INSERT INTO "supplier" ("Supplier id", "Supplier name", "Contact Number", "Address") VALUES
('SUP003', 'PQR Distributors', 9129876543, '78 Warehouse Drive');

-- Create the Product table
CREATE TABLE "product " (
    "product id" VARCHAR2(15),
    "Name" VARCHAR2(15),
    "Description" VARCHAR2(30),
    "Quantity" NUMBER(10),
    "price" NUMBER(10, 2),
    "category" VARCHAR2(10),
    "Supplier id" VARCHAR2(10),
    CONSTRAINT "PK_Product" PRIMARY KEY ("product id"),
    CONSTRAINT "FK_Product_Supplier" FOREIGN KEY ("Supplier id") REFERENCES "supplier" ("Supplier id")
);

-- Create an index on Product table
CREATE INDEX "Product_Key" ON "product " ("Name", "Description", "Quantity", "price", "category");

-- Insert sample data into Product table
INSERT INTO "product " ("product id", "Name", "Description", "Quantity", "price", "category", "Supplier id") VALUES
('PROD001', 'Laptop', 'High-performance laptop', 10, 1000.00, 'Electronics', 'SUP001');
INSERT INTO "product " ("product id", "Name", "Description", "Quantity", "price", "category", "Supplier id") VALUES
('PROD002', 'Smartphone', 'Latest model smartphone', 20, 700.00, 'Electronics', 'SUP002');
INSERT INTO "product " ("product id", "Name", "Description", "Quantity", "price", "category", "Supplier id") VALUES
('PROD003', 'Headphones', 'Wireless headphones', 50, 150.00, 'Accessories', 'SUP003');

-- Create the Inventory table
CREATE TABLE "Inventory" (
    "inventory id" VARCHAR2(10),
    "product id" VARCHAR2(15),
    "Quantity available" NUMBER(10),
    CONSTRAINT "PK_Inventory" PRIMARY KEY ("inventory id"),
    CONSTRAINT "FK_Inventory_Product" FOREIGN KEY ("product id") REFERENCES "product " ("product id")
);

-- Create an index on Inventory table
CREATE INDEX "Inventory_Key" ON "Inventory" ("Quantity available");

-- Insert sample data into Inventory table
INSERT INTO "Inventory" ("inventory id", "product id", "Quantity available") VALUES
('INV001', 'PROD001', 8);
INSERT INTO "Inventory" ("inventory id", "product id", "Quantity available") VALUES
('INV002', 'PROD002', 15);
INSERT INTO "Inventory" ("inventory id", "product id", "Quantity available") VALUES
('INV003', 'PROD003', 45);
