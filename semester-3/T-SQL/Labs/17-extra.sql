---EXTRAAAAA
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR (100) NOT NULL,
City VARCHAR (100),
Membership VARCHAR (20)
);


INSERT INTO Customers (CustomerID, CustomerName, City, Membership) VALUES
(101, 'Alice', 'Mumbai', 'Gold'),
(102, 'Bob', 'Delhi', 'Silver'),
(103, 'Charlie', 'Pune', 'Gold'),
(104, 'David', 'Ahmedabad', 'Silver'),
(105, 'Eva', 'Mumbai', 'Platinum');


CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT NOT NULL,
Product VARCHAR (100) NOT NULL,
Category VARCHAR (50),
Quantity INT NOT NULL,
Price DECIMAL (10,2) NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);


INSERT INTO Orders (OrderID, CustomerID, Product, Category, Quantity, Price) VALUES
(201, 101, 'Laptop', 'Electronics', 1, 70000),
(202, 101, 'Mouse', 'Electronics', 2, 800),
(203, 102, 'Chair', 'Furniture', 3, 2500),
(204, 103, 'Phone', 'Electronics', 1, 45000),
(205, 104, 'Table', 'Furniture', 2, 6000),
(206, 105, 'Laptop', 'Electronics', 2, 70000),
(207, 105, 'Printer', 'Electronics', 1, 12000),
(208, 103, 'Desk', 'Furniture', 1, 8000);






-- 1. CustomerOrders
CREATE VIEW CustomerOrders AS
SELECT C.CustomerName, C.City,
       P.ProductName AS Product,
       P.Category,
       O.Quantity,
       P.Price
FROM CUSTOMER C
JOIN ORDERS O ON C.CustomerID = O.CustomerID
JOIN PRODUCT P ON O.ProductID = P.ProductID;

-- 2. GoldCustomersOrders
CREATE VIEW GoldCustomersOrders AS
SELECT C.CustomerName, C.City,
       P.ProductName,
       P.Category,
       O.Quantity,
       P.Price
FROM CUSTOMER C
JOIN ORDERS O ON C.CustomerID = O.CustomerID
JOIN PRODUCT P ON O.ProductID = P.ProductID
WHERE C.MembershipType = 'Gold';

-- 3. ElectronicOrders
CREATE VIEW ElectronicOrders AS
SELECT C.CustomerName,
       P.ProductName,
       O.Quantity,
       P.Price
FROM CUSTOMER C
JOIN ORDERS O ON C.CustomerID = O.CustomerID
JOIN PRODUCT P ON O.ProductID = P.ProductID
WHERE P.Category = 'Electronics';

-- 4. CustomerPurchaseSummary
CREATE VIEW CustomerPurchaseSummary AS
SELECT C.CustomerName,
       SUM(O.Quantity * P.Price) AS PurchaseAmount
FROM CUSTOMER C
JOIN ORDERS O ON C.CustomerID = O.CustomerID
JOIN PRODUCT P ON O.ProductID = P.ProductID
GROUP BY C.CustomerName;

-- 5. CustomerOrderCount
CREATE VIEW CustomerOrderCount AS
SELECT C.CustomerName,
       COUNT(O.OrderID) AS NumberOfOrders
FROM CUSTOMER C
JOIN ORDERS O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerName;

-- 6. CategorySales
CREATE VIEW CategorySales AS
SELECT P.Category,
       COUNT(O.OrderID) AS NumberOfOrders,
       SUM(O.Quantity) AS TotalQuantitySold
FROM PRODUCT P
JOIN ORDERS O ON P.ProductID = O.ProductID
GROUP BY P.Category;

-- 7. AmountDetails
CREATE VIEW AmountDetails AS
SELECT C.MembershipType,
       AVG(O.Quantity * P.Price) AS AveragePurchaseAmount
FROM CUSTOMER C
JOIN ORDERS O ON C.CustomerID = O.CustomerID
JOIN PRODUCT P ON O.ProductID = P.ProductID
GROUP BY C.MembershipType;

-- 8. CitySales
CREATE VIEW CitySales AS
SELECT C.City,
       COUNT(DISTINCT C.CustomerID) AS TotalCustomers,
       SUM(O.Quantity * P.Price) AS TotalPurchaseAmount
FROM CUSTOMER C
JOIN ORDERS O ON C.CustomerID = O.CustomerID
JOIN PRODUCT P ON O.ProductID = P.ProductID
GROUP BY C.City;

-- 9. CustomerSales
CREATE VIEW CustomerSales AS
SELECT C.CustomerName,
       C.MembershipType,
       SUM(O.Quantity) AS TotalQuantityPurchased,
       SUM(O.Quantity * P.Price) AS TotalAmountSpent
FROM CUSTOMER C
JOIN ORDERS O ON C.CustomerID = O.CustomerID
JOIN PRODUCT P ON O.ProductID = P.ProductID
GROUP BY C.CustomerName, C.MembershipType;

-- 10. CustomerMembership
CREATE VIEW CustomerMembership AS
SELECT P.Category,
       C.MembershipType,
       SUM(O.Quantity * P.Price) AS TotalSales,
       AVG(O.Quantity) AS AverageQuantityPurchased
FROM CUSTOMER C
JOIN ORDERS O ON C.CustomerID = O.CustomerID
JOIN PRODUCT P ON O.ProductID = P.ProductID
GROUP BY P.Category, C.MembershipType