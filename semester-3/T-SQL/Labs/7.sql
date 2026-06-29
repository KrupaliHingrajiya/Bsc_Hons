-- Lab 7: Perform SQL Pattern Searching Using LIKE Operator
-- Table: EMPLOYEE
SELECT * FROM EMPLOYEE
-- Part - A

-- 1. Display employees detail whose FIRSTNAME starts with 'H'.
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE 'H%'


-- 2. Display employees detail whose FIRSTNAME consists of exactly 5 characters.
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '_____'


-- 3. Display employees detail whose CITY ends with 'T' and has 6 characters.
SELECT * FROM EMPLOYEE
WHERE CITY LIKE '_____T'


-- 4. Display employees detail whose LASTNAME ends with 'EL'.
SELECT * FROM EMPLOYEE
WHERE LASTNAME LIKE '%EL'


-- 5. Display employees detail whose FIRSTNAME starts with 'R' and ends with 'A'.
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE 'R%A'


-- 6. Display employees detail whose FIRSTNAME starts with 'V' and third character is 'S'.
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE 'V_S%'


-- 7. Display employees detail whose CITY is NULL and FIRSTNAME has 6 characters.
SELECT * FROM EMPLOYEE
WHERE CITY IS NULL
AND FIRSTNAME LIKE '______'


-- 8. Display employees detail whose FIRSTNAME contains 'AR'.
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '%AR%'


-- 9. Display employees detail whose CITY starts with 'R' or 'B'.
SELECT * FROM EMPLOYEE
WHERE CITY LIKE 'R%'
   OR CITY LIKE 'B%'


-- 10. Display employees detail whose DEPARTMENT is NOT NULL.
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT IS NOT NULL


-- 11. Display employees detail whose FIRSTNAME starts from alphabet A to H.
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '[A-H]%'


-- 12. Display employees detail whose second character of FIRSTNAME is a vowel.
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '_A%'
   OR FIRSTNAME LIKE '_E%'
   OR FIRSTNAME LIKE '_I%'
   OR FIRSTNAME LIKE '_O%'
   OR FIRSTNAME LIKE '_U%'


-- 13. Display employees detail whose FIRSTNAME length >= 5.
SELECT * FROM EMPLOYEE
WHERE LEN(FIRSTNAME) >= 5


-- 14. Display employees detail whose LASTNAME starts with 'PA'.
SELECT * FROM EMPLOYEE
WHERE LASTNAME LIKE 'PA%'


-- 15. Display employees detail whose CITY does not start with 'B'.
SELECT * FROM EMPLOYEE
WHERE CITY NOT LIKE 'B%'


-- 16. Display employees whose second character of FIRSTNAME is not a vowel.
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME NOT LIKE '_A%'
  AND FIRSTNAME NOT LIKE '_E%'
  AND FIRSTNAME NOT LIKE '_I%'
  AND FIRSTNAME NOT LIKE '_O%'
  AND FIRSTNAME NOT LIKE '_U%'


-- 17. Display employees whose JOINING YEAR last digit is 4 or 6.
SELECT * FROM EMPLOYEE
WHERE YEAR(JOININGYEAR) LIKE '%4'
   OR YEAR(JOININGYEAR) LIKE '%6'


-- 18. Display employees detail whose FIRSTNAME starts with 'H', ends with 'I', and CITY contains 'RA'.
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE 'H%I'
AND CITY LIKE '%RA%'


-- 19. Display employees detail whose FIRSTNAME contains 'A', CITY ends with 'D', and DEPARTMENT is NOT NULL.
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '%A%'
AND CITY LIKE '%D'
AND DEPARTMENT IS NOT NULL


-- 20. Display employees whose second and third characters of FIRSTNAME are vowels and CITY starts with 'R'.
SELECT * FROM EMPLOYEE
WHERE (
      FIRSTNAME LIKE '_AA%'
   OR FIRSTNAME LIKE '_AE%'
   OR FIRSTNAME LIKE '_AI%'
   OR FIRSTNAME LIKE '_AO%'
   OR FIRSTNAME LIKE '_AU%'
   OR FIRSTNAME LIKE '_EA%'
   OR FIRSTNAME LIKE '_EE%'
   OR FIRSTNAME LIKE '_EI%'
   OR FIRSTNAME LIKE '_EO%'
   OR FIRSTNAME LIKE '_EU%'
   OR FIRSTNAME LIKE '_IA%'
   OR FIRSTNAME LIKE '_IE%'
   OR FIRSTNAME LIKE '_II%'
   OR FIRSTNAME LIKE '_IO%'
   OR FIRSTNAME LIKE '_IU%'
   OR FIRSTNAME LIKE '_OA%'
   OR FIRSTNAME LIKE '_OE%'
   OR FIRSTNAME LIKE '_OI%'
   OR FIRSTNAME LIKE '_OO%'
   OR FIRSTNAME LIKE '_OU%'
   OR FIRSTNAME LIKE '_UA%'
   OR FIRSTNAME LIKE '_UE%'
   OR FIRSTNAME LIKE '_UI%'
   OR FIRSTNAME LIKE '_UO%'
   OR FIRSTNAME LIKE '_UU%'
)
AND CITY LIKE 'R%'


