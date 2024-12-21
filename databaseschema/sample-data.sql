--1) CUSTOMER TABLE
INSERT INTO "Customer " ("Customer id", "Name", "Address", "Phone Number") VALUES
('CUST001', 'John Doe', '123 Elm Street', 9876543210),
('CUST002', 'Jane Smith', '456 Oak Avenue', 9123456780),
('CUST003', 'Alice Johnson', '789 Pine Road', 9988776655);

--2)ORDER TABLE
INSERT INTO "Order" ("orderID", "product id", "orderDate", "CustomerID", "Totalamount") VALUES
('ORD001', 'PROD001', '2024-12-01', 'CUST001', 150.50),
('ORD002', 'PROD002', '2024-12-02', 'CUST002', 200.00),
('ORD003', 'PROD003', '2024-12-03', 'CUST003', 300.75);

--3)SUPPLIER TABLE
INSERT INTO "supplier" ("Supplier id", "Supplier name", "Contact Number", "Address") VALUES
('SUP001', 'ABC Supplies', 9871234567, '12 Industrial Zone'),
('SUP002', 'XYZ Traders', 9981234567, '45 Market Street'),
('SUP003', 'PQR Distributors', 9129876543, '78 Warehouse Drive');
 --4)PRODUCT TABLE
 INSERT INTO "product " ("product id", "Name", "Description", "Quantity", "price", "category", "Supplier id") VALUES
('PROD001', 'Laptop', 'High-performance laptop', 10, 1000.00, 'Electronics', 'SUP001'),
('PROD002', 'Smartphone', 'Latest model smartphone', 20, 700.00, 'Electronics', 'SUP002'),
('PROD003', 'Headphones', 'Wireless headphones', 50, 150.00, 'Accessories', 'SUP003');
 
--5)INVENTORY TABLE
INSERT INTO "Inventory" ("inventory id", "product id", "Quantity available") VALUES
('INV001', 'PROD001', 8),
('INV002', 'PROD002', 15),
('INV003', 'PROD003', 45);
