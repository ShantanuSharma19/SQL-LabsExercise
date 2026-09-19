-- Table for Branch details
CREATE TABLE BRANCH (
    BRANCH_CODE VARCHAR(5) PRIMARY KEY,
    BRANCH_NAME VARCHAR(30),
    CITY VARCHAR(20)
);

-- Table for Customer details
CREATE TABLE CUSTOMER (
    CUST_NO VARCHAR(5) PRIMARY KEY,
    CUST_NAME VARCHAR(30),
    ADDRESS VARCHAR(40),
    PHONE NUMERIC(10)
);

-- Table for Account details
CREATE TABLE ACCOUNT (
    ACC_NO VARCHAR(10) PRIMARY KEY,
    CUST_NO VARCHAR(5),
    BRANCH_CODE VARCHAR(5),
    ACC_TYPE VARCHAR(10),
    BALANCE NUMERIC(10),
    FOREIGN KEY (CUST_NO) REFERENCES CUSTOMER(CUST_NO),
    FOREIGN KEY (BRANCH_CODE) REFERENCES BRANCH(BRANCH_CODE)
);

-- Table for Loan details
CREATE TABLE LOAN (
    LOAN_NO VARCHAR(10) PRIMARY KEY,
    CUST_NO VARCHAR(5),
    BRANCH_CODE VARCHAR(5),
    AMOUNT NUMERIC(10),
    FOREIGN KEY (CUST_NO) REFERENCES CUSTOMER(CUST_NO),
    FOREIGN KEY (BRANCH_CODE) REFERENCES BRANCH(BRANCH_CODE)
);

-- Table for Transaction details
CREATE TABLE TRANSACTION_DETAILS (
    TRANS_ID VARCHAR(10) PRIMARY KEY,
    ACC_NO VARCHAR(10),
    TRANS_TYPE VARCHAR(10),
    TRANS_AMOUNT NUMERIC(10),
    TRANS_DATE DATE,
    FOREIGN KEY (ACC_NO) REFERENCES ACCOUNT(ACC_NO)
);

INSERT INTO BRANCH(BRANCH_CODE, BRANCH_NAME,CITY)VALUES
('B001', 'Main Branch', 'Delhi'),
('B002', 'City Branch', 'Mumbai'),
('B003', 'Town Branch', 'Chennai'),
('B004', 'Central Branch', 'Delhi'),
('B005', 'Market Branch', 'Bengaluru');

INSERT INTO CUSTOMER( CUST_NO,CUST_NAME,ADDRESS,PHONE) VALUES
('C001', 'Ankit Kumar', 'Delhi', 9876543210),
('C002', 'Anjali Verma', 'Mumbai', 9123456780),
('C003', 'Suresh Patel', 'Ahmedabad', 9988776655),
('C004', 'Neha Sharma', 'Jaipur', 9090909090),
('C005', 'Amit Singh', 'Lucknow', 8899776655);

-- Insert data into Account table
INSERT INTO ACCOUNT (ACC_NO, CUST_NO, BRANCH_CODE, ACC_TYPE, BALANCE)
VALUES
('A1001', 'C001', 'B001', 'Savings', 25000),
('A1002', 'C002', 'B002', 'Current', 40000),
('A1003', 'C003', 'B003', 'Savings', 18000),
('A1004', 'C004', 'B004', 'Savings', 32000),
('A1005', 'C005', 'B005', 'Current', 50000);

-- Insert data into Loan table
INSERT INTO LOAN (LOAN_NO, CUST_NO, BRANCH_CODE, AMOUNT)
VALUES
('L2001', 'C001', 'B001', 150000),
('L2002', 'C002', 'B002', 200000),
('L2003', 'C003', 'B003', 120000),
('L2004', 'C004', 'B004', 180000),
('L2005', 'C005', 'B005', 250000);

-- Insert data into Transaction Details table
INSERT INTO TRANSACTION_DETAILS (TRANS_ID, ACC_NO, TRANS_TYPE, TRANS_AMOUNT, TRANS_DATE)
VALUES
('T001', 'A1001', 'Deposit', 5000,  '2025-01-10'),
('T002', 'A1002', 'Withdraw', 3000,  '2025-01-12'),
('T003', 'A1003', 'Deposit', 7000,  '2025-10-15'),
('T004', 'A1004', 'Withdraw', 2000,  '2024-01-18'),
('T005', 'A1005', 'Deposit', 10000,  '2024-03-20');



------ASSIGNMENT-2------

--1--Display the structure of all the tables created in Assignment (1). IN SQL LITE COMMAND 
PRAGMA table_info(BRANCH);
PRAGMA table_info(CUSTOMER);
PRAGMA table_info(ACCOUNT);
PRAGMA table_info(LOAN);
PRAGMA table_info(TRANSACTION_DETAILS);

--WE CAN SHOW TABLE STRUCTURE ALSO LIKE THIS:
--DESCRIBE BRANCH;
--DESCRIBE CUSTOMER;
--DESCRIBE ACCOUNT;
--DESCRIBE LOAN;
--DESCRIBE TRANSACTION_DETAILS;

--2--Display the contents of all the tables created in Assignment (1)
select * FROM BRANCH;
select * FROM CUSTOMER;
select * FROM ACCOUNT;
select * FROM LOAN;
select * FROM TRANSACTION_DETAILS;

