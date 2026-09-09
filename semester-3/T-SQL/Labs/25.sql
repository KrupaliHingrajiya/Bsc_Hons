CREATE TABLE EMPLOYEE
(
    EID INT,
    FIRSTNAME VARCHAR(50),
    LASTNAME VARCHAR(50),
    DEPARTMENT VARCHAR(50),
    SALARY DECIMAL(9,2),
    CITY VARCHAR(50),
    GENDER VARCHAR(50),
    JOININGYEAR INT
)

INSERT INTO EMPLOYEE
VALUES (101,'HETVI','PATEL','ADMIN',12000.00,'RAJKOT','FEMALE',2026),
(102,'RAJ','MEHTA','IT',14000.00,'AHMEDABAD','MALE',2022),
(103,'VISHAL','SHARMA','HR',15000.00,'BARODA','MALE',2020),
(104,'DEEP','PATEL','ADMIN',12500.00,'RAJKOT','MALE',2026),
(105,'DHAVAL', 'SHAH','IT',14000.00,'JAMNAGAR','MALE',2024),
(106,'RIYA','KAUR','IT',5000.00,'AHMEDABAD','FEMALE',2024),
(107,'PARAG','PANDYA','HR',7000.00,'RAJKOT','MALE',2025),
(108,'VRUNDA','VYAS','SERVER',10000.00,'BARODA','FEMALE',2022),
(109,'MEHUL','SINGH','HR',12000.00,'MORBI','MALE',2020),
(110,'MUBIN','PARMAR','TRANSPOT',12000.00,'SURAT','MALE',2021)

INSERT INTO EMPLOYEE (EID,FIRSTNAME,LASTNAME,DEPARTMENT,SALARY,GENDER,JOININGYEAR)
VALUES
(111,'MAYANK','PUROHIT','ACCOUNT',13000.00,'MALE',2020)

SELECT * FROM EMPLOYEE

-- Lab 25 Implement User Defined Functions (UDF) in SQL (Intermediate)
-- Part – A:
-- 1. Implement scalar function to return "Welcome to DBMS Lab".
CREATE FUNCTION FN_WELCOME()
RETURNS VARCHAR(50)
AS
BEGIN
    RETURN 'Welcome to DBMS Lab'
END

SELECT dbo.FN_WELCOME()

-- 2. Implement scalar function to calculate simple interest.
CREATE FUNCTION FN_SIMPLE_INTEREST
(
    @P DECIMAL(10,2),
    @R DECIMAL(10,2),
    @T DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN (@P * @R * @T) / 100
END

SELECT dbo.FN_SIMPLE_INTEREST(10000,5,2) 

-- 3. Implement scalar function to find difference in days between two dates.

CREATE FUNCTION FN_DATE_DIFFERENCE
(
    @DATE1 DATE,
    @DATE2 DATE
)
RETURNS INT
AS
BEGIN
    RETURN ABS(DATEDIFF(DAY,@DATE1,@DATE2))
END

SELECT dbo.FN_DATE_DIFFERENCE('2026-01-01','2026-09-09') 


-- 4. Implement scalar function to check whether number is odd or even.
CREATE FUNCTION FN_ODD_EVEN (
    @NUM INT
)
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @RESULT VARCHAR(10)
    IF @NUM % 2 = 0
        SET @RESULT = 'EVEN'
    ELSE
        SET @RESULT = 'ODD'

    RETURN @RESULT
END

SELECT dbo.FN_ODD_EVEN(11)

-- 5. Implement scalar function to print numbers from 1 to N.
CREATE FUNCTION FN_NUMBERS
(
    @N INT
)
RETURNS VARCHAR(500)
AS
BEGIN
    DECLARE @I INT = 1
    DECLARE @RESULT VARCHAR(500) = ''

    WHILE @I <= @N
    BEGIN
        SET @RESULT = @RESULT + CAST(@I AS VARCHAR) + ' '
        SET @I = @I + 1
    END

    RETURN @RESULT
END

SELECT dbo.FN_NUMBERS(10)

-- Part – B:
-- 6. Implement scalar function to calculate factorial of given number.
-- 7. Implement scalar function to check palindrome number.
-- 8. Implement scalar function to find maximum of three numbers.
-- 9. Implement scalar function to calculate square and cube of a number.

-- From the table EMPLOYEE perform the following queries:
-- Part – C:
-- 10. Implement scalar function to return employee full details using EID.
CREATE FUNCTION FN_EMPLOYEE_DETAILS
(
    @EID INT
)
RETURNS VARCHAR(500)
AS
BEGIN
    DECLARE @DETAILS VARCHAR(500)

    SELECT @DETAILS =
        'EID: ' + CAST(EID AS VARCHAR) +
        ', Name: ' + FIRSTNAME + ' ' + LASTNAME +
        ', Department: ' + DEPARTMENT +
        ', Salary: ' + CAST(SALARY AS VARCHAR) +
        ', City: ' + CITY +
        ', Gender: ' + GENDER +
        ', Joining Year: ' + CAST(JOININGYEAR AS VARCHAR)
    FROM EMPLOYEE
    WHERE EID = @EID

    RETURN @DETAILS
END

SELECT dbo.FN_EMPLOYEE_DETAILS(101) 

-- 11. Implement scalar function to return highest salary from a given department.
CREATE FUNCTION FN_HIGHEST_SALARY
(
    @DEPARTMENT VARCHAR(50)
)
RETURNS DECIMAL(9,2)
AS
BEGIN
    DECLARE @MAXSALARY DECIMAL(9,2)

    SELECT @MAXSALARY = MAX(SALARY)
    FROM EMPLOYEE
    WHERE DEPARTMENT = @DEPARTMENT

    RETURN @MAXSALARY
END

SELECT dbo.FN_HIGHEST_SALARY('IT') 


-- 12. Implement scalar function to count total employees in EMPLOYEE table.
CREATE FUNCTION FN_TOTAL_EMPLOYEES()
RETURNS INT
AS
BEGIN
    DECLARE @TOTAL INT

    SELECT @TOTAL = COUNT(*)
    FROM EMPLOYEE

    RETURN @TOTAL
END

SELECT dbo.FN_TOTAL_EMPLOYEES() 

-- 13. Implement scalar function to find total experience of employee using JoiningYear.
CREATE FUNCTION FN_EXPERIENCE
(
    @JOININGYEAR INT
)
RETURNS INT
AS
BEGIN
    RETURN YEAR(GETDATE()) - @JOININGYEAR
END

SELECT dbo.FN_EXPERIENCE(2020) 

-- 14. Implement scalar function to return total number of employees in a given department.
CREATE FUNCTION FN_DEPARTMENT_COUNT
(
    @DEPARTMENT VARCHAR(50)
)
RETURNS INT
AS
BEGIN
    DECLARE @COUNT INT

    SELECT @COUNT = COUNT(*)
    FROM EMPLOYEE
    WHERE DEPARTMENT = @DEPARTMENT

    RETURN @COUNT
END

SELECT dbo.FN_DEPARTMENT_COUNT('IT') AS DEPARTMENT_EMPLOYEE_COUNT

-- 15. Implement scalar function to count total employees from a given city.

CREATE FUNCTION FN_CITY_COUNT
(
    @CITY VARCHAR(50)
)
RETURNS INT
AS
BEGIN
    DECLARE @COUNT INT

    SELECT @COUNT = COUNT(*)
    FROM EMPLOYEE
    WHERE CITY = @CITY

    RETURN @COUNT
END

SELECT dbo.FN_CITY_COUNT('RAJKOT') AS CITY_EMPLOYEE_COUNT