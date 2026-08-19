--------------------CUSTOMER_ALL-----------------

CREATE TABLE CUSTOMER_ALL
(
ORDERID INT PRIMARY KEY,
CNAME VARCHAR(30),
PRODUCT VARCHAR(30),
CATEGORY VARCHAR(30),
AMOUNT DECIMAL(10,2),
ORDERYEAR INT,
CITY VARCHAR(30)
);

INSERT INTO CUSTOMER_ALL VALUES
(101,'RAHUL','LAPTOP','ELECTRONICS',65000,2024,'RAJKOT'),
(102,'PRIYA','MOBILE','ELECTRONICS',25000,2023,'SURAT'),
(103,'AMIT','TABLE','FURNITURE',12000,2022,'AHMEDABAD'),
(104,'NEHA','CHAIR','FURNITURE',8000,2024,'BARODA'),
(105,'VISHAL','TV','ELECTRONICS',45000,2025,'MORBI'),
(106,'RIYA','SOFA','FURNITURE',30000,2023,'SURAT'),
(107,'MEHUL','AC','ELECTRONICS',40000,2022,'RAJKOT'),
(108,'KRUNAL','BED','FURNITURE',40000,2025,'JAMNAGAR');

SELECT * FROM CUSTOMER_ALL



-- Part – A

-- 1. Display top 3 highest amount orders.
SELECT TOP 3 * 
FROM CUSTOMER_ALL 
ORDER BY AMOUNT DESC

-- 2. Display second highest order amount.
SELECT MAX(AMOUNT) AS Second_Highest_Amount
FROM CUSTOMER_ALL
WHERE AMOUNT < (SELECT MAX(AMOUNT) FROM CUSTOMER_ALL)

-- 3. Display customers whose order amount is greater than category average amount.
SELECT C.* 
FROM CUSTOMER_ALL C
INNER JOIN (
SELECT CATEGORY, AVG(AMOUNT) AS Avg_Amt 
FROM CUSTOMER_ALL 
GROUP BY CATEGORY
) A ON C.CATEGORY = A.CATEGORY
WHERE C.AMOUNT > A.Avg_Amt

-- 4. Display categories having average amount greater than 30000.
SELECT CATEGORY, AVG(AMOUNT) AS Average_Amount
FROM CUSTOMER_ALL
GROUP BY CATEGORY
HAVING AVG(AMOUNT) > 30000

-- 5. Display highest amount order from each category.
SELECT * 
FROM (
SELECT *, RANK() OVER(PARTITION BY CATEGORY ORDER BY AMOUNT DESC) AS Rnk
FROM CUSTOMER_ALL
) T WHERE Rnk = 1

-- 6. Display lowest amount order from each category.
SELECT * 
FROM (
SELECT *, RANK() OVER(PARTITION BY CATEGORY ORDER BY AMOUNT ASC) AS Rnk
FROM CUSTOMER_ALL
) T WHERE Rnk = 1

-- 7. Display categories having more than 3 orders.
SELECT CATEGORY, COUNT(ORDERID) AS Total_Orders
FROM CUSTOMER_ALL
GROUP BY CATEGORY
HAVING COUNT(ORDERID) > 3

-- 8. Display city-wise total order amount.
SELECT CITY, SUM(AMOUNT) AS Total_Amount
FROM CUSTOMER_ALL
GROUP BY CITY

-- 9. Display category having highest average order amount.
SELECT TOP 1 CATEGORY, AVG(AMOUNT) AS Highest_Avg_Amount
FROM CUSTOMER_ALL
GROUP BY CATEGORY
ORDER BY Highest_Avg_Amount DESC

