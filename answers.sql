-- Question 1 Achieving 1NF (First Normal Form)
-- SQL query to transform ProductDetail table into 1 Normalization Form, ensuring that each row represents a single product for an order.
-- Query to create a database for our table:
CREATE DATABASE shopdb;

-- Query to create table ProductDetail:
USE shopdb;

CREATE TABLE ProductDetail(
OrderId INT,
CustomerName VARCHAR(50),
Product VARCHAR(10)
);

-- Query to transform ProductDetail table into 1NF  
USE shopdb;

INSERT INTO ProductDetail(OrderId, CustomerName, Product)
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

CREATE TABLE Customers(
CustomerId INT PRIMARY KEY,
CustomerName VARCHAR(50)
);

-- Query to populate Customers Table:
USE storedb;

INSERT INTO Customers(CustomerId, CustomerName)
VALUES (1, "John Doe"),
(2, "Jane Smith"),
(3, "Emily Smmith");

-- Query to create OrderDetails table (It references the Customers table using the CustomerId column which is a foreign key):
USE storedb;

CREATE TABLE OrderDetails(
OrderId INT,
CustomerId INT,
Product VARCHAR(10),
Quantity INT,
FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

-- Query to populate OrderDetails table with values:
USE storedb;

INSERT INTO OrderDetails(OrderId, CustomerId, Product, Quantity)
VALUES (101, 1, "Laptop", 2),
(101, 1, "Mouse", 1),
(102, 2, "Tablet", 3),
(102, 2, "Keyboard", 1),
(102, 2, "Mouse", 2),
(103, 3, "Phone", 1);



