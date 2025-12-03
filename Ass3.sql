CREATE DATABASE book_management_dw;
USE book_management_dw;
CREATE TABLE dim_book (
    book_id INT PRIMARY KEY,
    book_type VARCHAR(100),
    cost DECIMAL(10, 2)
);
CREATE TABLE dim_author (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100),
    age INT,
    country VARCHAR(100)
);
CREATE TABLE dim_publication (
    publication_id INT PRIMARY KEY,
    pub_name VARCHAR(100),
    pub_country VARCHAR(100),
    pub_year INT
);
CREATE TABLE dim_location (
    location_id INT PRIMARY KEY,
    location VARCHAR(100)
);
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    book_id INT,
    author_id INT,
    publication_id INT,
    location_id INT,
    quantity_sold INT,
    profit DECIMAL(10, 2),
    FOREIGN KEY (book_id) REFERENCES dim_book(book_id),
    FOREIGN KEY (author_id) REFERENCES dim_author(author_id),
    FOREIGN KEY (publication_id) REFERENCES dim_publication(publication_id),
    FOREIGN KEY (location_id) REFERENCES dim_location(location_id)
);
INSERT INTO dim_book (book_id, book_type, cost)
VALUES (1, 'Fiction', 15.99), 
       (2, 'Science', 25.50),
       (3, 'History', 18.75);
INSERT INTO dim_author (author_id, author_name, age, country)
VALUES (1, 'John Smith', 45, 'USA'), 
       (2, 'Jane Doe', 37, 'UK'),
       (3, 'Albert Twain', 55, 'Canada');
INSERT INTO dim_publication (publication_id, pub_name, pub_country, pub_year)
VALUES (1, 'Penguin Books', 'USA', 2020), 
       (2, 'Oxford Press', 'UK', 2018),
       (3, 'HarperCollins', 'Canada', 2019);
INSERT INTO dim_location (location_id, location)
VALUES (1, 'New York'), 
       (2, 'London'),
       (3, 'Toronto');
INSERT INTO fact_sales (sales_id, book_id, author_id, publication_id, location_id, quantity_sold, profit)
VALUES (1, 1, 1, 1, 1, 100, 500.00), 
       (2, 2, 2, 2, 2, 150, 850.00),
       (3, 3, 3, 3, 3, 200, 1200.00);
SELECT 
    b.book_type,
    l.location,
    a.author_name,
    p.pub_name,
    SUM(f.quantity_sold) AS total_quantity_sold,
    SUM(f.profit) AS total_profit
FROM 
    fact_sales f
JOIN 
    dim_book b ON f.book_id = b.book_id
JOIN 
    dim_author a ON f.author_id = a.author_id
JOIN 
    dim_publication p ON f.publication_id = p.publication_id
JOIN 
    dim_location l ON f.location_id = l.location_id
GROUP BY 
    b.book_type, l.location, a.author_name, p.pub_name
ORDER BY 
    total_profit DESC;