-- 10. Display cumulative order amount in ascending order of amount.
SELECT *, SUM(AMOUNT) OVER(ORDER BY AMOUNT ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Cumulative_Amount
FROM CUSTOMER_ALL

-- Part – B

-- 11. Display category-wise top 2 highest amount orders.
SELECT ORDERID, CNAME, PRODUCT, CATEGORY, AMOUNT, ORDERYEAR, CITY 
FROM (
SELECT *, DENSE_RANK() OVER(PARTITION BY CATEGORY ORDER BY AMOUNT DESC) AS Drnk
FROM CUSTOMER_ALL
) T WHERE Drnk <= 2

-- 12. Display customers whose amount is closest to category average amount.
SELECT ORDERID, CNAME, PRODUCT, CATEGORY, AMOUNT, ORDERYEAR, CITY 
FROM (
SELECT *, 
ABS(AMOUNT - AVG(AMOUNT) OVER(PARTITION BY CATEGORY)) AS Diff,
RANK() OVER(PARTITION BY CATEGORY ORDER BY ABS(AMOUNT - AVG(AMOUNT) OVER(PARTITION BY CATEGORY)) ASC) AS Rnk
FROM CUSTOMER_ALL
) T WHERE Rnk = 1

-- 13. Display previous, current and next order amount together.
-- Ordered by ORDERID to capture sequential order patterns
SELECT ORDERID, CNAME, AMOUNT,
LAG(AMOUNT) OVER(ORDER BY ORDERID) AS Previous_Amount,
AMOUNT AS Current_Amount,
LEAD(AMOUNT) OVER(ORDER BY ORDERID) AS Next_Amount
FROM CUSTOMER_ALL

-- 14. Display customers whose amount is greater than previous customer's amount.
-- Sequenced by ORDERID to cleanly evaluate preceding purchases
SELECT ORDERID, CNAME, PRODUCT, CATEGORY, AMOUNT, ORDERYEAR, CITY 
FROM (
SELECT *, LAG(AMOUNT) OVER(ORDER BY ORDERID) AS Prev_Amt
FROM CUSTOMER_ALL
) T WHERE AMOUNT > Prev_Amt

-- 15. Display customers whose rank and dense rank are different.
-- Ordered globally by AMOUNT; reveals items where duplicate amounts alter subsequent values differently
SELECT ORDERID, CNAME, AMOUNT, Rnk, Drnk 
FROM (
SELECT *, 
RANK() OVER(ORDER BY AMOUNT DESC) AS Rnk,
DENSE_RANK() OVER(ORDER BY AMOUNT DESC) AS Drnk
FROM CUSTOMER_ALL
) T WHERE Rnk <> Drnk


-- Part – C

-- 16. Display orders whose amount is neither highest nor lowest in their category.
SELECT ORDERID, CNAME, PRODUCT, CATEGORY, AMOUNT, ORDERYEAR, CITY 
FROM (
SELECT *, 
MAX(AMOUNT) OVER(PARTITION BY CATEGORY) AS Max_Amt,
MIN(AMOUNT) OVER(PARTITION BY CATEGORY) AS Min_Amt
FROM CUSTOMER_ALL
) T WHERE AMOUNT > Min_Amt AND AMOUNT < Max_Amt;

-- 17. Display category-wise difference between highest and lowest amount.
SELECT CATEGORY, (MAX(AMOUNT) - MIN(AMOUNT)) AS Amount_Difference
FROM CUSTOMER_ALL
GROUP BY CATEGORY;

-- 18. Display customers whose amount is greater than all FURNITURE category orders.
SELECT * 
FROM CUSTOMER_ALL 
WHERE AMOUNT > ALL (SELECT AMOUNT FROM CUSTOMER_ALL WHERE CATEGORY = 'FURNITURE');

-- 19. Display categories where all orders are above 10000.
SELECT CATEGORY 
FROM CUSTOMER_ALL 
GROUP BY CATEGORY 
HAVING MIN(AMOUNT) > 10000;

-- 20. Display customers whose amount difference from category topper is minimum.
-- Excludes the topper themselves (Diff > 0) to locate the closest competitor
SELECT ORDERID, CNAME, PRODUCT, CATEGORY, AMOUNT, ORDERYEAR, CITY 
FROM (
SELECT *, 
(MAX(AMOUNT) OVER(PARTITION BY CATEGORY) - AMOUNT) AS Diff,
RANK() OVER(PARTITION BY CATEGORY ORDER BY (MAX(AMOUNT) OVER(PARTITION BY CATEGORY) - AMOUNT) ASC) AS Rnk
FROM CUSTOMER_ALL
WHERE AMOUNT < MAX(AMOUNT) OVER(PARTITION BY CATEGORY)
) T WHERE Rnk = 1;
