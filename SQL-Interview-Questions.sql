# How to extract the part "tri" and "ing" from the word "String".
SELECT substring('String', 2, 5);
#Check if the name "Itvedant" has even number of characters and display "Yes" if true or "No" if false.
SELECT case when mod(length('ITVedant'), 2)then 'Even' ELSE 'odd'END AS 'Odd/Even';

#WAQTD the names of employees who earn more the max sal of Allen's dept.
SELECT ename FROM emp where sal > (select max(sal) FROM emp where ename='ALLEN');

#WAQTD the details of those employees who work same as Blake's reporters and work in dept same as Smith.
SELECT * FROM emp where job = (SELECT empno FROM emp where ename = 'BLAKE' and  (SELECT deptno FROM emp where ename='SMITH'));

#WAQTD dname, loc of that dept whose max sal is more than any of King's reporters' salary.
SELECT d.dname, d.loc
FROM dept d
JOIN emp e ON d.deptno = e.deptno
GROUP BY d.dname, d.loc
HAVING MAX(e.sal) > (
    SELECT MAX(sal)
    FROM emp
    WHERE mgr = (SELECT empno FROM emp WHERE ename = 'KING')
);