--3--Display the customer number and branch code of each account holder. 
select CUST_NO,BRANCH_CODE FROM ACCOUNT;

--4--Display the customer number and account balance of customers having Savings accounts.
select CUST_NO,BALANCE from ACCOUNT where ACC_TYPE='Savings';

--5--Display the account number and transaction ID of customers who have made deposit 
                            --transactions with a transaction amount greater than 5000
select ACC_NO,TRANS_ID from TRANSACTION_DETAILS where TRANS_TYPE ='deposit' and TRANS_AMOUNT > 5000;

--6--Display the records of customers whose loan amount is less than 200000.
 select C.CUST_NO,C.CUST_NAME,L.LOAN_NO,L.AMOUNT
 FROM CUSTOMER C 
 JOIN LOAN L ON C.CUST_NO = L.CUST_NO
 WHERE L.AMOUNT < 25000;
 
 --7--Display the customer numbers of customers who do not have Savings accounts:-
 select DISTINCT CUST_NO,ACC_NO FROM ACCOUNT WHERE ACC_TYPE <>'Savings';
 
 --8--  Display the names of different cities distinctly available in the branch table.
 SELECT DISTINCT CITY FROM BRANCH ;
 
 --9--Display all account numbers that have transactions in the month of January 2025
 SELECT DISTINCT ACC_NO FROM TRANSACTION_DETAILS WHERE TRANS_DATE BETWEEN '2025-01-01' AND '2025-01-31';
 
 --10--Display account numbers whose balance is not equal to 32000. 
 SELECT ACC_NO FROM ACCOUNT WHERE BALANCE <> 32000;
 
 --11--Display all columns of the account table sorted in descending order of account balance. 
 SELECT * FROM ACCOUNT ORDER BY BALANCE DESC;
 
 --12--Add a new columns EMAIL to the customer table
 ALTER TABLE CUSTOMER ADD EMAIL VARCHAR(100);
 --📌Explanation
-->ALTER TABLE CUSTOMER → modifies the existing CUSTOMER table.

-->ADD EMAIL VARCHAR(100) → adds a new column named EMAIL with a maximum length of 100 characters (you can adjust the size as needed).

--VARCHAR is used because email addresses are text values of varying length



--12-- Insert email values into the existing rows of the customer table. 
UPDATE CUSTOMER
SET EMAIL = 'rahul.verma@gmail.com'
WHERE CUST_NO = 'C001';

UPDATE CUSTOMER
SET EMAIL = 'anita.singh@yahoo.com'
WHERE CUST_NO = 'C002';

UPDATE CUSTOMER
SET EMAIL = 'suresh.patel@outlook.com'
WHERE CUST_NO = 'C003';

UPDATE CUSTOMER
SET EMAIL = 'neha.sharma@gmail.com'
WHERE CUST_NO = 'C004';

UPDATE CUSTOMER
SET EMAIL = 'arjun.kumar@hotmail.com'
WHERE CUST_NO = 'C005';

/*Explanation 📌 Rule of Thumb
--INSERT → used when you want to add a new row into a table.

UPDATE → used when you want to change or add values in an existing row.

✅ In Your Case
You already have rows in the CUSTOMER table, and you just added a new column EMAIL.

To fill email values for those existing customers, the correct SQL operation is UPDATE.

Using INSERT here would try to create duplicate rows for the same customers, which is not the intent.*/
-- // CHECKING THE TABLE // --
SELECT * FROM CUSTOMER;
       --OR--
-- DESCRIBE CUSTOMER;--
         --OR--
PRAGMA table_info(CUSTOMER);


--13--Change the column name CITY to LOCATION in the branch table
  ALTER TABLE BRANCH  RENAME COLUMN CITY TO LOCATION;
  

--14--Change the name of the table TRANSACTION_DETAILS to BANK_TRANSACTION
ALTER TABLE TRANSACTION_DETAILS RENAME TO BANK_TRANSACTION;

--15-- Change the column name ACC_NO to ACCOUNT_NO in the account table. 
ALTER TABLE ACCOUNT RENAME COLUMN ACC_NO TO ACCOUNT_NO;

--16-- Change the data type of CUST_NAME column to VARCHAR (50) in the customer table. 
ALTER TABLE CUSTOMER
MODIFY CUST_NAME VARCHAR(50);

-->>MODIFY / ALTER COLUMN TYPE → changes the definition of the column.

--17--Change the name of the ACCOUNT table to CUSTOMER_ACCOUNT
ALTER TABLE ACCOUNT RENAME TO CUSTOMER_ACCOUNT;

--18--Change the column size of BRANCH_NAME in the branch table from 30 to 40. 
ALTER TABLE BRANCH MODIFY BRANCH_NAME VARCHAR(40);

--19--Delete all the contents of the BANK_TRANSACTION table.
DELETE FROM BANK_TRANSACTION;

--TRUNCATE TABLE BANK_TRANSACTION;


-->📌 Rule of Thumb
/*Use DELETE if you want finer control (can add WHERE conditions, can roll back in transactions).

Use TRUNCATE if you want a quick, complete wipe of all rows and don’t need rollback.*/