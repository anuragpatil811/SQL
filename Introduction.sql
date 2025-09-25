#Student Database for k318 Data Science batch
CREATE DATABASE k318;
USE k318;
CREATE TABLE student(
studentid int not null,
studentname varchar(20)  not null,
studentphone bigint(10) not null,
CONSTRAINT pk PRIMARY KEY(studentid),
CONSTRAINT uq UNIQUE(studentphone),
CONSTRAINT ck CHECK(LENGTH(studentphone)=10)
);
#RENAME TABLE student to stu;
RENAME TABLE stu to student;
ALTER TABLE student ADD EMAIL VARCHAR(100);
ALTER TABLE student DROP column email;
ALTER TABLE student MODIFY studentname varchar(50);
INSERT INTO student VALUES (1, 'ABCD', 9876544210);
INSERT INTO student VALUES(2, 'EFGH', 9011223456); 
INSERT INTO student values(3, 'IJKL', 3456789104), 
(4, 'MNOPQ', 8999031245);
UPDATE student SET studentphone=9988776651, studentname='Anurag' WHERE studentid=1;
select * FROM student