-- Part - B

-- 21. Display employees whose CITY contains 'RA' and salary less than 13000 and joining year last digit is 6.
SELECT * FROM EMPLOYEE
WHERE CITY LIKE '%RA%'
AND SALARY < 13000
AND YEAR(JOININGYEAR) LIKE '%6'


-- 22. Display employees whose SALARY between 10000 and 15000 and CITY name contains 'KO' and FIRSTNAME starts with H.
SELECT * FROM EMPLOYEE
WHERE SALARY BETWEEN 10000 AND 15000
AND CITY LIKE '%KO%'
AND FIRSTNAME LIKE 'H%'


-- 23. Display employees whose FIRSTNAME starts with 'A' or 'D' and SALARY greater than 12000.
SELECT * FROM EMPLOYEE
WHERE (FIRSTNAME LIKE 'A%'
    OR FIRSTNAME LIKE 'D%')
AND SALARY > 12000


-- 24. Display employees whose CITY contains 'N' and SALARY less than 15000.
SELECT * FROM EMPLOYEE
WHERE CITY LIKE '%N%'
AND SALARY < 15000


-- 25. Display employees whose FIRSTNAME length = 6 and CITY ends with 'AR'.
SELECT * FROM EMPLOYEE
WHERE LEN(FIRSTNAME) = 6
AND CITY LIKE '%AR'


-- Part - C

-- 26. Display employees whose FIRSTNAME ends with a vowel, department name starts with a vowel, and SALARY is between 10000 and 15000.
SELECT * FROM EMPLOYEE
WHERE (
      FIRSTNAME LIKE '%A'
   OR FIRSTNAME LIKE '%E'
   OR FIRSTNAME LIKE '%I'
   OR FIRSTNAME LIKE '%O'
   OR FIRSTNAME LIKE '%U'
)
AND (
      DEPARTMENT LIKE 'A%'
   OR DEPARTMENT LIKE 'E%'
   OR DEPARTMENT LIKE 'I%'
   OR DEPARTMENT LIKE 'O%'
   OR DEPARTMENT LIKE 'U%'
)
AND SALARY BETWEEN 10000 AND 15000


-- 27. Display employees whose LASTNAME contains 'A' at least twice, gender is male, and SALARY is not equal to 14000.
SELECT * FROM EMPLOYEE
WHERE LASTNAME LIKE '%A%A%'
AND GENDER = 'Male'
AND SALARY <> 14000;

-- 28. Display employees whose FIRSTNAME second character is vowel and LASTNAME ends with ‘R’ and
-- SALARY less than 12000.
SELECT * FROM EMPLOYEE
WHERE (
      FIRSTNAME LIKE '_%A'
   OR FIRSTNAME LIKE '_%E'
   OR FIRSTNAME LIKE '_%I'
   OR FIRSTNAME LIKE '_%O'
   OR FIRSTNAME LIKE '_%U'
)
AND (
      LASTNAME LIKE '%R'
)
AND SALARY < 12000 ;

-- 29. Display employees whose CITY is NOT NULL and FIRSTNAME does not start with vowel and DEPARTMENT
-- not in (‘HR’, ‘IT’).
SELECT * FROM EMPLOYEE
WHERE (
      FIRSTNAME NOT LIKE '%A'
   OR FIRSTNAME NOT LIKE '%E'
   OR FIRSTNAME NOT LIKE '%I'
   OR FIRSTNAME NOT LIKE '%O'
   OR FIRSTNAME NOT LIKE '%U'
)
AND(
    CITY IS NOT NULL
)
AND (
      DEPARTMENT NOT LIKE 'HR'
   OR DEPARTMENT NOT LIKE 'IT'
)

-- 30. Display employees whose CITY is not NULL, FIRSTNAME ends with vowels, and DEPARTMENT is neither
-- ‘HR’ nor ‘IT’.
SELECT * FROM EMPLOYEE
WHERE (
      FIRSTNAME LIKE '%A'
   OR FIRSTNAME LIKE '%E'
   OR FIRSTNAME LIKE '%I'
   OR FIRSTNAME LIKE '%O'
   OR FIRSTNAME LIKE '%U'
)
AND(
    CITY IS NOT NULL
)
AND (
      DEPARTMENT LIKE 'HR'
   OR DEPARTMENT LIKE 'IT'
)