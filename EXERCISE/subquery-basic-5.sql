

-- TABLES ARE IN THE HR HUMAN RESOURCES SCHEMA ON ORACKLE FREE SQL 



-- Q1. Use a single-row subquery to display the highest employee salary.

SELECT (
    SELECT MAX(salary)
    FROM hr.employees 
) as highest_sal 
FROM DUAL;

-- Q2. Find employees who earn more than the company average.

SELECT first_name, last_name
FROM hr.EMPLOYEES
WHERE salary > (
    SELECT AVG(salary)
    FROM hr.EMPLOYEES
);


--  Q3. Use the result of a subquery to find everyone earning the lowest salary.

SELECT first_name, last_name 
FROM hr.employees
WHERE salary = (
    SELECT MIN(salary) 
    FROM hr.employees
);


-- Q4. Write a subquery that selects the department ID of employee 103.

SELECT (
    SELECT department_id
    FROM hr.employees 
    WHERE employee_id = 103
) as department_id
FROM DUAL;

-- Q5. Put a subquery in WHERE to find everyone with the same job as employee 103.

SELECT employee_id, first_name, job_id
FROM hr.EMPLOYEES
WHERE job_id = (
    SELECT job_id 
    FROM hr.EMPLOYEES
    WHERE employee_id = 103
);


-- Q6. Find employees who earn more than employee 103.

SELECT first_name, last_name 
FROM hr.EMPLOYEES
WHERE salary > (
    SELECT salary 
    FROM hr.employees
    WHERE employee_id = 103
);


-- Find departments whose average salary exceeds the company average.
-- Only include employees assigned to a department in the department averages.


SELECT department_id, avg(salary) as department_average
FROM hr.EMPLOYEES
WHERE department_id IS NOT NULL
GROUP BY department_id 
having avg(salary) > (select avg(salary) from hr.employees);

ELECT department_id, AVG(salary) AS department_average
FROM (
    SELECT department_id, salary
    FROM hr.employees
    WHERE department_id IN (
        SELECT department_id
        FROM hr.departments
    )
) assigned_employees
GROUP BY department_id
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM hr.employees
);


-- Q8. Use >= with a single-row subquery.
-- Who earns at least as much as employee 103?

SELECT employee_id, first_name, last_name
FROM hr.employees
WHERE salary >= (
    SELECT salary
    FROM hr.employees
    WHERE employee_id = 103
);


-- Q9. Use IN with a multi-row subquery.
-- Which employees work in a department located at location 1700?

SELECT employee_id, first_name, department_id
FROM hr.employees
WHERE department_id IN (
    SELECT department_id
    FROM hr.departments
    WHERE location_id = 1700
);


-- Q10. Use a subquery result in a calculation.
-- Show how far each employee's salary is above or below the company average.

SELECT first_name,
       salary,
       ROUND(salary - (SELECT AVG(salary) FROM hr.employees), 2) AS salary_gap
FROM hr.employees;

-- Q11. Which employees earn more than every administration vice president?
-- The HR sample uses job ID AD_VP and has multiple vice presidents.

SELECT first_name, last_name
FROM hr.EMPLOYEES
WHERE salary > (
    SELECT MAX(salary) 
    FROM hr.employees
    WHERE job_id = 'AD_VP'
);


SELECT first_name, last_name
FROM hr.EMPLOYEES
WHERE salary > ALL(
    SELECT salary 
    FROM hr.employees
    WHERE job_id = 'AD_VD'
);


-- -- Q12. Put the subquery on the left side of the comparison.
-- Find employees whose salary is higher than the company average.

SELECT first_name, last_name
FROM hr.employees
WHERE (SELECT AVG(salary) FROM hr.employees) < salary;


-- Q13. Fix the worksheet condition "salary ANY (...)".
-- Use > ANY to find employees who earn more than at least one other employee.


SELECT first_name, last_name, salary
FROM hr.employees
WHERE salary > ANY (
    SELECT salary
    FROM hr.employees
    WHERE salary IS NOT NULL
);

-- Q14. Use a subquery that returns one row.
-- Find everyone who earns the highest salary in department 60.


SELECT first_name, last_name
FROM hr.employees
WHERE department_id = 60
AND salary = (
    SELECT MAX(salary)
    FROM hr.employees
    WHERE department_id = 60
);


-- Q15. Use a subquery that can return several rows.
-- Which employees earn a salary also paid in department 60?

SELECT first_name, last_name, salary
FROM hr.employees
WHERE salary IN (
    SELECT salary
    FROM hr.employees
    WHERE department_id = 60
);

