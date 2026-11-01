/*
Business question: HR needs a list of all geographic regions. 
Display REGION_ID and REGION_NAME.
*/

SELECT * 
FROM REGIONS;

 

 /*
HR needs the employees assigned to department 60. 
Display EMPLOYEE_ID, FIRST_NAME, and LAST_NAME.
*/


SELECT EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;



/*
Payroll wants employees whose salary is between 
12,000 and 13,000, including both limits.
*/


SELECT EMPLOYEE_ID, 
    FIRST_NAME,
    LAST_NAME,
    SALARY 
FROM EMPLOYEES
WHERE SALARY BETWEEN 12000 AND 13000;



SELECT EMPLOYEE_ID, 
    FIRST_NAME,
    LAST_NAME,
    SALARY 
FROM EMPLOYEES
WHERE SALARY IN (12000, 13000);



/*
An HR assistant remembers that an employee’s last name starts with an uppercase K. 
Find every matching employee.
*/

SELECT EMPLOYEE_ID, 
    FIRST_NAME,
    LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE 'K%';


/*
HR wants to investigate employees with no department recorded.
*/


SELECT FIRST_NAME, 
    LAST_NAME,
    DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;



/*
Payroll needs annual base salaries for employees in department 60.

*/

SELECT FIRST_NAME,
    LAST_NAME,
    SALARY,
    NVL(SALARY,  0) * 12 annual_salary
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;


/*
HR is reviewing departments 10, 20, 60, and 90. 
Show the number of employees in each of these departments.
*/

SELECT DEPARTMENT_ID,
    COUNT(*) EMPLOYEE_COUNT
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10, 20, 60, 90)
GROUP BY DEPARTMENT_ID
ORDER BY 1;


/*
HR is reviewing JOB_HISTORY. Find departments that appear
 in at least two history records.
*/

SELECT DEPARTMENT_ID,
    COUNT(*) HISTORY_COUNT
FROM JOB_HISTORY
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)  >= 2
ORDER BY 1;



/*
HR needs a short report for employees 100, 103, and 201, 
showing their department names.
*/


SELECT EMPLOYEE_ID,
    FIRST_NAME,
    DEPARTMENT_NAME
FROM EMPLOYEES E 
JOIN DEPARTMENTS D 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.EMPLOYEE_ID IN (100, 103, 201);





-- TRICK QUESTION
/*

For department 90, payroll wants:
1. The total number of employees, named TOTAL_EMPLOYEES.
2. The number with a non-NULL COMMISSION_PCT, named EMPLOYEES_WITH_COMMISSION.

*/


SELECT 
    COUNT(*) TOTAL_EMPLOYEES,
    COUNT(COMMISSION_PCT) EMPLOYEES_WITH_COMMISSION
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;

