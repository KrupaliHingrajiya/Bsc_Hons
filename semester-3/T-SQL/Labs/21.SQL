CREATE TABLE STUDENT(
STDID INT,
SNAME VARCHAR(50), 
CITY VARCHAR(50), 
SPI DECIMAL(4,2), 
BRANCH VARCHAR(50)
);

INSERT INTO STUDENT
VALUES
(101, 'HETVI', 'RAJKOT', 7.40, 'COMPUTER'),
(102, 'RAJ', 'MORBI', 9.50, 'MECHANICAL'), 
(103, 'VISHAL', 'RAJKOT', 9.00, 'CIVIL'), 
(104, 'DEEP', 'SURAT', 8.80, 'COMPUTER'),
(105, 'DHARMIK', 'BARODA', 8.80, 'CHEMICAL'), 
(106, 'KRUNAL', 'VAPI', 9.00, 'CIVIL'), 
(107, 'RIYA', 'NAVSARI', 5.50, 'COMPUTER'), 
(108, 'VRUNDA', 'KUTCH', 7.60, 'ELECTRICAL'), 
(109, 'SMAIR', 'JAMNAGAR', 6.80, 'EC'),
(110, 'PARAG', 'SURAT', 7.00, 'CHEMICAL'), 
(111, 'HARSH', 'RAJKOT', 4.00, 'NULL');

----------PART A--------------
-- 1. Display all students whose SPI is greater than 8
WITH CTE AS (
SELECT * FROM STUDENT
)
SELECT *
FROM CTE
WHERE SPI > 8;

--2. Display average SPI of all students.

WITH CTE AS (
SELECT AVG(SPI) AS AVERAGE_SPI
FROM STUDENT
)
SELECT * FROM CTE

--3. Display total number of students in each branch.

WITH CTE AS (
    SELECT BRANCH, COUNT(*) AS TOTAL_STUDENTS
    FROM STUDENT
    GROUP BY BRANCH
)
SELECT * FROM CTE
--4. Display students who belong to RAJKOT city.

WITH CTE AS (
    SELECT * FROM STUDENT
)
SELECT *
FROM CTE
WHERE CITY = 'RAJKOT';
--5. Find branch names that appear more than once

WITH CTE AS(
SELECT BRANCH,COUNT(*) AS BRANCH_COUNT
FROM STUDENT 
GROUP BY BRANCH
)
SELECT BRANCH FROM CTE 
WHERE BRANCH_COUNT>1
--6. Display row number for each student.

WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY STDID) AS ROW_NUMBER
    FROM STUDENT
)
SELECT *
FROM CTE;
--7. Display top 3 students based on SPI.

WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY SPI DESC) AS ROW_NUMBER
    FROM STUDENT
)
SELECT *
FROM CTE
WHERE ROW_NUMBER <= 3;
--8. Display students having maximum SPI.

WITH CTE AS (
    SELECT MAX(SPI) AS MAX_SPI
    FROM STUDENT
)
SELECT S.*
FROM STUDENT S, CTE
WHERE S.SPI = CTE.MAX_SPI;
--9. Display students having minimum SPI.

WITH CTE AS(
   SELECT MIN(SPI) AS MIN_SPI
   FROM STUDENT
)
SELECT S.*
FOR STUDENT S,CTE
WHERE 
--10. Display branch -wise rank of students.
WITH CTE AS (
    SELECT *,
           RANK() OVER (
               PARTITION BY BRANCH
               ORDER BY SPI DESC
           ) AS BRANCH_RANK
    FROM STUDENT
)
SELECT *
FROM CTE;

----------PART B---------

--11. Display students SPI average belonging to Computer branch.
WITH CTE AS (
    SELECT AVG(SPI) AS AVERAGE_SPI
    FROM STUDENT
    WHERE BRANCH = 'COMPUTER'
)
SELECT *
FROM CTE;

--12. Display students whose SPI is greater than average SPI of his/her branch.

WITH CTE AS (
    SELECT *,
           AVG(SPI) OVER (PARTITION BY BRANCH) AS BRANCH_AVG_SPI
    FROM STUDENT
)
SELECT *
FROM CTE
WHERE SPI > BRANCH_AVG_SPI;
--13. Display branch having more than 2 students.
WITH CTE AS (
    SELECT BRANCH, COUNT(*) AS TOTAL_STUDENTS
    FROM STUDENT
    GROUP BY BRANCH
)
SELECT *
FROM CTE
WHERE TOTAL_STUDENTS > 2;
--14. Display branches having average SPI between 7 and 9

WITH CTE AS (
    SELECT BRANCH, AVG(SPI) AS AVERAGE_SPI
    FROM STUDENT
    GROUP BY BRANCH
)
SELECT *
FROM CTE
WHERE AVERAGE_SPI BETWEEN 7 AND 9;

--15. Display students whose SPI is lower than overall average SPI.

WITH CTE AS (
    SELECT AVG(SPI) AS OVERALL_AVG_SPI
    FROM STUDENT
)
SELECT S.*
FROM STUDENT S, CTE
WHERE S.SPI < CTE.OVERALL_AVG_SPI;

-- 16. Display branches having exactly one student
WITH CTE AS (
    SELECT BRANCH, COUNT(*) AS TOTAL_STUDENTS
    FROM STUDENT
    GROUP BY BRANCH
)
SELECT *
FROM CTE
WHERE TOTAL_STUDENTS = 1;


-- 17. Display branch having highest average SPI
WITH CTE AS (
    SELECT BRANCH, AVG(SPI) AS AVERAGE_SPI
    FROM STUDENT
    GROUP BY BRANCH
)
SELECT *
FROM CTE
WHERE AVERAGE_SPI = (
    SELECT MAX(AVERAGE_SPI)
    FROM CTE
);


-- 18. Display branch having lowest average SPI
WITH CTE AS (
    SELECT BRANCH, AVG(SPI) AS AVERAGE_SPI
    FROM STUDENT
    GROUP BY BRANCH
)
SELECT *
FROM CTE
WHERE AVERAGE_SPI = (
    SELECT MIN(AVERAGE_SPI)
    FROM CTE
);

-- 19. Display students whose SPI is lower than branch average SPI
WITH CTE AS (
    SELECT *,
           AVG(SPI) OVER (PARTITION BY BRANCH) AS BRANCH_AVG_SPI
    FROM STUDENT
)
SELECT *
FROM CTE
WHERE SPI < BRANCH_AVG_SPI;


-- 20. Display branches having maximum number of students
WITH CTE AS (
    SELECT BRANCH, COUNT(*) AS TOTAL_STUDENTS
    FROM STUDENT
    GROUP BY BRANCH
)
SELECT *
FROM CTE
WHERE TOTAL_STUDENTS = (
    SELECT MAX(TOTAL_STUDENTS)
    FROM CTE
);