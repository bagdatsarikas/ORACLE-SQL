

-- tables are in free sql orackle platform 

/*
Show the name and salary of every employee who earns more than JONES.
*/

SELECT ename, sal 
FROM SCOTT.EMP
WHERE SAL > (
    SELECT sal FROM SCOTT.EMP 
    WHERE ename = 'JONES'
)
ORDER BY sal;



/*
Show each employee’s name, department name and location, but only 
for employees who work in NEW YORK. Sort by employee name.

*/

SELECT e.ENAME, d.DNAME, d.LOC
FROM SCOTT.DEPT d 
JOIN SCOTT.EMP e 
ON d.DEPTNO = e.DEPTNO
WHERE d.LOC = 'NEW YORK'


/*

show the 3 lowest-paid employees.

*/

SELECT ename, sal
FROM (
    SELECT * FROM SCOTT.EMP
    ORDER BY SAL ASC
)
WHERE ROWNUM <=3;


/*

Show the empno and name of every employee who is a manager of at least one other employee.
Sort by name.

*/

SELECT ename, mgr
FROM SCOTT.EMP
WHERE empno IN (
    SELECT mgr FROM SCOTT.EMP
);


/*

Show the department number(s) that have no employees.

*/

SELECT deptno 
FROM SCOTT.DEPT
MINUS 
SELECT DEPTNO FROM SCOTT.EMP;


/*

Show the name and hire date of the employee who was hired first in the company.
*/


SELECT ename, HIREDATE
FROM SCOTT.EMP
WHERE hiredate = (
    SELECT min(hiredate) FROM SCOTT.EMP
);



/*

For department 20, show each employee’s name next to their manager’s name. 
Sort by employee name.
*/

SELECT e.ename as employee, 
    m.ename as manager
FROM SCOTT.EMP e , SCOTT.EMP m 
WHERE e.mgr = m.empno
AND e.deptno = 20 
ORDER BY e.ename;



/*
Show the name, salary and deptno of every employee who earns more than every employee in department 30.
 Sort by salary, then name.

*/

SELECT ename, sal, deptno
FROM   SCOTT.EMP
WHERE  sal > ALL (SELECT sal FROM SCOTT.EMP WHERE deptno = 30)
ORDER  BY sal, ename;


/*
Show the employees who have the same job and the same manager as WARD. Leave WARD out, 
and sort by name.

*/

SELECT ename, job, mgr
FROM SCOTT.EMP
WHERE (job, mgr) IN (
    SELECT job, mgr
    FROM SCOTT.EMP
    WHERE ename = 'WARD'
)
ORDER BY ename;


/*

Show the top 5 earners. If two people earn the same, sort them by name.
*/

SELECT ename, sal 
FROM SCOTT.EMP 
ORDER BY sal DESC, ename
FETCH FIRST 5 ROWS ONLY;



/*
Show JONES and everyone who reports to him, directly or indirectly. Show LEVEL, ename and job.

*/

SELECT LEVEL, ename, job 
FROM SCOTT.EMP 
START WITH ename = 'JONES'
CONNECT BY PRIOR empno = mgr 
ORDER SIBLINGS BY ename;


/*

Show the employees who are not salesmen but earn less than at least one salesman. Sort by salary.

*/

SELECT ename, sal 
FROM SCOTT.EMP
WHERE sal < ANY(
    SELECT sal FROM SCOTT.EMP 
    WHERE job = 'SALESMAN'
)
AND job <> 'SALESMAN'
ORDER BY sal;

/*

Create a view called emp20_v with empno, ename, job and sal for department 20. Then query the view to 
show only the people earning more than 2000, sorted by empno.
*/

CREATE OR REPLACE VIEW emp_20 
AS SELECT 
empno, ename, job, sal 
FROM EMP 
WHERE deptno = 20

SELECT * FROM 
emp_20
WHERE sal > 2000
ORDER BY empno;


/*
Using ROWID, show the last record stored in EMP.

*/

SELECT * 
FROM SCOTT.EMP
WHERE ROWID = (SELECT MAX(ROWID) FROM SCOTT.EMP)

/*
Using ROWID, show the last record stored in EMP.

*/

SELECT * 
FROM SCOTT.EMP 
WHERE ROWID = (SELECT MIN(ROWID) FROM SCOTT.EMP);
