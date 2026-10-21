-- DROP TABLE orders;
-- DROP TABLE customer;
-- DROP TABLE salesman;

-- 1. SALESMAN
CREATE TABLE SALESMAN (
    SALESMAN_ID NUMBER(5) PRIMARY KEY,
    NAME        VARCHAR2(30),
    CITY        VARCHAR2(30),
    COMMISSION  NUMBER(4, 2)
);

INSERT INTO SALESMAN VALUES ( 5001,
                              'James Hoog',
                              'New York',
                              0.15 );

INSERT INTO SALESMAN VALUES ( 5002,
                              'Nail Knite',
                              'Paris',
                              0.13 );

INSERT INTO SALESMAN VALUES ( 5005,
                              'Pit Alex',
                              'London',
                              0.11 );

INSERT INTO SALESMAN VALUES ( 5006,
                              'Mc Lyon',
                              'Paris',
                              0.14 );

INSERT INTO SALESMAN VALUES ( 5007,
                              'Paul Adam',
                              'Rome',
                              0.13 );

INSERT INTO SALESMAN VALUES ( 5003,
                              'Lauson Hen',
                              'San Jose',
                              0.12 );

-- 2. CUSTOMER
CREATE TABLE CUSTOMER (
    CUSTOMER_ID NUMBER(5) PRIMARY KEY,
    CUST_NAME   VARCHAR2(30),
    CITY        VARCHAR2(30),
    GRADE       NUMBER(5),
    SALESMAN_ID NUMBER(5)
        REFERENCES SALESMAN ( SALESMAN_ID )
);

INSERT INTO CUSTOMER VALUES ( 3002,
                              'Nick Rimando',
                              'New York',
                              100,
                              5001 );

INSERT INTO CUSTOMER VALUES ( 3007,
                              'Brad Davis',
                              'New York',
                              200,
                              5001 );

INSERT INTO CUSTOMER VALUES ( 3005,
                              'Graham Zusi',
                              'California',
                              200,
                              5002 );

INSERT INTO CUSTOMER VALUES ( 3008,
                              'Julian Green',
                              'London',
                              300,
                              5002 );

INSERT INTO CUSTOMER VALUES ( 3004,
                              'Fabian Johnson',
                              'Paris',
                              300,
                              5006 );

INSERT INTO CUSTOMER VALUES ( 3009,
                              'Geoff Cameron',
                              'Berlin',
                              100,
                              5003 );

INSERT INTO CUSTOMER VALUES ( 3003,
                              'Jozy Altidor',
                              'Moscow',
                              200,
                              5007 );

INSERT INTO CUSTOMER VALUES ( 3001,
                              'Brad Guzan',
                              'London',
                              NULL,
                              5005 );

-- 3. ORDERS
CREATE TABLE ORDERS (
    ORD_NO      NUMBER(6) PRIMARY KEY,
    PURCH_AMT   NUMBER(8, 2),
    ORD_DATE    DATE,
    CUSTOMER_ID NUMBER(5)
        REFERENCES CUSTOMER ( CUSTOMER_ID ),
    SALESMAN_ID NUMBER(5)
        REFERENCES SALESMAN ( SALESMAN_ID )
);

INSERT INTO ORDERS VALUES ( 70001,
                            150.50,
                            DATE '2012-10-05',
                            3005,
                            5002 );

INSERT INTO ORDERS VALUES ( 70009,
                            270.65,
                            DATE '2012-09-10',
                            3001,
                            5005 );

INSERT INTO ORDERS VALUES ( 70002,
                            65.26,
                            DATE '2012-10-05',
                            3002,
                            5001 );

INSERT INTO ORDERS VALUES ( 70004,
                            110.50,
                            DATE '2012-08-17',
                            3009,
                            5003 );

INSERT INTO ORDERS VALUES ( 70007,
                            948.50,
                            DATE '2012-09-10',
                            3005,
                            5002 );

INSERT INTO ORDERS VALUES ( 70005,
                            2400.60,
                            DATE '2012-07-27',
                            3007,
                            5001 );

INSERT INTO ORDERS VALUES ( 70008,
                            5760.00,
                            DATE '2012-09-10',
                            3002,
                            5001 );

INSERT INTO ORDERS VALUES ( 70010,
                            1983.43,
                            DATE '2012-10-10',
                            3004,
                            5006 );

INSERT INTO ORDERS VALUES ( 70003,
                            2480.40,
                            DATE '2012-10-10',
                            3009,
                            5003 );

INSERT INTO ORDERS VALUES ( 70012,
                            250.45,
                            DATE '2012-06-27',
                            3008,
                            5002 );

INSERT INTO ORDERS VALUES ( 70011,
                            75.29,
                            DATE '2012-08-17',
                            3003,
                            5007 );

INSERT INTO ORDERS VALUES ( 70013,
                            3045.60,
                            DATE '2012-04-25',
                            3002,
                            5001 );

COMMIT;

-- Drop old copies if you re-run this (ignore errors the first time)
-- DROP TABLE orders;
-- DROP TABLE customer;
-- DROP TABLE salesman;

