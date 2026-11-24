


-- CREATE TABLES EMPLOYEES AND BONUS TO ANSWER QUESTION 

-- Create Employee table
CREATE TABLE Employee (
    empId NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    supervisor NUMBER,
    salary NUMBER
);

-- Create Bonus table
CREATE TABLE Bonus (
    empId NUMBER PRIMARY KEY,
    bonus NUMBER,
    CONSTRAINT fk_bonus_employee
        FOREIGN KEY (empId)
        REFERENCES Employee(empId)
);

-- Insert Employee data
INSERT INTO Employee VALUES (3, 'Brad', NULL, 4000);
INSERT INTO Employee VALUES (1, 'John', 3, 1000);
INSERT INTO Employee VALUES (2, 'Dan', 3, 2000);
INSERT INTO Employee VALUES (4, 'Thomas', 3, 4000);

-- Insert Bonus data
INSERT INTO Bonus VALUES (2, 500);
INSERT INTO Bonus VALUES (4, 2000);

COMMIT;

-- Check tables
SELECT * FROM Employee;
SELECT * FROM Bonus;


-- query to find the name and bonus of each employee who has a bonus less than 1000 or has not received any bonus.

SELECT e.name, b.bonus
FROM EMPLOYEE e 
LEFT OUTER JOIN bonus b 
ON b.EMPID = e.EMPID
WHERE b.bonus > 1000 OR 
b.bonus IS NULL;

-- query to find employees whose salary is greater than their supervisor's salary.


SELECT e.name AS employee_name,
       e.salary AS employee_salary,
       s.name AS supervisor_name,
       s.salary AS supervisor_salary
FROM Employee e
JOIN Employee s
    ON e.supervisor = s.empId
WHERE e.salary>s.salary;

-- query to find employees whose salary is greater than the average salary of all employees in the company.

SELECT name, salary 
FROM EMPLOYEE
WHERE salary > (SELECT AVG(salary) FROM EMPLOYEE);


-- query to find employees whose salary is strictly greater than the average salary of employees reporting to the same supervisor.


SELECT e.name, e.salary, e.supervisor
FROM EMPLOYEE e 
WHERE e.supervisor IS NOT NULL 
AND salary > (
    SELECT avg(e2.salary)
    FROM EMPLOYEE e2
    WHERE e2.supervisor = e.supervisor
);



-- Find every employee who earns less than half of their direct supervisor's salary.

SELECt e.name, e.salary 
FROM EMPLOYEE e 
WHERE salary < (
    select m.salary/2
    from employee m 
    where m.empid = e.supervisor
);

-- For every employee, show their name and their supervisor's name as

SELECT e.name,
            (SELECT m.name
            FROM employee m 
            WHERE m.empid = e.supervisor) as supervisor_name
FROM employee e ;


-- For every employee, show their name and how many people are on their team


SELECT e.name,
        (SELECT COUNT(*)
        FROM EMPLOYEE m 
        WHERE m.supervisor = e.supervisor) as tea_size

FROM EMPLOYEE e;



SELECT e.name,
       NVL(t.team_size, 0) AS team_size
FROM Employee e
LEFT JOIN ( SELECT supervisor, COUNT(*) AS team_size
            FROM Employee
            GROUP BY supervisor ) t
       ON t.supervisor = e.supervisor
ORDER BY e.empId;


-- For every employee, show their name, their salary, and the highest salary on their team as team_max

SELECT e.name, e.salary,
        (SELECT MAX(e2.salary)
        FROM EMPLOYEE e2 
        WHERE e.supervisor = e2.supervisor) as team_max
FROM EMPLOYEE e;


SELECT e.name, e.salary,
CASE WHEN e.supervisor IS NOT NULL 
THEN MAX(e.salary) OVER (PARTITION BY e.supervisor)
end as team_max
FROM EMPLOYEE e;


-- Find the names of employees who have at least one employee reporting directly to them.

SELECT e.name
FROM EMPLOYEE e 
WHERE (SELECT COUNT(*)
       FROM EMPLOYEE e2
       WHERE e.empid = e2.supervisor ) >=1;

-- Find employees who did not receive a bonus. Return name and salary, ordered by empId.


SELECT name, salary 
FROM EMPLOYEE 
WHERE empid NOT IN (SELECT empid
                    FROM BONUS)
ORDER BY empid;


-- Find employees who earn less than the average salary of their team (same supervisor). Return name and salary, ordered by empId.


