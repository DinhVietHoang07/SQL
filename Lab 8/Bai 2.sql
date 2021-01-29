
-------------------------------------PHAN 2----------------------

CREATE TABLE BookSold
(
	BookSoldID int PRIMARY KEY,
	CustomerID int,
	BookCode int,
	DateID Datetime,
	Price int,
	Amount int
)
GO

INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,DateID,Price,Amount) VALUES (111,232,343,2021/01/28,150,5)
INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,DateID,Price,Amount) VALUES (121,242,353,2021/01/28,100,2)
INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,DateID,Price,Amount) VALUES (131,252,363,2021/01/28,120,44)
INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,DateID,Price,Amount) VALUES (141,262,373,2021/01/28,110,3)
INSERT INTO BookSold(BookSoldID,CustomerID,BookCode,DateID,Price,Amount) VALUES (151,272,383,2021/01/28,140,18)
GO


SELECT * FROM BookSold
Go

CREATE TABLE Books
(
	BookCode int PRIMARY KEY,
	Category varchar(50),
	Author varchar(50),
	Pubisher varchar(50),
	Title varchar(100),
	Price int,
	InStore int
)
GO


INSERT INTO Books(BookCode,Category,Author,Pubisher,Title,Price,InStore) VALUES (111,'CHUNG TA CUA QUA KHU','DINH VIET HOANG','NHO NGUOI','CHI CON....',57,1000)
INSERT INTO Books(BookCode,Category,Author,Pubisher,Title,Price,InStore) VALUES (121,'NHO NGUOI NHO AI','DINH VIET HOANG','CHO EM...','LONG TIME....',50,3000)
INSERT INTO Books(BookCode,Category,Author,Pubisher,Title,Price,InStore) VALUES (131,'CAZY BOY','DINH VIET HOANG','SLOW','SONG TOT....',51,2000)
INSERT INTO Books(BookCode,Category,Author,Pubisher,Title,Price,InStore) VALUES (141,'BADBOY','DINH VIET HOANG','LIVE','GO GO...',60,700)
INSERT INTO Books(BookCode,Category,Author,Pubisher,Title,Price,InStore) VALUES (151,'GOODBOY','DINH VIET HOANG','SAD','DOING...',90,10)
GO

SELECT * FROM Books
GO


CREATE TABLE Customers
(
	CustomerID int PRIMARY KEY,
	CustomerName varchar(50),
	Address varchar(100),
	Phone varchar(12)
)
GO

INSERT INTO Customers(CustomerID,CustomerName,Address,Phone) VALUES (232,'DINH VIET HOANG','HA NOI','0854973819')
INSERT INTO Customers(CustomerID,CustomerName,Address,Phone) VALUES (242,'KHI BEN ANH','HAI DUONG','0854973***')
INSERT INTO Customers(CustomerID,CustomerName,Address,Phone) VALUES (252,'KHI XA ANH','HAI PHONG','0854972382')
INSERT INTO Customers(CustomerID,CustomerName,Address,Phone) VALUES (262,'NGUOI TUNG NOI','QUANG NINH','0333222555')
INSERT INTO Customers(CustomerID,CustomerName,Address,Phone) VALUES (272,'AN THAM BEN EM','THANH HOA','088888888')
INSERT INTO Customers(CustomerID,CustomerName,Address,Phone) VALUES (282,'GIOT NUOC MAT','THAI BINH','08549***')
INSERT INTO Customers(CustomerID,CustomerName,Address,Phone) VALUES (292,'LA LA LA','BAC NINH','085493***')
INSERT INTO Customers(CustomerID,CustomerName,Address,Phone) VALUES (212,'DAU BIET RANG','CAO BANG','08549***2')
INSERT INTO Customers(CustomerID,CustomerName,Address,Phone) VALUES (2222,'TAM QUEN','HA GIANG','0333****')
INSERT INTO Customers(CustomerID,CustomerName,Address,Phone) VALUES (2232,'MOT MINH CHOI VOI','HUNG YEN','0888899999')
GO


SELECT * FROM Customers
GO

-----2-----
 CREATE VIEW list AS
 SELECT BookCode, Title, Price
 FROM Books
 GO


-----3-----

CREATE VIEW list01 AS
 SELECT CustomerID, CustomerName,Address
 FROM Customers
 JOIN Books AS p ON CustomerName = InStore;
 GO

 -----4-----

 CREATE VIEW List02 AS
 SELECT CustomerID, CustomerName, Address
 FROM Customers
 JOIN Books  AS p ON  CustomerID = BookCode;
 GO


-----5-----
CREATE VIEW list04 AS
SELECT CustomerName
FROM Customers
JOIN BookSold AS p ON CustomerName = Price * Amount;
GO
