CREATE TABLE "Customer " (
  "Customer id" Varchar(20),
  "Name" Varchar(15),
  "Address" Varchar(50),
  "Phone Number" Number,
  PRIMARY KEY ("Customer id")
);

CREATE INDEX "Key" ON  "Customer " ("Name", "Address", "Phone Number");

CREATE TABLE "Order" (
  "orderID" Varchar(20),
  "product id" varchar(15),
  "orderDate" Date,
  "CustomerID" Varchar(20),
  "Totalamount" Number,
  PRIMARY KEY ("orderID")
);

CREATE INDEX "Key" ON  "Order" ("orderDate", "Totalamount");

CREATE TABLE "supplier" (
  "Supplier id" Varchar(10),
  "Supplier name" varchat(20),
  "Contact Number" Number,
  "Address" Varchar(50),
  PRIMARY KEY ("Supplier id")
);

CREATE INDEX "Key" ON  "supplier" ("Supplier name", "Contact Number", "Address");

CREATE TABLE "product " (
  "product id" Varchar(15),
  "Name" varchar(15),
  "Description" varchar(30),
  "Quantity" Number,
  "price" Number,
  "category" Varchar(10),
  "Supplier id" Varchar(10),
  PRIMARY KEY ("product id")
);

CREATE INDEX "Key" ON  "product " ("Name", "Description", "Quantity", "price", "category");

CREATE TABLE "Inventory" (
  "inventory id" Varchar(10),
  "product id" Varchar(15),
  "Quantity available" Number,
  PRIMARY KEY ("inventory id")
);

CREATE INDEX "Key" ON  "Inventory" ("Quantity available");

