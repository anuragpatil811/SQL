CREATE DATABASE emp;
USE emp;
CREATE TABLE employee(
empid int PRIMARY KEY,
empname varchar(20),
empaddress varchar(100)
);
ALTER TABLE employee ADD empemail VARCHAR(100);
ALTER TABLE employee ADD CONSTRAINT email UNIQUE(empemail);
INSERT INTO employee VALUES
(1, 'Ankush', 'Mumbai', 'ankushsonawane@cdac.in'),
(2, 'Anuj', 'Ahmedabad', 'anuj@cdac.in'),
(3, 'Anurag', 'Pune', '202201358@vupune.ac.in'),
(4, 'Sanket', 'Nanded', '202201458@vupune.ac.in');
UPDATE employee SET empaddress='Pune' where empid=4;
UPDATE employee SET empemail = 'anuj@coep.ac.in' where empid=2;
SELECT * FROM employee;
DELETE FROM employee WHERE empid=4; 
DELETE FROM employee;
#SELECT * FROM employee WHERE empname LIKE 'A%'; 