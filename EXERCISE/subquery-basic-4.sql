-- table is SCOTT.EMP, SCOTT.DEPT IN FREE SQOL PLATFORM


/*
Q1. Find the employee Highest salary in each department
*/


SELECT ename, deptno, sal 
FROM SCOTT.EMP e 
WHERE sal = (
    SELECT MAX(SAL) FROM SCOTT.EMP
    WHERE deptno = e.deptno);

/*
Find employees who earn more than the average of their own department.
*/

SELECT ename, deptno, sal 
FROM SCOTT.EMP e
WHERE sal > (
    SELECT AVG(sal) FROM SCOTT.EMP
    WHERE deptno = e.deptno
);


/*
Find employees who earn more than the company average.
*/

SELECT ename, sal 
FROM SCOTT.EMP
WHERE sal > (
    SELECT avg(sal) FROM SCOTT.EMP
);


/*
Find employees who are nobody’s manager, meaning no one reports to them.
*/

SELECT ename, job, empno
FROM SCOTT.EMP
WHERE empno NOT IN (
    SELECT mgr FROM SCOTT.EMP
    WHERE mgr IS NOT NULL
);

SELECT e.ename, e.empno
FROM SCOTT.EMP e 
LEFT JOIN SCOTT.EMP s ON s.mgr = e.empno
WHERE s.empno IS NULL;


/*
Find employees who earn more than the highest salary of their own department.
*/

-- TRICKY QUESTION NO OUTPUT FOR


/*
Find departments whose lowest salary is higher than the company average.
*/


SELECT deptno, MIN(sal)
FROM SCOTT.EMP
GROUP BY DEPTNO
HAVING MIN(sal) > (SELECT avg(sal) 
                FROM SCOTT.EMP);


/*
Find employees who earn more than the second-highest salary.
*/

SELECT ename, sal
FROM SCOTT.EMP
WHERE sal > (
    SELECT max(sal) FROM SCOTT.EMP
    WHERE sal < (
        SELECT MAX(sal) FROM SCOTT.EMP));

    


/*
Find employees who earn less than the top salary of their own department.
*/


SELECT ename, deptno, sal 
FROM SCOTT.EMP e
WHERE sal < (
    SELECT max(sal) FROM SCOTT.EMP
    WHERE deptno = e.deptno
);


SELECT ename, deptno, sal, max_sal
FROM (  SELECT ename, deptno, sal, 
        MAX(sal) over(partition by deptno) as max_sal
        FROM SCOTT.EMP)
WHERE sal < max_sal;

/*
Find employees in the top 10% by salary.
*/

SELECT ename, sal 
FROM SCOTT.EMP
ORDER BY sal 
FETCH FIRST 10 PERCENT ROWS WITH TIES;


SELECT ename, sal FROM (
    SELECT ename, sal,
         NTILE(10) OVER (ORDER BY sal DESC) AS bucket
    FROM scott.emp)
WHERE bucket = 1;

/*
Find the department with the lowest average salary.
*/

SELECT deptno, ROUND(AVG(sal), 2) AS avg_sal FROM scott.emp
GROUP BY deptno
HAVING AVG(sal) = (SELECT MIN(AVG(sal)) FROM scott.emp GROUP BY deptno);


/*
Find employees hired after the top earner (KING, hired 17-NOV-81).
*/


SELECT ename, hiredate 
FROM SCOTT.EMP
WHERE hiredate > (
    SELECT hiredate FROM SCOTT.EMP
    WHERE sal = (SELECT MAX(sal) FROM scott.emp));



/*
Find employees who work in a department that has more than 5 employees.
*/


SELECT ename, DEPTNO
FROM SCOTT.EMP
WHERE deptno IN (
    SELECT deptno FROM SCOTT.EMP
    GROUP BY deptno HAVING COUNT(*) > 5);