-- 1. SALESMAN
CREATE TABLE SALESMAN (
    SALESMAN_ID NUMBER(5) PRIMARY KEY,
    NAME        VARCHAR2(30),
    CITY        VARCHAR2(30),
    COMMISSION  NUMBER(4, 2)
);

INSERT INTO SALESMAN VALUES ( 5001,
                              'James Hoog',
                              'New York',
                              0.15 );

INSERT INTO SALESMAN VALUES ( 5002,
                              'Nail Knite',
                              'Paris',
                              0.13 );

INSERT INTO SALESMAN VALUES ( 5005,
                              'Pit Alex',
                              'London',
                              0.11 );

INSERT INTO SALESMAN VALUES ( 5006,
                              'Mc Lyon',
                              'Paris',
                              0.14 );

INSERT INTO SALESMAN VALUES ( 5007,
                              'Paul Adam',
                              'Rome',
                              0.13 );

INSERT INTO SALESMAN VALUES ( 5003,
                              'Lauson Hen',
                              'San Jose',
                              0.12 );

-- 2. CUSTOMER
CREATE TABLE CUSTOMER (
    CUSTOMER_ID NUMBER(5) PRIMARY KEY,
    CUST_NAME   VARCHAR2(30),
    CITY        VARCHAR2(30),
    GRADE       NUMBER(5),
    SALESMAN_ID NUMBER(5)
        REFERENCES SALESMAN ( SALESMAN_ID )
);

INSERT INTO CUSTOMER VALUES ( 3002,
                              'Nick Rimando',
                              'New York',
                              100,
                              5001 );

INSERT INTO CUSTOMER VALUES ( 3007,
                              'Brad Davis',
                              'New York',
                              200,
                              5001 );

INSERT INTO CUSTOMER VALUES ( 3005,
                              'Graham Zusi',
                              'California',
                              200,
                              5002 );

INSERT INTO CUSTOMER VALUES ( 3008,
                              'Julian Green',
                              'London',
                              300,
                              5002 );

INSERT INTO CUSTOMER VALUES ( 3004,
                              'Fabian Johnson',
                              'Paris',
                              300,
                              5006 );

INSERT INTO CUSTOMER VALUES ( 3009,
                              'Geoff Cameron',
                              'Berlin',
                              100,
                              5003 );

INSERT INTO CUSTOMER VALUES ( 3003,
                              'Jozy Altidor',
                              'Moscow',
                              200,
                              5007 );

INSERT INTO CUSTOMER VALUES ( 3001,
                              'Brad Guzan',
                              'London',
                              NULL,
                              5005 );

-- 3. ORDERS
CREATE TABLE ORDERS (
    ORD_NO      NUMBER(6) PRIMARY KEY,
    PURCH_AMT   NUMBER(8, 2),
    ORD_DATE    DATE,
    CUSTOMER_ID NUMBER(5)
        REFERENCES CUSTOMER ( CUSTOMER_ID ),
    SALESMAN_ID NUMBER(5)
        REFERENCES SALESMAN ( SALESMAN_ID )
);

INSERT INTO ORDERS VALUES ( 70001,
                            150.50,
                            DATE '2012-10-05',
                            3005,
                            5002 );

INSERT INTO ORDERS VALUES ( 70009,
                            270.65,
                            DATE '2012-09-10',
                            3001,
                            5005 );

INSERT INTO ORDERS VALUES ( 70002,
                            65.26,
                            DATE '2012-10-05',
                            3002,
                            5001 );

INSERT INTO ORDERS VALUES ( 70004,
                            110.50,
                            DATE '2012-08-17',
                            3009,
                            5003 );

INSERT INTO ORDERS VALUES ( 70007,
                            948.50,
                            DATE '2012-09-10',
                            3005,
                            5002 );

INSERT INTO ORDERS VALUES ( 70005,
                            2400.60,
                            DATE '2012-07-27',
                            3007,
                            5001 );

INSERT INTO ORDERS VALUES ( 70008,
                            5760.00,
                            DATE '2012-09-10',
                            3002,
                            5001 );

INSERT INTO ORDERS VALUES ( 70010,
                            1983.43,
                            DATE '2012-10-10',
                            3004,
                            5006 );

INSERT INTO ORDERS VALUES ( 70003,
                            2480.40,
                            DATE '2012-10-10',
                            3009,
                            5003 );

INSERT INTO ORDERS VALUES ( 70012,
                            250.45,
                            DATE '2012-06-27',
                            3008,
                            5002 );

INSERT INTO ORDERS VALUES ( 70011,
                            75.29,
                            DATE '2012-08-17',
                            3003,
                            5007 );

INSERT INTO ORDERS VALUES ( 70013,
                            3045.60,
                            DATE '2012-04-25',
                            3002,
                            5001 );

COMMIT;

-- Quick check
SELECT
    *
FROM
    SALESMAN;

SELECT
    *
FROM
    CUSTOMER;

SELECT
    *
FROM
    ORDERS;

-----------------------------------------------

/* 
find the salesperson and customer who reside 
in the same city. Return Salesman, cust_name and city.
*/
SELECT
    S.NAME,
    C.CUST_NAME,
    C.CITY
