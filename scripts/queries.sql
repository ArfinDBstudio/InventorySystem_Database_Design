-- 1. Retrieve all customers
SELECT * FROM "Customer ";

-- 2. Get all orders with customer details
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

-- 3. Retrieve all products and their supplier details
SELECT 
    P."product id", 
    P."Name" AS ProductName, 
    P."Description", 
    P."Quantity", 
    P."price", 
    S."Supplier name", 
    S."Address" AS SupplierAddress 
FROM 
    "product " P
JOIN 
    "supplier" S 
ON 
    P."Supplier id" = S."Supplier id";

-- 4. Find total inventory quantity for all products
SELECT 
    P."Name" AS ProductName, 
    I."Quantity available" 
FROM 
    "product " P
JOIN 
    "Inventory" I 
ON 
    P."product id" = I."product id";

-- 5. Insert a new customer
INSERT INTO "Customer " ("Customer id", "Name", "Address", "Phone Number") 
VALUES ('CUST004', 'Robert Brown', '999 Willow Lane', 9876547890);

-- 6. Insert a new product
INSERT INTO "product " ("product id", "Name", "Description", "Quantity", "price", "category", "Supplier id") 
VALUES ('PROD004', 'Tablet', 'Latest generation tablet', 25, 500.00, 'Electronics', 'SUP001');

-- 7. Update the quantity of a product in inventory
UPDATE "Inventory"
SET "Quantity available" = 20
WHERE "inventory id" = 'INV001';

-- 8. Delete a customer by ID
DELETE FROM "Customer "
WHERE "Customer id" = 'CUST004';

-- 9. Find orders placed after a specific date
SELECT * FROM "Order"
WHERE "orderDate" > TO_DATE('2024-12-01', 'YYYY-MM-DD');

-- 10. Find all suppliers located in a specific area
SELECT * FROM "supplier"
WHERE "Address" LIKE '%Market Street%';

-- 11. Calculate total sales per customer
SELECT 
    C."Name" AS CustomerName, 
    SUM(O."Totalamount") AS TotalSales 
FROM 
    "Order" O
JOIN 
    "Customer " C 
ON 
    O."CustomerID" = C."Customer id"
GROUP BY 
    C."Name";

-- 12. Check low inventory products (less than 10 available)
SELECT 
    P."Name" AS ProductName, 
    I."Quantity available" 
FROM 
    "Inventory" I
JOIN 
    "product " P 
ON 
    I."product id" = P."product id"
WHERE 
    I."Quantity available" < 10;

-- 13. List all customers who placed an order for a specific product
SELECT 
    C."Name" AS CustomerName, 
    P."Name" AS ProductName, 
    O."orderDate" 
FROM 
    "Order" O
JOIN 
    "Customer " C 
ON 
    O."CustomerID" = C."Customer id"
JOIN 
    "product " P 
ON 
    O."product id" = P."product id"
WHERE 
    P."Name" = 'Laptop';

-- 14. Find the most expensive product
SELECT * 
FROM "product "
WHERE "price" = (SELECT MAX("price") FROM "product ");

-- 15. Count the total number of products in inventory
SELECT COUNT(*) AS TotalProducts 
FROM "product ";
