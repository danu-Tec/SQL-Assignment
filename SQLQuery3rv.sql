-- 1. Create the database
CREATE DATABASE LibraryDB;
GO

-- 2. Use the new database
USE LibraryDB;
GO

-- 3. Create PUBLISHER table
CREATE TABLE PUBLISHER (
    PublisherName VARCHAR(100) PRIMARY KEY,
    Address VARCHAR(255),
    Phone VARCHAR(20)
);

-- 4. Create BOOKS table
CREATE TABLE BOOKS (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    PublisherName VARCHAR(100),
    FOREIGN KEY (PublisherName) REFERENCES PUBLISHER(PublisherName)
);

-- 5. Create BOOK_AUTHORS table
CREATE TABLE BOOK_AUTHORS (
    BookID INT,
    AuthorName VARCHAR(255),
    PRIMARY KEY (BookID, AuthorName),
    FOREIGN KEY (BookID) REFERENCES BOOKS(BookID)
);

-- 6. Create LIBRARY_BRANCH table
CREATE TABLE LIBRARY_BRANCH (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(255),
    Address VARCHAR(255)
);

-- 7. Create BOOK_COPIES table
CREATE TABLE BOOK_COPIES (
    BookID INT,
    BranchID INT,
    Number_Of_Copies INT,
    PRIMARY KEY (BookID, BranchID),
    FOREIGN KEY (BookID) REFERENCES BOOKS(BookID),
    FOREIGN KEY (BranchID) REFERENCES LIBRARY_BRANCH(BranchID)
);

-- 8. Create BORROWER table
CREATE TABLE BORROWER (
    CardNo INT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Phone VARCHAR(20)
);

