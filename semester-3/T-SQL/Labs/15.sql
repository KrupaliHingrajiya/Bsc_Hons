--1. List all books with their authors.

SELECT TITLE ,AUTHORNAME FROM AUTHOR JOIN BOOK
ON AUTHOR.AUTHORID = BOOK.AUTHORID

--2. List all books with their publishers.

SELECT TITLE ,PUBLISHERNAME FROM PUBLISHER JOIN BOOK
ON BOOK.PUBLISHERID = PUBLISHER.PUBLISHERID

--3. List all books with their authors and publishers.

SELECT TITLE, AUTHORNAME , PUBLISHERNAME FROM BOOK B INNER JOIN AUTHOR A
ON B.AUTHORID = A.AUTHORID
INNER JOIN PUBLISHER P
ON P.PUBLISHERID = B.PUBLISHERID

--4. List all books published after 2010 with their authors and publisher and price.

SELECT TITLE ,AUTHORNAME ,PUBLISHERNAME,PRICE FROM BOOK B INNER JOIN AUTHOR A
ON B.AUTHORID = A.AUTHORID
INNER JOIN PUBLISHER P 
ON P.PUBLISHERID = B.PUBLISHERID
WHERE PUBLICATIONYEAR > 2010

--5. List all authors and the number of books they have written.

SELECT AUTHORNAME,COUNT(AUTHORNAME) FROM AUTHOR JOIN BOOK 
ON AUTHOR.AUTHORID = BOOK.AUTHORID
GROUP BY AUTHORNAME

--6. List all publishers and the total price of books they have published.

SELECT PUBLISHERNAME,COUNT(PUBLISHERNAME) FROM PUBLISHER JOIN BOOK 
ON PUBLISHER.PUBLISHERID = BOOK.AUTHORID
GROUP BY PUBLISHERNAME

--7. List authors who have not written any books.

SELECT AUTHORNAME FROM AUTHOR LEFT JOIN BOOK
ON BOOK.AUTHORID = AUTHOR.AUTHORID
WHERE BOOKID IS NULL

--8. Display the total number of books written by each author along with the average price of their books.

SELECT AUTHORNAME ,COUNT(BOOKID),AVG(PRICE) FROM AUTHOR JOIN BOOK
ON BOOK.AUTHORID = AUTHOR.AUTHORID
GROUP BY AUTHORNAME

--9. lists each publisher along with the total number of books they have published, sorted from highest to lowest.

SELECT PUBLISHERNAME , COUNT(BOOKID) FROM PUBLISHER JOIN BOOK
ON BOOK.PUBLISHERID = PUBLISHER.PUBLISHERID
GROUP BY PUBLISHERNAME
ORDER BY COUNT(BOOKID) DESC

--10. Display number of books published each year.

SELECT PUBLICATIONYEAR ,COUNT(BOOKID) FROM PUBLISHER JOIN BOOK
ON BOOK.PUBLISHERID = PUBLISHER.PUBLISHERID
GROUP BY PUBLICATIONYEAR

--TABLE 

CREATE TABLE EMPLOYEE_MASTER1 (
EmployeeNo VARCHAR(10),
ENAME VARCHAR(30),
ManagerNo VARCHAR(10),
);

INSERT INTO EMPLOYEE_MASTER1 
VALUES('E01', 'Tarun', NULL),
('E02', 'Rohan', 'E02'),
('E03' ,'Priya' ,'E01'),
('E04', 'Milan', 'E03'),
('E05' ,'Jay' ,'E01'),
('E06', 'Anjana', 'E04')

--11. List the publishers whose total book prices exceed 500, ordered by the total price.

SELECT PUBLISHERNAME ,SUM(PRICE) FROM PUBLISHER LEFT JOIN BOOK
ON BOOK.PUBLISHERID = PUBLISHER.PUBLISHERID
GROUP BY PUBLISHERNAME
HAVING SUM(PRICE) > 500
ORDER BY SUM(PRICE)

--12. List most expensive book for each author, sort it with the highest price.

SELECT AUTHORNAME ,MAX(PRICE) FROM AUTHOR LEFT JOIN BOOK 
ON BOOK.AUTHORID = AUTHOR.AUTHORID
GROUP BY AUTHORNAME
ORDER BY MAX(PRICE) DESC

--13. Display publisher name and difference between maximum and minimum book price.

SELECT PUBLISHERNAME ,MAX(PRICE)-MIN(PRICE) FROM PUBLISHER LEFT JOIN BOOK
ON BOOK.PUBLISHERID = PUBLISHER.PUBLISHERID
GROUP BY PUBLISHERNAME

--14. List publisher name and total price of books published each year.

SELECT PUBLISHERNAME,PUBLICATIONYEAR ,SUM(PRICE) FROM PUBLISHER JOIN BOOK
ON BOOK.PUBLISHERID = PUBLISHER.PUBLISHERID
GROUP BY PUBLISHERNAME,PUBLICATIONYEAR

--15. Display author name and total price of books sorted by highest total price.

SELECT AUTHORNAME,SUM(PRICE) FROM AUTHOR LEFT JOIN BOOK
ON BOOK.AUTHORID = AUTHOR.AUTHORID
GROUP BY AUTHORNAME 
ORDER BY SUM(PRICE) DESC

--16. Retrieve the names of employee along with their manager’s name from the Employee table.

SELECT ENAME FROM EMPLOYEE_MASTER1 E INNER JOIN EMPLOYEE_MASTER1 E1
ON E1.EmployeeNo = E.EmployeeNo

--17. Display employees who are managers.

SELECT ENAME FROM EMPLOYEE_MASTER1 E INNER JOIN EMPLOYEE_MASTER1 E1
ON E1.EmployeeNo = E.EmployeeNo
WHERE ManagerNo IS NOT NULL

--18. Display number of employees working under each manager.

SELECT manager_id, COUNT(*) AS employee_count
FROM EMPLOYEE
WHERE manager_id IS NOT NULL
GROUP BY manager_id;
--19. Display the employee’s name along with their manager’s name and senior manager name.

SELECT e.emp_name AS employee,
       m.emp_name AS manager,
       s.emp_name AS senior_manager
FROM EMPLOYEE e
LEFT JOIN EMPLOYEE m ON e.manager_id = m.emp_id
LEFT JOIN EMPLOYEE s ON m.manager_id = s.emp_id;
--20. Display managers and count of employees under them in descending order.

SELECT m.emp_name AS manager,
       COUNT(e.emp_id) AS employee_count
FROM EMPLOYEE m
JOIN EMPLOYEE e ON m.emp_id = e.manager_id
GROUP BY m.emp_id, m.emp_name
ORDER BY employee_count DESC;