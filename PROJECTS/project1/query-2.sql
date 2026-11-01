
/*
HR is preparing name labels for department 90. Display:
- EMPLOYEE_ID
- FIRST_NAME
- The last name in uppercase, named LAST_NAME_UPPER
*/


SELECT FIRST_NAME
    EMPLOYEE_ID,
    UPPER(LAST_NAME)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;


/*

The IT team wants the stored email identifiers for employees 100, 103, 
and 178 displayed in lowercase.

Display EMPLOYEE_ID and the converted email as EMAIL_LOWER. 
Do not add an email domain.
*/

SELECT EMPLOYEE_ID,
    LOWER(EMAIL) EMAIL_LOWER
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (100, 103, 178);


/*
HR is checking how much space employee surnames need on a form. For department 90, display:
- EMPLOYEE_ID
- LAST_NAME
- The number of characters in the surname as NAME_LENGTH
*/

SELECT EMPLOYEE_ID,
    LENGTH(LAST_NAME) NAME_LENGTH
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;




/*
HR wants a short job label for employees 103, 201, and 205.

Display EMPLOYEE_ID, JOB_ID, and the first two characters of JOB_ID as JOB_PREFIX.
*/

SELECT EMPLOYEE_ID,
    JOB_ID,
    SUBSTR(JOB_ID, 1, 2) JOB_PREFIX
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (103, 201, 205);



/*
  Payroll needs a commission report for employees 103, 145, and 178.

  Display EMPLOYEE_ID, FIRST_NAME, the original COMMISSION_PCT, and
 a calculated COMMISSION_RATE that displays 0 when the original value is NULL.
*/

SELECT EMPLOYEE_ID,
    FIRST_NAME,
    COMMISSION_PCT,
    nvl(commission_pct, 0) COMMISSION_RATE
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (103, 145, 178);



/*
Payroll wants estimated daily pay for employees 103, 104, and 107.
*/

SELECT EMPLOYEE_ID,
    FIRST_NAME,
    SALARY,
    ROUND(SALARY/22, 2) EST_DAIL_SAL
FROM EMPLOYEES;


/*

HR needs hire dates for employees displayed in the format YYYY-MM-DD, regardless of the editor’s default date display.

Display EMPLOYEE_ID, FIRST_NAME, and the formatted date as HIRE_DATE_TEXT.
*/

SELECT EMPLOYEE_ID,
    FIRST_NAME,
    TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') HIRE_DATE_TEXT
FROM EMPLOYEES;


/*
Finance wants a salary summary for departments 20, 60, and 90.

For each department, display:
- DEPARTMENT_ID
- The lowest salary as LOWEST_SALARY
- The highest salary as HIGHEST_SALARY
- The average salary, rounded to two decimal places, as AVERAGE_SALARY
*/

SELECT DEPARTMENT_ID,
    MIN(SALARY) AS LOWEST_SALARY,
    MAX(SALARY) AS MAX_SALARY,
    AVG(SALARY) AS AVERAGE_SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (20, 60, 90)
GROUP BY DEPARTMENT_ID;



/*
HR wants directory entries for employees 100, 103, and 201, including their department names.

Display:
- EMPLOYEE_ID
- First name and last name joined with one space, as FULL_NAME
- Department name in uppercase, as DEPARTMENT_LABEL
*/


SELECT e.employee_id,
       e.first_name || ' ' || e.last_name AS full_name,
       UPPER(d.department_name) AS department_label
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
WHERE e.employee_id IN (100, 103, 201)
ORDER BY e.employee_id;



/*
TRICKY QUESTION 
Finance is testing a calculation for employees 103 and 145.

For this exercise, define estimated pay as:

Salary + (salary × commission rate)

Display EMPLOYEE_ID and two calculations:
- PAY_WITHOUT_NVL: use the original commission value.
- PAY_WITH_NVL: treat a missing commission rate as zero before calculating pay.
*/


SELECT employee_id,
       salary + (salary * commission_pct) AS pay_without_nvl,
       salary + (salary * NVL(commission_pct, 0)) AS pay_with_nvl
FROM employees
WHERE employee_id IN (103, 145)
ORDER BY employee_id;
