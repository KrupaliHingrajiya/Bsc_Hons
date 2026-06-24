-- Perform SQL Queries for Data Copy (SELECT INTO)
-- Part - A:

-- 1.Create HIGH_AMOUNT table containing deposits with amount greater than 3000.
SELECT *
INTO HIGH_AMOUNT
FROM DEPOSIT
WHERE AMOUNT > 3000;

-- 2.Create MAVDI_CUSTOMERS table containing customer name and amount of MAVDI branch.
SELECT CNAME,AMOUNT
INTO MAVDI_CUSTOMERS
FROM DEPOSIT
WHERE BNAME = 'MAVDI';

-- 3.Create RECENT_DEPOSITS table containing deposits after 01-01-2025.
SELECT *
INTO RECENT_DEPOSITS
FROM DEPOSIT
WHERE ADATE > '2025-01-01';

-- 4.Create BRANCH_LIST table containing distinct branch names.
SELECT DISTINCT BNAME
INTO BRANCH_LIST
FROM DEPOSIT;

-- 5.Create TOP_DEPOSITS table containing first five deposit records.
SELECT TOP 5 *
INTO TOP_DEPOSITS
FROM DEPOSIT;

-- 6.Create MID_RANGE table containing deposits between 2000 and 6000 amount.
SELECT *
INTO MID_RANGE
FROM DEPOSIT
WHERE AMOUNT BETWEEN 2000 AND 6000;

-- 7.Create UNIQUE_BRANCH table containing unique branch names.
SELECT DISTINCT BNAME
INTO UNIQUE_BRANCH
FROM DEPOSIT;

-- 8.Create NO_BRANCH_ASSIGNED table containing records whose branch is NULL.
SELECT *
INTO NO_BRANCH_ASSIGNED
FROM DEPOSIT
WHERE BNAME IS NULL;

-- 9.Create DEPOSIT_COPY table and rename AMOUNT column as BALANCE.
SELECT ACTNO,CNAME,BNAME,AMOUNT AS BALANCE,ADATE
INTO DEPOSIT_COPY
FROM DEPOSIT;

-- 10.Create SELECTED_BRANCH table containing MAVDI and BEDI branch records.
SELECT *
INTO SELECTED_BRANCH
FROM DEPOSIT
WHERE BNAME IN ('MAVDI', 'BEDI');

-- Part - B:

-- 11.Create STUDENT_BACKUP table with same structure but no records.
SELECT *
INTO STUDENT_BACKUP
FROM STUDENT
WHERE 1 = 0;

-- 12.Create CS_STUDENTS table containing names and cities of COMPUTER students.
SELECT SNAME,CITY
INTO CS_STUDENTS
FROM STUDENT
WHERE BRANCH = 'COMPUTER';

-- 13.Create TOPPER_LIST table containing top three students based on SPI.
SELECT TOP 3 *
INTO TOPPER_LIST
FROM STUDENT
ORDER BY SPI DESC;

-- 14.Create CITY_LIST table containing distinct student cities.
SELECT DISTINCT CITY
INTO CITY_LIST
FROM STUDENT;

-- 15.Create MID_STUDENTS table containing students with ID between 103 and 108.
SELECT *
INTO MID_STUDENTS
FROM STUDENT
WHERE STDID BETWEEN 103 AND 108;

-- Part - C:

-- 16.Create NULL_BRANCH_STUDENTS table containing students whose branch is NULL.
SELECT *
INTO NULL_BRANCH_STUDENTS
FROM STUDENT
WHERE BRANCH IS NULL;

-- 17.Create STUDENT_COPY table and rename SPI column as PERFORMANCE.
SELECT STDID,SNAME,CITY,SPI AS PERFORMANCE,BRANCH
INTO STUDENT_COPY
FROM STUDENT;

-- 18.Create CITY_WISE table containing students from RAJKOT and SURAT.
SELECT *
INTO CITY_WISE
FROM STUDENT
WHERE CITY IN ('RAJKOT', 'SURAT');

-- 19.Create NON_CIVIL_STUDENTS table containing students who do not belong to CIVIL branch.
SELECT *
INTO NON_CIVIL_STUDENTS
FROM STUDENT
WHERE BRANCH <> 'CIVIL';

-- 20.Create STUDENT_NAME_CITY table containing only student name and city.
SELECT SNAME,CITY
INTO STUDENT_NAME_CITY
FROM STUDENT;
