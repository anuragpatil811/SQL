CREATE DATABASE Snowflake;
USE Snowflake;
CREATE TABLE Dim_Product_Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(255) NOT NULL,
    Parent_Category_ID INT NULL,
    FOREIGN KEY (Parent_Category_ID) REFERENCES Dim_Product_Category(Category_ID)
);
CREATE TABLE Dim_Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(255) NOT NULL,
    Brand VARCHAR(100),
    Category_ID INT,
    Price DECIMAL(10, 2),
    Stock_Quantity INT,
    FOREIGN KEY (Category_ID) REFERENCES Dim_Product_Category(Category_ID)
);
CREATE TABLE Dim_Customer_Segment (
    Segment_ID INT PRIMARY KEY,
    Segment_Name VARCHAR(100) NOT NULL
);
CREATE TABLE Dim_Address (
    Address_ID INT PRIMARY KEY,
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    Postal_Code VARCHAR(20)
);
CREATE TABLE Dim_Customer (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR(100),
    Last_Name VARCHAR(100),
    Email VARCHAR(255),
    Gender VARCHAR(10),
    Age INT,
    Segment_ID INT,
    Address_ID INT,
    FOREIGN KEY (Segment_ID) REFERENCES Dim_Customer_Segment(Segment_ID),
    FOREIGN KEY (Address_ID) REFERENCES Dim_Address(Address_ID)
);
CREATE TABLE Dim_Date (
    Date_ID INT PRIMARY KEY,
    Date DATE NOT NULL,
    Day INT,
    Month INT,
    Year INT,
    Quarter INT,
    Weekday VARCHAR(50)
);
CREATE TABLE Dim_Campaign (
    Campaign_ID INT PRIMARY KEY,
    Campaign_Name VARCHAR(255),
    Start_Date_ID INT,
    End_Date_ID INT,
    Discount DECIMAL(5, 2),
    FOREIGN KEY (Start_Date_ID) REFERENCES Dim_Date(Date_ID),
    FOREIGN KEY (End_Date_ID) REFERENCES Dim_Date(Date_ID)
);

CREATE TABLE Dim_Browsing_Behavior (
    Browsing_Session_ID INT PRIMARY KEY,
    Customer_ID INT,
    Session_Start_Time TIMESTAMP,
    Session_End_Time TIMESTAMP,
    Referrer VARCHAR(255),
    Device_Type VARCHAR(50),
    Pages_Viewed INT,
    FOREIGN KEY (Customer_ID) REFERENCES Dim_Customer(Customer_ID)
);
CREATE TABLE Fact_Transactions (
    Transaction_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Date_ID INT,
    Campaign_ID INT,
    Quantity INT,
    Total_Amount DECIMAL(10, 2),
    Payment_Method VARCHAR(50),
    Browsing_Session_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Dim_Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Dim_Product(Product_ID),
    FOREIGN KEY (Date_ID) REFERENCES Dim_Date(Date_ID),
    FOREIGN KEY (Campaign_ID) REFERENCES Dim_Campaign(Campaign_ID),
    FOREIGN KEY (Browsing_Session_ID) REFERENCES Dim_Browsing_Behavior(Browsing_Session_ID)
);
INSERT INTO Dim_Product_Category (Category_ID, Category_Name, Parent_Category_ID)
VALUES (1, 'Electronics', NULL),
       (2, 'Laptops', 1),
       (3, 'Mobile Phones', 1),
       (4, 'Mixer', 1),
       (5, 'Robot', 1), 
       (6, 'Microcontroller', 1), 
       (7, 'Ultrasonic Sensor', 1), 
       (8, 'Infrared Sensor', 1), 
       (9, 'USB Cabel', 1), 
       (10, 'Motor driver L298N', 1), 
       (11, 'Refrigerator', 1), 
       (12, 'Television', 1), 
       (13, 'Geyser', 1), 
       (14, 'Electric Stove', 1), 
       (15, 'Electric Lighter', 1);
INSERT INTO Dim_Product (Product_ID, Product_Name, Brand, Category_ID, Price, Stock_Quantity)
VALUES (1, 'iPhone 12', 'Apple', 3, 999.99, 100),
       (2, 'MacBook Pro', 'Apple', 2, 1999.99, 50), 
       (3, 'Galaxy A22', 'Samsung', 4, 3000, 900), 
       (4, 'Mixer', 'OLG', 2, 1999.99, 2000), 
       (5, 'Optimus', 'Tesla', 2, 1999.99, 10), 
       (6, 'Arduino', 'Arduino', 6, 300, 500), 
       (7, 'UR-130', 'Arduino', 12, 90, 800), 
       (8, 'IR-130', 'Arduino', 10, 20, 50), 
       (9, 'COM 3', 'Arduino', 11, 10, 500), 
       (10, 'L298N', 'Smart', 16, 200, 80), 
       (11, 'Freeze', 'OLG', 19, 1999.99, 5), 
       (12, 'LGTV', 'OLG', 18, 49999.99, 7), 
       (13, 'Elektra', 'Bharat LTD', 17, 1999.99, 90), 
       (14, 'Burnol', 'Samsung', 20, 1999.99, 5000), 
       (15, 'Osama', 'Osama Bin Laden LTD', 21, 199.99, 3224);
SELECT * FROM Dim_Product_Category ;
SELECT * FROM Dim_Product;
DROP DATABASE  Snowflake;