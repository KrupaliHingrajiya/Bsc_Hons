-- Lab 18 Perform SQL Queries Using Subqueries
-- From the table STUDENT perform the following queries:
CREATE TABLE STUDENT 
(
    STDID INT,
    SNAME VARCHAR(50),
    CITY VARCHAR(50),
    SPI DECIMAL(4,2),
    BRANCH VARCHAR(50)
)

INSERT INTO STUDENT
VALUES (101,'HETVI','RAJKOT',7.40,'COMPUTER'),
(102,'RAJ','MORBI',9.50,'MECHANICAL'),
(103,'VISHAL','RAJKOT',9.00,'CIVIL'),
(104,'DEEP','SURAT',8.80,'COMPUTER'),
(105,'DHARMIK', 'BARODA',8.80,'CHEMICAL'),
(106,'KRUNAL','VAPI',9.00,'CIVIL'),
(107,'RIYA','NAVSARI',5.50,'COMPUTER'),
(108,'VRUNDA','KUTCH',7.60,'ELECTRICAL'),
(109,'SMAIR','JAMNAGAR',6.80,'EC'),
(110,'PARAG','SURAT',7.00,'CHEMICAL')

INSERT INTO STUDENT(STDID,SNAME,CITY,SPI)
VALUES(111,'HARSH','RAJKOT',4.00)

SELECT * FROM STUDENT

-- Part – A:
-- 1. Display the details of students whose SPI is greater than the average SPI.
SELECT * 
FROM STUDENT
WHERE SPI > (SELECT AVG(SPI) FROM STUDENT)

-- 2. Display the names of students whose SPI is less than the average SPI.
SELECT SNAME
FROM STUDENT
WHERE SPI < (SELECT AVG(SPI) FROM STUDENT)

-- 3. Display the student details who has the highest SPI.
SELECT *
FROM STUDENT
WHERE SPI = (SELECT MAX(SPI) FROM STUDENT)

-- 4. Display the student details who has the lowest SPI.
SELECT *
FROM STUDENT 
WHERE SPI = (SELECT MIN(SPI) FROM STUDENT)

-- 5. Display the students whose SPI is greater than SPI of student DHARMIK.
SELECT *
FROM STUDENT
WHERE SPI > (
    SELECT SPI
    FROM STUDENT
    WHERE SNAME = 'DHARMIK'
)

-- 6. Display the students whose SPI is less than SPI of student RIYA.
SELECT *
FROM STUDENT
WHERE SPI < (
    SELECT SPI
    FROM STUDENT
    WHERE SNAME = 'RIYA'
)

-- 7. Display the students who belong to the same branch as KRUNAL.
SELECT *
FROM STUDENT
WHERE BRANCH = (
    SELECT BRANCH
    FROM STUDENT 
    WHERE SNAME = 'KRUNAL'
)

-- 8. Display the students whose branch is different from HETVI.
SELECT *
FROM STUDENT
WHERE BRANCH <> (
    SELECT BRANCH
    FROM STUDENT
    WHERE SNAME = 'HETVI'
)

CREATE TABLE RESULT
(
    RESULTID INT PRIMARY KEY,
    SPI DECIMAL(4,2) CHECK (SPI BETWEEN 0 AND 10),
    RNO INT
)

INSERT INTO RESULT VALUES
(11,8.8,101),
(12,9.2,102),
(13,7.6,103),
(14,8.2,104),
(15,7.0,105),
(16,8.9,106)

SELECT * FROM RESULT

-- 9. Display the second highest SPI from RESULT table.
SELECT MAX(SPI) AS Second_Highest_SPI
FROM RESULT 
WHERE SPI < (
    SELECT MAX(SPI)
    FROM STUDENT
)

-- 10. Display the second lowest SPI from RESULT table.
SELECT MIN(SPI) AS Second_Lowest_SPI
FROM RESULT
WHERE SPI > (
    SELECT MIN(SPI)
    FROM STUDENT
)

-- 11. Display the names of students whose SPI is above branch-wise average SPI.
SELECT SNAME
FROM STUDENT S
WHERE SPI > (
    SELECT AVG(SPI)
    FROM STUDENT
    WHERE BRANCH = S.BRANCH
)

-- 12. Display the branch having maximum average SPI.
SELECT BRANCH
FROM STUDENT
GROUP BY BRANCH
HAVING AVG(SPI) = (
    SELECT MAX(AVG_SPI) 
    FROM (
        SELECT AVG(SPI) AS AVG_SPI
        FROM STUDENT
        GROUP BY BRANCH
    ) A
)

-- 13. Display the branch having minimum average SPI.
SELECT BRANCH
FROM STUDENT
GROUP BY BRANCH
HAVING AVG(SPI) =
(
    SELECT MIN(AVG_SPI)
    FROM
    (
        SELECT AVG(SPI) AS AVG_SPI
        FROM STUDENT
        GROUP BY BRANCH
    ) A
)

-- From the table STUDENT_INFO and RESULT perform the following queries:


-- PART B

-- 14. Display the students whose SPI is greater than all students of ME branch.
SELECT S.*
FROM STUDENT S
JOIN RESULT R ON S.STDID = R.RNO
WHERE R.SPI > ALL (
    SELECT R2.SPI
    FROM STUDENT S2
    JOIN RESULT R2 ON S2.STDID = R2.RNO
    WHERE S2.BRANCH = 'ME'
)

