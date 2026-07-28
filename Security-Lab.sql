CREATE DATABASE security_lab;
USE security_lab;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    password VARCHAR(100)
);
INSERT INTO users (username, password)
VALUES ('admin', 'admin123');
SELECT * FROM users;
SHOW DATABASES