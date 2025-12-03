CREATE DATABASE banking_dw;
USE banking_dw;
CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    location VARCHAR(100)
);
CREATE TABLE dim_account (
    account_id INT PRIMARY KEY,
    account_type VARCHAR(50),
    balance DECIMAL(15, 2)
);
CREATE TABLE dim_branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100),
    location VARCHAR(100)
);
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_type VARCHAR(50)
);
CREATE TABLE fact_transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    account_id INT,
    branch_id INT,
    product_id INT,
    transaction_amount DECIMAL(15, 2),
    transaction_date DATE,
    transaction_count INT,
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (account_id) REFERENCES dim_account(account_id),
    FOREIGN KEY (branch_id) REFERENCES dim_branch(branch_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);
INSERT INTO dim_customer (customer_id, customer_name, age, gender, location)
VALUES (1, 'John Doe', 40, 'M', 'New York'), 
       (2, 'Jane Smith', 35, 'F', 'Los Angeles'),
       (3, 'Emily Davis', 29, 'F', 'Chicago');
INSERT INTO dim_account (account_id, account_type, balance)
VALUES (1, 'Savings', 10000.00), 
       (2, 'Current', 1500.50),
       (3, 'Loan', -25000.00);
INSERT INTO dim_branch (branch_id, branch_name, location)
VALUES (1, 'Downtown Branch', 'New York'), 
       (2, 'Central Branch', 'Los Angeles'),
       (3, 'West Branch', 'Chicago');
INSERT INTO dim_product (product_id, product_name, product_type)
VALUES (1, 'Home Loan', 'Loan'), 
       (2, 'Credit Card', 'Credit'),
       (3, 'Investment Account', 'Investment');
INSERT INTO fact_transactions (transaction_id, customer_id, account_id, branch_id, product_id, transaction_amount, transaction_date, transaction_count)
VALUES (1, 1, 1, 1, 1, 5000.00, '2024-01-10', 1), 
       (2, 2, 2, 2, 2, 120.50, '2024-02-15', 2),
       (3, 3, 3, 3, 3, 15000.00, '2024-03-20', 3);
SELECT 
    c.customer_name,
    b.branch_name,
    p.product_name,
    SUM(f.transaction_amount) AS total_transaction_amount,
    SUM(f.transaction_count) AS total_transaction_count
FROM 
    fact_transactions f
JOIN 
    dim_customer c ON f.customer_id = c.customer_id
JOIN 
    dim_branch b ON f.branch_id = b.branch_id
JOIN 
    dim_product p ON f.product_id = p.product_id
GROUP BY 
    c.customer_name, b.branch_name, p.product_name
ORDER BY 
    total_transaction_amount DESC;
