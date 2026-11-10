

-- Who earns more than JONES?

SELECT ename, sal
FROM scott.EMP
WHERE sal > (
    select sal
    from scott.EMP
    WHERE ename = 'JONES'
);


-- Who earns the highest salary

SELECT ename, sal
FROM SCOTT.EMP
WHERE sal = (
    SELECT MAX(SAL)
    FROM SCOTT.EMP
);


-- Who earns more than the company average?

SELECT ename, sal
FROM SCOTT.EMP
WHERE sal > (
    SELECT AVG(SAL) 
    FROM SCOTT.EMP
);

-- Who has the same job as SMITH?

SELECT ename, job 
FROM SCOTT.EMP
WHERE job = (
    SELECT job 
    FROM SCOTT.EMP
    WHERE ename = 'SMITH'
);


-- Which departments have an average salary higher than the company average?

SELECT deptno, 
avg(sal) as avg_sal
FROM SCOTT.EMP
GROUP BY DEPTNO
HAVING AVG(SAL) > (SELECT AVG(SAL) FROM SCOTT.EMP);

-- employee who joined the company after BLAKE

SELECT ename,
hiredate
FROM SCOTT.EMP
WHERE Hiredate > (
    SELECT hiredate 
    FROM SCOTT.EMP
    WHERE ename = 'BLAKE'
);


-- who is paid the lowest salary in the company.

SELECT ename
FROM SCOTT.EMP
WHERE sal = (
    SELECT min(sal)
    FROM SCOTT.EMP
    
);

-- ist of MILLER’s teammates

SELECT ename
FROM SCOTT.EMP
WHERE deptno = (
    SELECT deptno 
    FROM SCOTT.EMP
    WHERE ename = 'KING')
    AND
    ename <> 'KING';


-- employees who work in the same department as the most recently hired employee.

SELECT ename, deptno
FROM SCOTT.EMP
WHERE deptno = (
    SELECT deptno 
    FROM SCOTT.EMP
    WHERE hiredate = (
        SELECT MAX(HIREDATE) FROM SCOTT.EMP)
);

-- employees in any department where at least one employee earns a commission.

SELECT ename, sal, comn
FROM SCOTT.EMP
WHERE deptno IN(
    SELECT deptno FROM SCOTT.EMP
    WHERE COMN IS NOT NULL
);

-- employees who report directly to the President.

SELECT ename, job
FROM SCOTT.EMP
WHERE mgr = (
    SELECT empno FROM SCOTT.EMP
    WHERE job = 'PRESIDENT'
);

-- clerks who earn more than at least one salesman

SELECT ename, job, sal
FROM SCOTT.EMP 
WHERE job = 'CLERK'
AND sal > ANY(
    SELECT sal FROM scott.EMP 
    WHERE job = 'SALESMAN'
);


-- Find employees (excluding the President) who earn more than every manager.

SELECT ename, job, sal
FROM SCOTT.EMP 
WHERE sal > ALL( 
    SELECT sal FROM SCOTT.EMP
    WHERE job = 'MANAGER')
AND job <> 'PRESIDENT';


-- List employees who do not work in the SALES department.

SELECT empno , job
FROM SCOTT.EMP 
WHERE  empno NOT IN (
    SELECT empno FROM SCOTT.EMP
    WHERE job = 'SALES'
);


-- List departments where no ANALYST works.

SELECT deptno, dname
FROM SCOTT.DEPT
WHERE deptno NOT IN (
    SELECT deptno FROM SCOTT.EMP 
    WHERE job = 'ANALYST' AND deptno IS NOT NULL
);

-- List employees whose job does not exist in department 10

SELECT ename, job
FROM scott.EMP
WHERE job NOT IN (
    SELECT JOB FROM SCOTT.EMP
    WHERE deptno = 10
);
