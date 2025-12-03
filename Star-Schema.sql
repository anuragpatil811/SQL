CREATE DATABASE star_schema;
USE star_schema;
CREATE TABLE Fact_Sales(
    Sales_Rep_ID INT NOT NULL,
    Time_ID INT NOT NULL,
    Customer_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Net_amount_per_customer INT NOT NULL DEFAULT 0,
    Net_amount_per_product INT NOT NULL DEFAULT 0,
    Net_amount_per_promotion INT NOT NULL DEFAULT 0
);
INSERT INTO Fact_Sales (Sales_Rep_ID, Time_ID, Customer_ID, Product_ID, Net_amount_per_customer, Net_amount_per_product, Net_amount_per_promotion) 
VALUES
(1, 7, 2, 3, 6, 0, 0),
(2, 9, 10, 5, 8, 0, 0),
(3, 6, 5, 7, 1, 0, 0),
(4, 1, 8, 9, 3, 0, 0),
(5, 10, 7, 1, 9, 0, 0),
(6, 4, 1, 10, 7, 0, 0),
(7, 8, 3, 8, 10, 0, 0),
(8, 2, 4, 6, 2, 0, 0),
(9, 5, 6, 4, 5, 0, 0),
(10, 3, 9, 2, 4, 0, 0);

SELECT * FROM Fact_Sales;
CREATE TABLE Dim_Sales_Rep(
    Sales_Rep_ID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(30) NOT NULL,
    Deal VARCHAR(30) NOT NULL,
    Discount INT NOT NULL
);
INSERT INTO Dim_Sales_Rep (Sales_Rep_ID, Name, Deal, Discount) VALUES
(1, 'Manish', 'Yes', 20),
(2, 'Shabnam', 'Yes', 15),
(3, 'Pratik', 'No', 30),
(4, 'Rajesh', 'No', 7),
(5, 'Mitali', 'Yes', 10),
(6, 'Priyal', 'Yes', 13),
(7, 'Sachin', 'No', 19),
(8, 'Amit', 'Yes', 10),
(9, 'Rutuja', 'No', 8),
(10, 'Shreyani', 'Yes', 15);
SELECT * FROM Dim_Sales_Rep;
CREATE TABLE Dim_Time(
    Time_ID INT NOT NULL PRIMARY KEY,
    Day VARCHAR(30) NOT NULL,
    Month VARCHAR(30) NOT NULL,
    Year INT NOT NULL
);
INSERT INTO Dim_Time (Time_ID, Day, Month, Year) VALUES
(1, 'Monday', 'Jan', 2010),
(2, 'Tuesday', 'Feb', 2011),
(3, 'Wednesday', 'March', 2012),
(4, 'Thursday', 'April', 2016),
(5, 'Friday', 'May', 2017),
(6, 'Monday', 'June', 2019),
(7, 'Tuesday', 'July', 2011),
(8, 'Wednesday', 'Oct', 2014),
(9, 'Thursday', 'Nov', 2016),
(10, 'Friday', 'Dec', 2021);
SELECT * FROM Dim_Time;
CREATE TABLE Dim_Customer(
    Customer_ID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(30) NOT NULL,
    Billing_Address VARCHAR(60) NOT NULL,
    Shipping_Address VARCHAR(60) NOT NULL
);
INSERT INTO Dim_Customer (Customer_ID, Name, Billing_Address, Shipping_Address) VALUES
(1, 'Neha', 'abc', 'abc'),
(2, 'Ved', 'def', 'def'),
(3, 'Sameer', 'ghi', 'ghi'),
(4, 'Taniya', 'jki', 'jki'),
(5, 'Anvi', 'mno', 'mno'),
(6, 'Rohit', 'pqr', 'pqr'),
(7, 'Ayansh', 'stu', 'xyz'),
(8, 'Anjali', 'vu', 'stu'),
(9, 'Piyu', 'abc', 'xyz'),
(10, 'Anju', 'xyz', 'xyz');
SELECT * FROM Dim_Customer;
CREATE TABLE Dim_Product(
    Product_ID INT NOT NULL PRIMARY KEY,
    Product_Number INT NOT NULL,
    Type VARCHAR(30) NOT NULL,
    Quality VARCHAR(30) NOT NULL,
    Price INT NOT NULL,
    Requested_Ship_Date DATE NOT NULL
);
INSERT INTO Dim_Product (Product_ID, Product_Number, Type, Quality, Price, Requested_Ship_Date) VALUES
(1, 101, 'Mouse', 'A1', 700, '2022-09-16'),
(2, 102, 'Keyboard', 'A1', 1500, '2022-08-09'),
(3, 103, 'RAM', 'A1', 5000, '2022-08-01'),
(4, 104, 'USB cable', 'A1', 600, '2022-07-23'),
(5, 105, 'Pendrive', 'A1', 800, '2022-07-11'),
(6, 106, 'Hard Disk', 'A1', 4000, '2022-06-24'),
(7, 107, 'Charger', 'A1', 500, '2022-04-08'),
(8, 108, 'Ethernet Cable', 'A1', 1200, '2022-03-12'),
(9, 109, 'Graphic Card', 'A1', 6000, '2022-02-16'),
(10, 110, 'Printer', 'A1', 6500, '2022-01-01');
SELECT * FROM Dim_Product;
CREATE TABLE Dim_Order(
    Order_ID INT NOT NULL PRIMARY KEY,
    Order_Number INT NOT NULL,
    Order_Date DATE NOT NULL,
    Amount INT NOT NULL
);
INSERT INTO Dim_Order (Order_ID, Order_Number, Order_Date, Amount) VALUES
(11, 1001, '2022-09-16', 1),
(12, 1002, '2022-08-09', 2),
(13, 1003, '2022-08-01', 6),
(14, 1004, '2022-07-23', 1),
(15, 1005, '2022-07-11', 2),
(16, 1006, '2022-06-24', 3),
(17, 1007, '2022-04-08', 1),
(18, 1008, '2022-03-12', 3),
(19, 1009, '2022-02-16', 4),
(20, 1010, '2022-01-01', 1);

SELECT * FROM Dim_Order;
SELECT 
    c.Name AS 'Customer Name', 
    SUM(DISTINCT p.Price) AS Net_amount_per_customer
FROM 
    Fact_Sales f
    JOIN Dim_Product p ON f.Product_ID = p.Product_ID
    JOIN Dim_Customer c ON f.Customer_ID = c.Customer_ID
GROUP BY 
    c.Name;
SELECT 
    f.Product_ID, 
    SUM(p.Price) AS Net_amount_per_product
FROM 
    Fact_Sales f
    JOIN Dim_Product p ON f.Product_ID = p.Product_ID
GROUP BY 
    f.Product_ID;
    
SELECT 
    s.Name AS 'Salesperson/Promoter Name', 
    SUM(p.Price) AS Net_amount_per_promotion
FROM 
    Fact_Sales f
    JOIN Dim_Product p ON f.Product_ID = p.Product_ID
    JOIN Dim_Sales_Rep s ON f.Sales_Rep_ID = s.Sales_Rep_ID
GROUP BY 
    s.Name;
