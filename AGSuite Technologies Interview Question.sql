#Insert: emp_name, emp_id, salary
CREATE DATABASE employee;
USE employee;
CREATE TABLE emp(
emp_id INT, 
emp_name VARCHAR(50), 
emp_salary FLOAT
);
INSERT INTO emp (emp_id, emp_name, emp_salary)
VALUES
(1, "Anurag", 20000), 
(2, "Ritesh", 15000), 
(3, "Abhishek", 10000);
SELECT emp_salary from emp ORDER BY emp_salary DESC LIMIT 2