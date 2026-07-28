select e.ename, m.ename, dm.dname from emp e, emp m, dept dm where e.mgr = m.empno 
and m.deptno = dm.deptno and e.sal > (select avg(sal) from emp where deptno = 20) and dm.loc = 'CHICAGO';

select m.ename, m.sal from emp e, emp m, dept de, dept dm
where e.mgr = m.empno AND e.deptno = de.deptno AND m.deptno = dm.deptno AND de.loc IN
(SELECT loc FROM dept, emp where dept.deptno = emp.deptno and mgr = (select empno