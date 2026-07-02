SELECT * FROM LibraryBorrowing

CREATE TABLE LibraryBorrowing(
BorrowID INT PRIMARY KEY,
MemberName VARCHAR(50),
BookGenre VARCHAR(30),
DaysBorrowed INT,
FineAmount DECIMAL(8,2)
);

INSERT INTO LibraryBorrowing VALUES
(1,'Amit','Fiction',12,60.00),
(2,'Neha','Science',8,20.00),
(3,'Rahul','History',15,75.00),
(4,'Priya','Fiction',5,0.00),
(5,'Karan','Science',10,35.00),
(6,'Sneha','Technology',20,120.00),
(7,'Amit','History',7,15.00),
(8,'Neha','Technology',18,95.00),
(9,'Rahul','Fiction',9,30.00),
(10,'Priya','Science',11,45.00)

-- I. Display the total fine amount collected for each book genre.
SELECT BookGenre,SUM(FineAmount) AS TotalFine
FROM LibraryBorrowing
GROUP BY BookGenre

-- II. Find the average number of days borrowed for each book genre.
SELECT BookGenre,AVG(DaysBorrowed) AS AverageDays
FROM LibraryBorrowing
GROUP BY BookGenre

-- III. Display the number of borrowing records for each member.
SELECT MemberName,COUNT(*) AS BorrowRecords
FROM LibraryBorrowing
GROUP BY MemberName

-- IV. Find the maximum fine amount paid in each book genre.
SELECT BookGenre,MAX(FineAmount) AS MaximumFine
FROM LibraryBorrowing
GROUP BY BookGenre

-- V. Display the minimum days borrowed for each book genre.
SELECT BookGenre,MIN(DaysBorrowed) AS MinimumDays
FROM LibraryBorrowing
GROUP BY BookGenre

-- VI. Find the total number of days books were borrowed by each member.
SELECT MemberName,SUM(DaysBorrowed) AS TotalDaysBorrowed
FROM LibraryBorrowing
GROUP BY MemberName

-- VII. Display the average fine amount paid by each member.
SELECT MemberName,AVG(FineAmount) AS AverageFine
FROM LibraryBorrowing
GROUP BY MemberName

-- VIII. Find the highest number of days borrowed by each member.
SELECT MemberName,MAX(DaysBorrowed) AS HighestDaysBorrowed
FROM LibraryBorrowing
GROUP BY MemberName

-- IX. Find the difference between the highest and lowest fine for each genre.
SELECT BookGenre,MAX(FineAmount)-MIN(FineAmount) AS FineDifference
FROM LibraryBorrowing
GROUP BY BookGenre

-- X. Find how many times has each member borrowed a book.
SELECT MemberName,COUNT(BorrowID) AS TimesBorrowed
FROM LibraryBorrowing
GROUP BY MemberName