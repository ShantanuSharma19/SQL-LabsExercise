/* Question 
DECIMAL(2,1) 
Write an SQL query to display the movie name, genre, user name, and rating for movies watched by 
users where:

• The movie's genre is Action  
• The user's age is greater than 25  
• The rating is 4.0 or higher  
• The movie was watched for more than 60 minutes 


--ANSWER-- 

/*SELECT M.MOVIE_NAME,M.GENRE,U.USER_NAME,R.RATING
FROM MOVIE M
JOIN WATCH_HISTORY WH ON M.MOVIE_ID=WH.MOVIE_ID
JOIN USER U ON WH.USER_ID=U.USER_ID
JOIN RATING R ON M.MOVIE_ID=R.MOVIE_ID
AND U.USER_ID=R.USER_ID
WHERE M.GENRE='ACTION'
AND U.AGE>25 AND R.RATING>=4.0 AND WH.WATCH_MINUTES>60; */





 ----------------------------------ASSIGNMENT 3 -------------------------------------------------------------
 
 
 -->>>SHORT NOTES TO REMEMBER---<<<<
 
 /*🔹 Aggregate Functions
 
Aggregate functions operate on a set of rows and return a single value. Common examples:

SUM() → adds up values

AVG() → calculates average

COUNT() → counts rows

MAX() → finds maximum value

MIN() → finds minimum value

Example Query: Find the total balance of all accounts in branch B001.

sql
SELECT SUM(BALANCE) AS TotalBalance
FROM ACCOUNT
WHERE BRANCH_CODE = 'B001';

🔹 Scalar Functions

Scalar functions operate on individual values and return a single value for each row. Common examples:

UPPER() → converts text to uppercase

LOWER() → converts text to lowercase

LENGTH() → returns length of a string

ROUND() → rounds numeric values

NOW() → returns current date/time

Example Query: Display customer names in uppercase.

sql
SELECT CUST_NO, UPPER(CUST_NAME) AS CustomerName
FROM CUSTOMER;


✅ Summary:

Aggregate functions → work on groups of rows (e.g., totals, averages).

Scalar functions → work on single values (e.g., formatting, string length). 

*/
-------------------------------------------------------------------------------------------------------------

--a) Display the account numbers, account types, and balances of accounts that belong to any of 
     --the following branch codes: B001, B002, B003, and B005. 

SELECT ACC_NO,ACC_TYPE,BALANCE 
FROM ACCOUNT
WHERE BRANCH_CODE IN ('B001','B002','BOO3',;'B005');



--BY USING ALIAS FUNCTION THE  SAME UPPER QUESTION SQL CODE IS: 
SELECT A.ACC_NO AS ACCOUNTNUMBER,
       A.ACC_TYPE AS ACCOUNTYPE,
       A.BALANCE AS BALANCE
FROM ACCOUNT AS A
WHERE A.BRANCH_CODE IN ('B001','B002','BOO3','B005');


--b) Display the records of customers whose names start with the letter ‘A’ and who live in the city of Delhi.

SELECT CUST_NO AS CUSTOMERID, CUST_NAME AS CustomerName, CITY AS CITY FROM CUSTOMER  
WHERE CUST_NAME LIKE 'A%' 
    AND CITY='DELHI';
    
    ---OR--
SELECT CUST_NO,CUST_NAME,ADDRESS,PHONE
FROM CUSTOMER
WHERE CUST_NAME LIKE 'A%'
AND ADDRESS = 'Delhi';

 
--c) Display customer number, account number, original balance, interest amount, and final balance by calculating 5% interest on the account balance. 
SELECT CUST_NO,ACC_NO, BALANCE AS ORIGINALBALANCE, 
                       BALANCE * 0.05 AS INTERESTAMOUNT,
                       BALANCE +( BALANCE * 0.05) AS FINALBALANCE
FROM ACCOUNT;

--d) Display the records of accounts having balance in the range 20000 to 50000. 
SELECT * FROM ACCOUNT WHERE BALANCE BETWEEN 20000 AND 50000;

--e) Display the records of customers having the second letter in their name as ‘m’. 
SELECT * FROM  CUSTOMER WHERE CUST_NAME LIKE '_m%'; 


--f) Display the account numbers of Savings accounts, sorted in descending order of their account balance
SELECT ACC_NO,ACC_TYPE,CUST_NO,BALANCE 
FROM ACCOUNT 
WHERE ACC_TYPE='Savings' ORDER BY BALANCE DESC;


--g) Update all records of the ACCOUNT table by increasing the account balance by 10%. 
UPDATE ACCOUNT
SET BALANCE = BALANCE + (BALANCE * 0.10);


--h--Update the account balance by 5% for Savings account holders whose balance is less than 25000
UPDATE ACCOUNT 
SET BALANCE =BALANCE + (BALANCE * 0.05)
WHERE ACC_TYPE='Savings' AND BALANCE < 25000;

--i) Display the annual interest amount for each account by calculating interest at 6% per annum. 
SELECT A.ACC_NO,
       A.CUST_NO,
       A.BALANCE,
       (A.BALANCE * 0.06) AS AnnualInterest
FROM ACCOUNT A;
 
 --j) Update the account type from ‘Current’ to ‘Savings’ for accounts having balance less than 45000
UPDATE ACCOUNT
SET ACC_TYPE = 'Savings'
WHERE ACC_TYPE = 'Current'
  AND BALANCE < 45000;


--k) Delete the record of the customer having loan amount less than 150000. 
DELETE FROM CUSTOMER
WHERE CUST_NO IN (
    SELECT CUST_NO
    FROM LOAN
    WHERE LOAN_AMOUNT < 150000
);

--l) Delete the customer records whose names end with the letter ‘h’. 
DELETE FROM CUSTOMER
WHERE CUST_NAME LIKE '%h';
