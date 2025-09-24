CREATE DATABASE company;
use company;
-- Department table
CREATE TABLE dept (
    deptno INT PRIMARY KEY,
    dname VARCHAR(50),
    loc   VARCHAR(50)
);
-- Employee table
CREATE TABLE emp (
    empno INT PRIMARY KEY,
    ename VARCHAR(50),
    job   VARCHAR(50),
    mgr   INT,
    hiredate DATE,
    sal   DECIMAL(10,2),
    comm  DECIMAL(10,2),
    deptno INT,
    FOREIGN KEY (deptno) REFERENCES dept(deptno)
);
-- Insert into dept
INSERT INTO dept (deptno, dname, loc) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH',   'DALLAS'),
(30, 'SALES',      'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

-- Insert into emp
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
(7369, 'SMITH', 'CLERK',   7902, '1980-12-17', 800.00, NULL, 20),
(7499, 'ALLEN', 'SALESMAN',7698, '1981-02-20', 1600.00, 300.00, 30), 
(7521, 'WARD',  'SALESMAN',7698, '1981-02-22', 1250.00, 500.00, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL, 20),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000.00, NULL, 20),
(7839, 'KING',  'PRESIDENT',NULL,'1981-11-17', 5000.00, NULL, 10),
(7844, 'TURNER','SALESMAN',7698, '1981-09-08', 1500.00, 0.00, 30),
(7900, 'JAMES', 'CLERK',   7698, '1981-12-03', 950.00, NULL, 30),
(7902, 'FORD',  'ANALYST', 7566, '1981-12-03', 3000.00, NULL, 20),
(7934, 'MILLER','CLERK',   7782, '1982-01-23', 1300.00, NULL, 10);
SELECT * FROM dept;
SELECT * FROM emp;
SELECT ename FROM emp;
SELECT ename, sal FROM emp;
SELECT sal*12 AnnualSalary FROM emp;
SELECT sal*12 'Annual Salary' from emp;
SELECT * FROM emp WHERE ename='SMITH';
SELECT * FROM emp WHERE sal>2500;
SELECT ename, sal, job FROM emp WHERE sal<=3000;
SELECT * FROM emp WHERE job='MANAGER' OR deptno=30;
SELECT * FROM emp where deptno = 20 AND job='SALESMAN';
SELECT * FROM emp where (deptno = 10) OR (deptno = 20) AND job='MANAGER';