-- Question 1 Achieving 1NF (First Normal Form)
-- SQL query to transform ProductDetail table into 1 Normalization Form, ensuring that each row represents a single product for an order.
-- Query to create a database for our table:
CREATE DATABASE shopdb;

-- Query to create table ProductDetail:
USE shopdb;

CREATE TABLE ProductDetail(
OrderId INT,
CustomerName VARCHAR(100),
Products VARCHAR(100)
);

-- Query to transform ProductDetail table into 1NF  
USE shopdb;

INSERT INTO ProductDetail(OrderId, CustomerName, Products)
VALUES (101, "John Doe", "Laptop"),
(101, "John Doe", "Mouse"),
(102, "Jane Smith", "Tablet"),
(102, "Jane Smith", "Keyboard"),
(102, "Jane Smith", "Mouse"),
(103, "Emily Clarke", "Phone");



-- SQL query to transform OrderDetails table into 2NF by removing partial dependencies.
-- Query to create database to populate with OrderDetails table:
CREATE DATABASE storedb;

-- Query to create Customers Table to eliminate partial dependecies in OrderDetails:
USE storedb;

CREATE TABLE orders(
OrderId INT PRIMARY KEY,
CustomerName VARCHAR(100)
);

-- Query to populate Customers Table:
USE storedb;

INSERT INTO orders (OrderId, CustomerName)
VALUES (101, "John Doe"),
(102, "Jane Smith"),
(103, "Emily Smmith");

-- Query to create OrderDetails table (It references the Customers table using the CustomerId column which is a foreign key):
USE storedb;

CREATE TABLE product(
productId INT primary key,
productName VARCHAR(100),
quantity INT,
orderid INT,
FOREIGN KEY (orderid) REFERENCES orders(OrderId)
);

-- Query to populate OrderDetails table with values:
USE storedb;

INSERT INTO product(productId, productName, quantity, orderid)
VALUES (1, "Laptop", 2, 101),
(2, "Mouse", 1, 101),
(3, "Tablet", 3, 102),
(4, "Keyboard", 2, 102),
(5, "Mouse", 1, 102),
(6, "Phone", 1, 103);



