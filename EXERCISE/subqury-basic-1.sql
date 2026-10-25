


-- display second highest salary 

SELECT max(sal) 
FROM  SCOTT.EMP
WHERE sal < 
            (SELECT max(sal) FROM SCOTT.EMP);



-- Display employees who earn more than JONES

SELECT ename, sal 
FROM SCOTT.EMP 
WHERE sal > (
    SELECT SAL FROM SCOTT.EMP WHERE ename = 'JONES');


-- Display employees who have the same job as SMITH


SELECT ename 
FROM SCOTT.EMP
WHERE job = 
        (SELECT job FROM SCOTT.EMP WHERE ename = 'SMITH');



-- Display employees who earn more than the average salary

SELECT ename, sal 
FROM scoot.emp
WHERE sal > 
        (SELECT avg(sal) FROM scott.EMP );



-- Display the employees who work in the same department as CLARK.

SELECT ename, deptno 
FROM SCOTT.EMP
WHERE deptno = 
        (SELECT deptno FROM SCOTT.EMP WHERE ename = 'CLARK');


-- Display the employees who were hired after FORD

SELECT ename, hiredate
FROM SCOTT.emp
WHERE hiredate > 
        (SELECT hiredate FROM SCOTT.EMP WHERE ename = 'FORD' );


-- Display the name and salary of the employee who earns the lowest salary.


SELECT ename, sal
FROM SCOTT.EMP
WHERE sal = 
        (SELECT min(sal) FROM SCOTT.EMP);


-- Display the employees who have the same manager as ALLEN.


SELECT ename, mgr
FROM SCOTT.EMP
WHERE mgr = 
        (SELECT mgr FROM SCOTT.EMP WHERE ENAME = 'ALLEN');


-- Display the employee who was hired first (earliest hire date).


SELECT ename, hiredate
FROM SCOTT.EMP
WHERE hiredate = 
        (SELECT min(hiredate) FROM SCOTT.EMP);


-- Display the employees who get a higher commission than ALLEN.

SELECT ename, comm
FROM SCOTT.EMP
WHERE comm > 
        (SELECT comm FROM SCOTT.EMP WHERE ename = 'ALLEN');


-- Display the employees who earn more than the highest salary in department 30.


SELECT ename, deptno 
FROM SCOTT.EMP
WHERE sal > 
        (SELECT max(sal) FROM SCOTT.EMP 
        WHERE deptno = 30);



-- Display the employees who earn less than the average salary of the CLERKs.


SELECT ename, sal
FROM SCOTT.EMP
WHERE SAL <
        (SELECT AVG(SAL) FROM SCOTT.EMP WHERE JOB = 'CLERK');


-- Display the employees in department 30 who earn more than the lowest salary in department 10.

SELECT ename, deptno
FROM SCOTT.EMP
WHERE deptno = 30 and 
        sal > (SELECT min(sal) FROM SCOTT.EMP WHERE deptno = 10);

-- Display the employees who earn more than half of KING’s salary.

SELECT ename, sal 
FROM SCOTT.EMP
WHERE sal > 
        (SELECT SAL/2 FROM SCOTT.EMP WHERE ename = 'KING');


-- Display the employees who were hired after the most recent hire in department 10.

SELECT ename ,hiredate 
FROM SCOTT.EMP
WHERE hiredate > (SELECT max(hiredate) FROM SCOTT.EMP WHERE deptno = 10);


-- Display the employees who are not SALESMEN but earn more than the average salary of the SALESMEN.

SELECT ENAME, JOB, SAL FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE JOB='SALESMAN')
AND job <> 'SALESMEN';
