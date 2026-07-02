SELECT * FROM EMPLOYEE

-- 1. Display the Highest, Lowest Salary and label columns Maximum, Minimum respectively.
SELECT MAX(SALARY) AS Maximum, MIN(SALARY) AS Minimum
FROM EMPLOYEE

-- 2. Display Total and Average salary of all employees. Label Total_Sal and Average_Sal.
SELECT SUM(SALARY) AS Total_Sal, AVG(SALARY) AS Average_Sal
FROM EMPLOYEE

-- 3. Find total number of employees of EMPLOYEE table.
SELECT COUNT(*) AS Total_Employees
FROM EMPLOYEE

-- 4. Find highest salary from Rajkot city.
SELECT MAX(SALARY) AS Highest_Salary
FROM EMPLOYEE
WHERE CITY='Rajkot'

-- 5. Give maximum salary from IT department.
SELECT MAX(SALARY) AS Max_Salary
FROM EMPLOYEE
WHERE DEPARTMENT='IT'

-- 6. Count employee department is HR.
SELECT COUNT(*) AS HR_Employees
FROM EMPLOYEE
WHERE DEPARTMENT='HR'

-- 7. Display average salary of Admin department.
SELECT AVG(SALARY) AS Avg_Admin_Salary
FROM EMPLOYEE
WHERE DEPARTMENT='Admin'

-- 8. Display total salary of HR department.
SELECT SUM(SALARY) AS Total_HR_Salary
FROM EMPLOYEE
WHERE DEPARTMENT='HR'

-- 9. Count total number of cities of employee without duplication.
SELECT COUNT(DISTINCT CITY) AS Unique_Cities
FROM EMPLOYEE

-- 10. Count unique departments.
SELECT COUNT(DISTINCT DEPARTMENT) AS Unique_Departments
FROM EMPLOYEE

-- 11. Display minimum salary of employee who belongs to Ahmedabad.
SELECT MIN(SALARY) AS Min_Salary
FROM EMPLOYEE
WHERE CITY='Ahmedabad'

-- 12. City wise highest salary.
SELECT CITY, MAX(SALARY) AS Highest_Salary
FROM EMPLOYEE
GROUP BY CITY

-- 13. Department wise lowest salary.
SELECT DEPARTMENT, MIN(SALARY) AS Lowest_Salary
FROM EMPLOYEE
GROUP BY DEPARTMENT

-- 14. Minimum salary in each city.
SELECT CITY, MIN(SALARY) AS Min_Salary
FROM EMPLOYEE
GROUP BY CITY

-- 15. Average salary of employees from Surat.
SELECT AVG(SALARY) AS Avg_Salary
FROM EMPLOYEE
WHERE CITY='Surat'

-- 16. Total salary of female employees.
SELECT SUM(SALARY) AS Total_Female_Salary
FROM EMPLOYEE
WHERE GENDER='FEMALE'

-- 17. Count number of male employees.
SELECT COUNT(*) AS Male_Employees
FROM EMPLOYEE
WHERE GENDER='MALE'

-- 18. City wise total number of employees.
SELECT CITY, COUNT(*) AS Total_Employees
FROM EMPLOYEE
GROUP BY CITY

-- 19. Number of employees in each city where gender is MALE.
SELECT CITY, COUNT(*) AS Male_Employees
FROM EMPLOYEE
WHERE GENDER='MALE'
GROUP BY CITY

-- 20. Maximum salary in each department where city is not Ahmedabad.
SELECT DEPARTMENT, MAX(SALARY) AS Max_Salary
FROM EMPLOYEE
WHERE CITY <> 'Ahmedabad'
GROUP BY DEPARTMENT

-- 21. Minimum salary in each city where gender is FEMALE.
SELECT CITY, MIN(SALARY) AS Min_Salary
FROM EMPLOYEE
WHERE GENDER='FEMALE'
GROUP BY CITY

-- 22. Total salary of each department.
SELECT DEPARTMENT, SUM(SALARY) AS Total_Salary
FROM EMPLOYEE
GROUP BY DEPARTMENT

-- 23. Average salary of each department without displaying department name.
SELECT AVG(SALARY) AS Average_Salary
FROM EMPLOYEE
GROUP BY DEPARTMENT

-- 24. Number of employees for each department in every city.
SELECT DEPARTMENT, CITY, COUNT(*) AS Employee_Count
FROM EMPLOYEE
GROUP BY DEPARTMENT, CITY

-- 25. Total salary for male and female employees.
SELECT GENDER, SUM(SALARY) AS Total_Salary
FROM EMPLOYEE
GROUP BY GENDER

-- 26. City wise maximum and minimum salary of female employees.
SELECT CITY, MAX(SALARY) AS Max_Salary, MIN(SALARY) AS Min_Salary
FROM EMPLOYEE
WHERE GENDER='FEMALE'
GROUP BY CITY

-- 27. Department, city, and gender wise average salary.
SELECT DEPARTMENT, CITY, GENDER, AVG(SALARY) AS Avg_Salary
FROM EMPLOYEE
GROUP BY DEPARTMENT, CITY, GENDER

-- 28. Difference between highest and lowest salaries.
SELECT (MAX(SALARY) - MIN(SALARY)) AS DIFFERENCE
FROM EMPLOYEE

-- 29. Sum of salaries department wise where department name consists of 5 letters.
SELECT DEPARTMENT, SUM(SALARY) AS Total_Salary
FROM EMPLOYEE
WHERE LEN(DEPARTMENT)=5
GROUP BY DEPARTMENT

-- 30. Maximum salary department & city wise where city starts with 'R'.
SELECT DEPARTMENT, CITY, MAX(SALARY) AS Max_Salary
FROM EMPLOYEE
WHERE CITY LIKE 'R%'
GROUP BY DEPARTMENT, CITY