FROM
         CUSTOMER C
    INNER JOIN SALESMAN S ON C.SALESMAN_ID = S.SALESMAN_ID
WHERE
    C.CITY = S.CITY;

-----------------------------------------------------------

/* 
 find those orders where the order amount exists between 500 and 2000. 
 Return ord_no, purch_amt, cust_name, city.
*/
SELECT
    O.ORD_NO,
    O.PURCH_AMT,
    C.CUST_NAME,
    C.CITY
FROM
         CUSTOMER C
    INNER JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE
    O.PURCH_AMT BETWEEN 500 AND 2000;

----------------------------------------------------------

/* 
find the salesperson(s) and the customer(s) he represents. 
Return Customer Name, city, Salesman, commission.
*/
SELECT
    C.CUST_NAME,
    C.CITY,
    S.NAME,
    S.COMMISSION
FROM
         SALESMAN S
    INNER JOIN CUSTOMER C ON C.SALESMAN_ID = S.SALESMAN_ID;

----------------------------------------------------------

/* 
find salespeople who received commissions of more than 
12 percent from the company. Return Customer Name, 
customer city, Salesman, commission.  
*/
SELECT
    C.CUST_NAME,
    C.CITY,
    S.NAME,
    S.COMMISSION
FROM
         CUSTOMER C
    INNER JOIN SALESMAN S ON C.SALESMAN_ID = S.SALESMAN_ID
WHERE
    S.COMMISSION > 0.12;

------------------------------------------------------

/* 
find  those salespeople who do not live in the same city 
where their customers live and have received a commission 
of more than 12% from the company. 
Return Customer Name, customer city, Salesman, salesman city, commission.
*/
SELECT
    C.CUST_NAME,
    C.CITY,
    S.NAME,
    S.CITY,
    S.COMMISSION
FROM
         CUSTOMER C
    INNER JOIN SALESMAN S ON S.SALESMAN_ID = C.SALESMAN_ID
WHERE
        S.CITY <> C.CITY
    AND S.COMMISSION > 0.12;

--------------------------------------------------

/* 
find the details of an order. Return ord_no, ord_date, 
purch_amt, Customer Name, grade, Salesman, commission.
*/
SELECT
    O.ORD_NO,
    O.ORD_DATE,
    O.PURCH_AMT,
    C.CUST_NAME,
    C.GRADE,
    S.NAME AS SALES_NAME,
    S.COMMISSION
FROM
         ORDERS O
    INNER JOIN CUSTOMER C ON O.CUSTOMER_ID = C.CUSTOMER_ID
    INNER JOIN SALESMAN S ON C.SALESMAN_ID = S.SALESMAN_ID;

----------------------------------------------------

/* 

join the tables salesman, customer and orders so that the 
same column of each table appears once and only the relational
 rows are returned.
*/
SELECT
    *
FROM
         ORDERS
    NATURAL JOIN CUSTOMER
    NATURAL JOIN SALESMAN;

------------------------------------------------------

/* 
write a SQL query to display the customer name, customer city, 
grade, salesman, salesman city. 
The results should be sorted by ascending customer_id.  
*/
SELECT
    C.CUST_NAME,
    C.CITY,
    C.GRADE,
    S.NAME,
    S.CITY
FROM
         CUSTOMER C
    INNER JOIN SALESMAN S ON S.SALESMAN_ID = C.SALESMAN_ID
ORDER BY
    C.CUSTOMER_ID ASC;

----------------------------------------------------------

/* 

 find those customers with a grade less than 300. 
 Return cust_name, customer city, grade, Salesman, salesmancity. 
 The result should be ordered by ascending customer_id. 
*/
SELECT
    C.CUST_NAME,
    C.CITY,
    C.GRADE,
    S.NAME,
    S.CITY
FROM
         CUSTOMER C
    INNER JOIN SALESMAN S ON S.SALESMAN_ID = C.SALESMAN_ID
WHERE
    C.GRADE < 300
ORDER BY
    C.CUSTOMER_ID ASC;

------------------------------------------------

/* 
make a report with customer name, city, order number, order date,
and order amount in ascending order according to the order date to 
determine whether any of the existing customers have placed an order
or not.
*/
SELECT
    C.CUST_NAME,
    C.CITY,
    O.ORD_NO,
    O.ORD_DATE,
    O.PURCH_AMT
FROM
    CUSTOMER C
    LEFT OUTER JOIN ORDERS   O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

------------------------------------------------

/* 
generate a report with customer name, city, order number, order date,
 order amount, salesperson name, and commission to determine if any 
 of the existing customers have not placed orders or if they have placed 
 orders through their salesman or by themselves.
*/
SELECT
    C.CUST_NAME,
    C.CITY,
    O.ORD_NO,
    O.ORD_DATE,
    O.PURCH_AMT,
    S.NAME,
    S.COMMISSION
FROM
    CUSTOMER C
    LEFT OUTER JOIN ORDERS   O ON C.CUSTOMER_ID = O.CUSTOMER_ID
    LEFT JOIN SALESMAN S ON C.SALESMAN_ID = S.SALESMAN_ID;