-- 15. Display the students whose SPI is less than any student of ME branch.
SELECT S.*
FROM STUDENT S
JOIN RESULT R ON S.STDID = R.RNO
WHERE R.SPI < ANY (
    SELECT R2.SPI
    FROM STUDENT S2
    JOIN RESULT R2 ON S2.STDID = R2.RNO
    WHERE S2.BRANCH = 'ME'
)

-- 16. Display the student details whose SPI is not equal to any SPI of EC branch students.
SELECT S.*
FROM STUDENT S
JOIN RESULT R ON S.STDID = R.RNO
WHERE R.SPI <> ALL (
    SELECT R2.SPI
    FROM STUDENT S2
    JOIN RESULT R2 ON S2.STDID = R2.RNO
    WHERE S2.BRANCH = 'EC'
)

-- 17. Display the names of students who scored higher SPI than student of RNO 103.
SELECT S.SNAME
FROM STUDENT S
JOIN RESULT R ON S.STDID = R.RNO
WHERE R.SPI >
(
    SELECT SPI
    FROM RESULT
    WHERE RNO = 103
)

-- 18. Display the students whose SPI is greater than average SPI of their own branch.
SELECT S.*
FROM STUDENT S
JOIN RESULT R ON S.STDID = R.RNO
WHERE R.SPI >
(
    SELECT AVG(R2.SPI)
    FROM STUDENT S2
    JOIN RESULT R2 ON S2.STDID = R2.RNO
    WHERE S2.BRANCH = S.BRANCH
)

-- 19. Display the students whose SPI is greater than the average SPI of CE branch
--     and greater than the maximum SPI of ME branch.
SELECT S.*
FROM STUDENT S
JOIN RESULT R ON S.STDID = R.RNO
WHERE R.SPI >
(
    SELECT AVG(R2.SPI)
    FROM STUDENT S2
    JOIN RESULT R2 ON S2.STDID = R2.RNO
    WHERE S2.BRANCH = 'CE'
)
AND R.SPI >
(
    SELECT MAX(R2.SPI)
    FROM STUDENT S2
    JOIN RESULT R2 ON S2.STDID = R2.RNO
    WHERE S2.BRANCH = 'ME'
)

-- 20. Display the branch names whose average SPI is greater than the overall average SPI.
SELECT S.BRANCH
FROM STUDENT S
JOIN RESULT R ON S.STDID = R.RNO
GROUP BY S.BRANCH
HAVING AVG(R.SPI) >
(
    SELECT AVG(SPI)
    FROM RESULT
)

-- 21. Display the students who have maximum SPI in their respective branch.
SELECT S.*
FROM STUDENT S
JOIN RESULT R ON S.STDID = R.RNO
WHERE R.SPI =
(
    SELECT MAX(R2.SPI)
    FROM STUDENT S2
    JOIN RESULT R2 ON S2.STDID = R2.RNO
    WHERE S2.BRANCH = S.BRANCH
)

-- 22. Display the students whose SPI is greater than the average SPI of their branch
--     and greater than overall average SPI.
SELECT S.*
FROM STUDENT S
JOIN RESULT R ON S.STDID = R.RNO
WHERE R.SPI >
(
    SELECT AVG(R2.SPI)
    FROM STUDENT S2
    JOIN RESULT R2 ON S2.STDID = R2.RNO
    WHERE S2.BRANCH = S.BRANCH
)
AND R.SPI >
(
    SELECT AVG(SPI)
    FROM RESULT
)

-- PART C

-- 23. Display the students whose SPI is greater than at least one student of every branch.
SELECT S.*
FROM STUDENT S
JOIN RESULT R ON S.STDID = R.RNO
WHERE NOT EXISTS
(
    SELECT DISTINCT S2.BRANCH
    FROM STUDENT S2
    JOIN RESULT R2 ON S2.STDID = R2.RNO
    WHERE NOT EXISTS
    (
        SELECT *
        FROM STUDENT S3
        JOIN RESULT R3 ON S3.STDID = R3.RNO
        WHERE S3.BRANCH = S2.BRANCH
        AND R.SPI > R3.SPI
    )
)

-- 24. Display the students whose SPI is less than all students of CE branch.
SELECT S.*
FROM STUDENT S
JOIN RESULT R ON S.STDID = R.RNO
WHERE R.SPI < ALL
(
    SELECT R2.SPI
    FROM STUDENT S2
    JOIN RESULT R2 ON S2.STDID = R2.RNO
    WHERE S2.BRANCH = 'CE'
)

-- 25. Display the branch that contains the student with highest SPI.
SELECT S.BRANCH
FROM STUDENT S
JOIN RESULT R ON S.STDID = R.RNO
WHERE R.SPI =
(
    SELECT MAX(SPI)
    FROM RESULT
)

-- 26. Display the students whose SPI is less than the SPI of every student in CE branch
--     and greater than every student in ME branch.
SELECT S.*
FROM STUDENT S
JOIN RESULT R ON S.STDID = R.RNO
WHERE R.SPI < ALL
(
    SELECT R2.SPI
    FROM STUDENT S2
    JOIN RESULT R2 ON S2.STDID = R2.RNO
    WHERE S2.BRANCH = 'CE'
)
AND R.SPI > ALL
(
    SELECT R2.SPI
    FROM STUDENT S2
    JOIN RESULT R2 ON S2.STDID = R2.RNO
    WHERE S2.BRANCH = 'ME'
)