SELECT e.name, e.salary
FROM EMPLOYEE e 
WHERE e.salary < (SELECT AVG(salary)
                  FROM EMPLOYEE e2 
                  WHERE e.supervisor = e.supervisor)
ORDER BY empid;



-- CREATE SIGNUP AND CONFIRMATION TABLE AND ANSWER QUESTION 


-- -- 1. CREATE SIGNUPS TABLE
CREATE TABLE Signups (
    user_id NUMBER PRIMARY KEY,
    time_stamp TIMESTAMP
);

-- 2. CREATE CONFIRMATIONS TABLE
CREATE TABLE Confirmations (
    user_id NUMBER,
    time_stamp TIMESTAMP,
    action VARCHAR2(20),
    CONSTRAINT pk_confirmations
        PRIMARY KEY (user_id, time_stamp),
    CONSTRAINT fk_confirmations_user
        FOREIGN KEY (user_id)
        REFERENCES Signups(user_id)
);

-- 3. INSERT SIGNUPS DATA
INSERT INTO Signups VALUES
(3, TIMESTAMP '2020-03-21 10:16:13');

INSERT INTO Signups VALUES
(7, TIMESTAMP '2020-01-04 13:57:59');

INSERT INTO Signups VALUES
(2, TIMESTAMP '2020-07-29 23:09:44');

INSERT INTO Signups VALUES
(6, TIMESTAMP '2020-12-09 10:39:37');


-- 4. INSERT CONFIRMATIONS DATA
INSERT INTO Confirmations VALUES
(3, TIMESTAMP '2021-01-06 03:30:46', 'timeout');

INSERT INTO Confirmations VALUES
(3, TIMESTAMP '2021-07-14 14:00:00', 'timeout');

INSERT INTO Confirmations VALUES
(7, TIMESTAMP '2021-06-12 11:57:29', 'confirmed');

INSERT INTO Confirmations VALUES
(7, TIMESTAMP '2021-06-13 12:58:28', 'confirmed');

INSERT INTO Confirmations VALUES
(7, TIMESTAMP '2021-06-14 13:59:27', 'confirmed');

INSERT INTO Confirmations VALUES
(2, TIMESTAMP '2021-01-22 00:00:00', 'confirmed');

INSERT INTO Confirmations VALUES
(2, TIMESTAMP '2021-02-28 23:59:59', 'timeout');

-- 5. SAVE DATA
COMMIT;


-- For every user in Signups, show user_id and how many confirmation requests they received, as total_requests.

SELECT s.user_id,
        (SELECT COUNT(*)
        FROM CONFIRMATIONS c 
        WHERE c.user_id = s.user_id) as total_request
FROM SIGNUPS s;


-- For every user, show user_id and how many of their requests have action = 'confirmed', as confirmed_count.

SELECT s.user_id,
        (SELECT COUNT(*)
        FROM CONFIRMATIONS c 
        WHERE c.user_id = s.user_id
        AND c.action = 'confirmed') as confirmed_count
FROM SIGNUPS s
ORDER BY s.user_id;

-- For every user, show user_id and how many of their requests have action = 'timeout', as confirmed_count.


SELECT s.user_id,
        (SELECT COUNT(*)
        FROM CONFIRMATIONS c 
        WHERE c.user_id = s.user_id
        AND c.action = 'timeout')
FROM SIGNUPS s;


-- For each user, calculate the confirmation rate: the number of 'confirmed' messages divided by the total number of confirmation requests.

SELECT s.user_id,
       ROUND( NVL( ( SELECT COUNT(*)
                     FROM Confirmations c
                     WHERE c.user_id = s.user_id
                       AND c.action = 'confirmed' )
                   /
                   NULLIF( ( SELECT COUNT(*)
                             FROM Confirmations c
                             WHERE c.user_id = s.user_id ), 0 )
                 , 0), 2) AS confirmation_rate
FROM Signups s;



SELECT s.user_id,
       NVL(
           ROUND(
               (SELECT COUNT(*)
                FROM Confirmations c
                WHERE c.user_id = s.user_id
                  AND c.action = 'confirmed'
               ) * 1.0 /
               NULLIF(
                   (SELECT COUNT(*)
                    FROM Confirmations c2
                    WHERE c2.user_id = s.user_id),
                   0
               ),
               2
           ),
           0
       ) AS confirmation_rate
FROM Signups s;