-- 9. Create BOOK_LOANS table
CREATE TABLE BOOK_LOANS (
    BookID INT,
    BranchID INT,
    CardNo INT,
    DateOut DATE,
    DateDue DATE,
    PRIMARY KEY (BookID, BranchID, CardNo),
    FOREIGN KEY (BookID) REFERENCES BOOKS(BookID),
    FOREIGN KEY (BranchID) REFERENCES LIBRARY_BRANCH(BranchID),
    FOREIGN KEY (CardNo) REFERENCES BORROWER(CardNo)
);
INSERT INTO LIBRARY_BRANCH (BranchID, BranchName, Address) VALUES
(1, 'Sharpstown', '123 Sharp St'),
(2, 'Westview', '45 Westview Blvd'),
(3, 'Downtown', '200 Main Ave'),
(4, 'Northline', '98 Northline Dr'),
(5, 'Eastwood', '77 Eastwood Rd'),
(6, 'Greenville', '59 Green Way');
INSERT INTO BORROWER (CardNo, Name, Address, Phone) VALUES
(101, 'Alice Johnson', '100 Apple St', '555-1111'),
(102, 'Bob Smith', '200 Banana Rd', '555-2222'),
(103, 'Charlie Lee', '300 Cherry Blvd', '555-3333'),
(104, 'Diana Ross', '400 Date Ln', '555-4444'),
(105, 'Ethan Hunt', '500 Elm St', '555-5555'),
(106, 'Fiona Kim', '600 Fig Ave', '555-6666'),
(107, 'George Ray', '700 Grape Dr', '555-7777'),
(108, 'Helen Miles', '800 Honey St', '555-8888');
INSERT INTO PUBLISHER (PublisherName, Address, Phone) VALUES
('Penguin Random House', '1745 Broadway, NY', '212-555-1000'),
('HarperCollins', '195 Broadway, NY', '212-555-1001'),
('Simon & Schuster', '1230 Ave of the Americas, NY', '212-555-1002'),
('Hachette Book Group', '1290 Ave of the Americas, NY', '212-555-1003'),
('Macmillan Publishers', '120 Broadway, NY', '212-555-1004'),
('Scholastic', '557 Broadway, NY', '212-555-1005'),
('Oxford Press', 'Great Clarendon St, Oxford', '44-1865-1006'),
('Cambridge Press', 'University Printing House, Cambridge', '44-1223-1007'),
('Bloomsbury', '50 Bedford Square, London', '44-207-1008'),
('Vintage Books', '1745 Broadway, NY', '212-555-1009');
INSERT INTO BOOKS (BookID, Title, PublisherName) VALUES
(1, 'The Lost Tribe', 'Penguin Random House'),
(2, 'To Kill a Mockingbird', 'HarperCollins'),
(3, '1984', 'Vintage Books'),
(4, 'Pride and Prejudice', 'Macmillan Publishers'),
(5, 'The Great Gatsby', 'Simon & Schuster'),
(6, 'Moby Dick', 'Hachette Book Group'),
(7, 'War and Peace', 'Oxford Press'),
(8, 'The Catcher in the Rye', 'Vintage Books'),
(9, 'Brave New World', 'HarperCollins'),
(10, 'Jane Eyre', 'Penguin Random House'),
(11, 'Wuthering Heights', 'Bloomsbury'),
(12, 'Crime and Punishment', 'Cambridge Press'),
(13, 'The Odyssey', 'Oxford Press'),
(14, 'Great Expectations', 'Macmillan Publishers'),
(15, 'The Brothers Karamazov', 'Cambridge Press'),
(16, 'Anna Karenina', 'Simon & Schuster'),
(17, 'Catch-22', 'Bloomsbury'),
(18, 'Les Misérables', 'Scholastic'),
(19, 'The Hobbit', 'Hachette Book Group'),
(20, 'Frankenstein', 'Vintage Books');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES
(1, 'John Doe'),
(2, 'Harper Lee'),
(3, 'George Orwell'),
(4, 'Jane Austen'),
(5, 'F. Scott Fitzgerald'),
(6, 'Herman Melville'),
(7, 'Leo Tolstoy'),
(8, 'J.D. Salinger'),
(9, 'Aldous Huxley'),
(10, 'Charlotte Brontë');
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_Of_Copies) VALUES
(1, 1, 3),
(2, 2, 4),
(3, 3, 5),
(4, 4, 2),
(5, 5, 6),
(6, 6, 2),
(7, 1, 4),
(8, 2, 3),
(9, 3, 2),
(10, 4, 5);
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES
(1, 1, 101, '2025-04-05', '2025-04-19'),
(2, 2, 102, '2025-04-10', '2025-04-24'),
(3, 3, 103, '2025-04-07', '2025-04-21'),
(4, 4, 104, '2025-04-08', '2025-04-22'),
(5, 5, 105, '2025-04-03', '2025-04-17'),
(6, 6, 106, '2025-04-08', '2025-04-22'),
(7, 1, 107, '2025-04-04', '2025-04-18'),
(8, 2, 108, '2025-04-08', '2025-04-22'),
(9, 3, 101, '2025-04-07', '2025-04-21'),
(10, 4, 102, '2025-04-06', '2025-04-20');
SELECT * 
FROM ((book_loans 
    FULL OUTER JOIN borrower ON book_loans.CardNo = borrower.CardNo) 
    FULL OUTER JOIN books ON book_loans.BookID = books.BookID);
SELECT 
    b.Title,
    ba.AuthorName
FROM books b
INNER JOIN book_authors ba ON b.BookID = ba.BookID;
GO
CREATE PROCEDURE GetLostTribeCopiesAtSharpstown
AS
BEGIN
    SELECT 
        lb.BranchName,
        b.Title,
        bc.Number_Of_Copies
    FROM book_copies bc
    INNER JOIN books b ON bc.BookID = b.BookID
    INNER JOIN library_branch lb ON bc.BranchID = lb.BranchID
    WHERE b.Title = 'The Lost Tribe' AND lb.BranchName = 'Sharpstown';
END;
GO
CREATE PROCEDURE GetLostTribeCopiesAllBranches
AS
BEGIN
    SELECT 
        lb.BranchName,
        b.Title,
        bc.Number_Of_Copies
    FROM book_copies bc
    INNER JOIN books b ON bc.BookID = b.BookID
    INNER JOIN library_branch lb ON bc.BranchID = lb.BranchID
    WHERE b.Title = 'The Lost Tribe';
END;
GO
CREATE PROCEDURE GetBorrowersWithNoLoans
AS
BEGIN
    SELECT 
        br.CardNo,
        br.Name,
        br.Address,
        br.Phone
    FROM borrower br
    LEFT JOIN book_loans bl ON br.CardNo = bl.CardNo
    WHERE bl.CardNo IS NULL;
END;
GO
EXEC GetLostTribeCopiesAtSharpstown;
EXEC GetLostTribeCopiesAllBranches;
EXEC GetBorrowersWithNoLoans;