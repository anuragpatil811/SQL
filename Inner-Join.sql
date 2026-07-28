SELECT ename, sal, deptno, dname from emp, dept where emp.deptno = dept.deptno and ename = 'ALLEN';
select ename, dname from emp, dept where emp.deptno = dept.deptno;

SELECT ename, dname, loc FROM emp, dept 
where emp.deptno = dept.deptno and loc = 'CHICAGO';

SELECT emp.* FROM emp, dept 
where emp.deptno = dept.deptno and loc = (select loc from dept, emp where emp.deptno = dept.deptno and ename = 'BLAKE')
 AND sal > ( select sal from emp where ename='WARD');
 
 SELECT dept.* from emp, dept  
 where dept.deptno = emp.deptno group by emp.deptno having avg(sal) >
 (select min(sal) from emp where deptno = (select deptno from emp where empno=(select mgr from emp where empno=(select mgr from emp where ename='SMITH'))));
 
 select emp.* from emp, dept 
 where  emp.deptno = dept.deptno and loc IN(select loc from dept, emp where dept.deptno = emp.deptno and mgr=(select empno from emp where ename='KING'))
 and sal > (select avg(sal) from emp where deptno = (select deptno from emp where ename='SMITH'));
 
 select dept.* from emp, dept where dept.deptno = emp.deptno group by emp.deptno
 having avg(sal) > (select avg(sal) from emp where mgr = (select empno from emp where ename='BLAKE')) AND 
 count(*) > (SELECT count(*) from emp where deptno = (SELECT deptno from emp where ename='SMITH'));
 
 select ename, sal, emp.deptno from emp, dept where emp.deptno = dept.deptno AND 
 loc IN(select loc from dept, emp where emp.deptno = dept.deptno GROUP BY loc HAVING count(*)>=4) AND sal > 
 (select min(sal) from emp where mgr=(select empno from emp where ename='KING'));
 