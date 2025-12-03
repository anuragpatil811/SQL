CREATE DATABASE order_management;
USE order_management;

CREATE TABLE Dim_Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    billing_address VARCHAR(255),
    shipping_address VARCHAR(255),
    customer_email VARCHAR(255)
);
CREATE TABLE Dim_Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    product_category VARCHAR(100),
    unit_price DECIMAL(15, 2)
);
CREATE TABLE Dim_Promotion (
    promotion_id INT PRIMARY KEY,
    promotion_description VARCHAR(255),
    discount_percentage DECIMAL(5, 2)
);
CREATE TABLE Dim_SalesRep (
    sales_rep_id INT PRIMARY KEY,
    sales_rep_name VARCHAR(255),
    region VARCHAR(100)
);
CREATE TABLE Dim_Date (
    date_id INT PRIMARY KEY,
    date DATE,
    day INT,
    month INT,
    year INT,
    quarter INT
);
CREATE TABLE Dim_Currency (
    currency_id INT PRIMARY KEY,
    currency_code VARCHAR(10),
    conversion_rate_to_usd DECIMAL(10, 4)  
);

CREATE TABLE Fact_Order (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    promotion_id INT,
    sales_rep_id INT,
    order_date_id INT,
    ship_date_id INT,
    currency_id INT,
    quantity INT,
    gross_amount DECIMAL(15, 2),
    discount_amount DECIMAL(15, 2),
    net_amount DECIMAL(15, 2),
    FOREIGN KEY (customer_id) REFERENCES Dim_Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Dim_Product(product_id),
    FOREIGN KEY (promotion_id) REFERENCES Dim_Promotion(promotion_id),
    FOREIGN KEY (sales_rep_id) REFERENCES Dim_SalesRep(sales_rep_id),
    FOREIGN KEY (order_date_id) REFERENCES Dim_Date(date_id),
    FOREIGN KEY (ship_date_id) REFERENCES Dim_Date(date_id),
    FOREIGN KEY (currency_id) REFERENCES Dim_Currency(currency_id)
);
INSERT INTO Dim_Customer (customer_id, customer_name, billing_address, shipping_address, customer_email)
VALUES
(1, 'John Doe', '123 Billing St', '456 Shipping St', 'john@example.com'),
(2, 'Jane Smith', '789 Billing Ave', '101 Shipping Blvd', 'jane@example.com');
INSERT INTO Dim_Product (product_id, product_name, product_category, unit_price)
VALUES
(1, 'Laptop', 'Electronics', 1000.00),
(2, 'Headphones', 'Accessories', 200.00);
INSERT INTO Dim_Promotion (promotion_id, promotion_description, discount_percentage)
VALUES
(1, 'Holiday Sale', 10.00),
(2, 'Clearance', 15.00);
INSERT INTO Dim_SalesRep (sales_rep_id, sales_rep_name, region)
VALUES
(1, 'Alice Johnson', 'North America'),
(2, 'Bob Lee', 'Europe');
INSERT INTO Dim_Date (date_id, date, day, month, year, quarter)
VALUES
(1, '2024-10-01', 1, 10, 2024, 4),
(2, '2024-10-02', 2, 10, 2024, 4);
INSERT INTO Dim_Currency (currency_id, currency_code, conversion_rate_to_usd)
VALUES
(1, 'USD', 1.0000),
(2, 'AED', 3.6725),
(3, 'EUR', 0.9500);
INSERT INTO Fact_Order (order_id, customer_id, product_id, promotion_id, sales_rep_id, order_date_id, ship_date_id, currency_id, quantity, gross_amount, discount_amount, net_amount)
VALUES
(1, 1, 1, 1, 1, 1, 2, 1, 2, 2000.00, 200.00, 1800.00),
(2, 2, 2, 2, 2, 2, 1, 3, 3, 600.00, 90.00, 510.00);

SELECT 
    c.customer_name,
    p.product_name,
    pr.promotion_description,
    sr.sales_rep_name,
    SUM(f.net_amount) AS total_net_amount_in_usd
FROM Fact_Order f
JOIN Dim_Customer c ON f.customer_id = c.customer_id
JOIN Dim_Product p ON f.product_id = p.product_id
JOIN Dim_Promotion pr ON f.promotion_id = pr.promotion_id
JOIN Dim_SalesRep sr ON f.sales_rep_id = sr.sales_rep_id
JOIN Dim_Currency cur ON f.currency_id = cur.currency_id
GROUP BY 
    c.customer_name, 
    p.product_name, 
    pr.promotion_description, 
    sr.sales_rep_name;

