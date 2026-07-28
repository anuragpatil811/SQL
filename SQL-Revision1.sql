CREATE DATABASE business;
USE business; 
CREATE TABLE customers(
cid int PRIMARY KEY,
cname varchar(50),
city varchar(50)
);
CREATE TABLE Products(
product_id int PRIMARY KEY,
product_name varchar(50),
category varchar(50),
price float
);
CREATE TABLE Orders(
order_id int PRIMARY KEY,
 cid int,
product_id int,
FOREIGN KEY(cid) REFERENCES customers(cid),
FOREIGN KEY(product_id) REFERENCES Products(product_id),
amount float 
);
INSERT INTO customers(cid, cname, city) VALUES
(1, "Customer_1", "Mumbai"),
(2, "Customer_2", "Delhi"),
(3, "Customer_3", "Bangalore"),
(4, "Customer_4", "Pune"),
(5, "Customer_5", "Chennai"),
(6, "Customer_6", "Mumbai"),
(7, "Customer_7", "Delhi"),
(8, "Customer_8", "Bangalore"),
(9, "Customer_9", "Pune"),
(10, "Customer_10", "Chennai");

INSERT INTO Products(product_id, product_name, category, price) VALUES
(1, "Product_1", "Electronics", 7542.50),
(2, "Product_2", "Clothing", 199.99),
(3, "Product_3", "Furniture", 3480.00),
(4, "Product_4", "Sports", 2150.75),
(5, "Product_5", "Books", 450.60),
(6, "Product_6", "Electronics", 8899.20),
(7, "Product_7", "Clothing", 750.25),
(8, "Product_8", "Furniture", 6280.40),
(9, "Product_9", "Sports", 1300.10),
(10, "Product_10", "Books", 825.45);
INSERT INTO Orders(order_id, cid, product_id, amount) values
(1, 23, 15, 799.98),
(2, 45, 87, 6280.40),
(3, 12, 34, 10440.00),
(4, 67, 138, 1180.30),
(5, 89, 62, 3601.00),
(6, 34, 195, 355.80),
(7, 5, 11, 258.21),
(8, 76, 99, 4512.50),
(9, 51, 143, 2595.60),
(10, 8, 20, 573.60);
#Display top 3 highest spending cities
