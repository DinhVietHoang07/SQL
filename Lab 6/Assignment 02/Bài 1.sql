------------------------------------------------------------------- BÀI 1-------------------------------------------------------------------

CREATE TABLE Product(
ProID INT,
CatID int,
Name varchar(100),
description varchar(50),
Unit varchar(20),
Price money,
Qty int
)
GO
drop table Product
GO
INSERT INTO Product(Name,description,Unit,Price,Qty) VALUES ('May Tinh T450','New','Piece',$1000,10)
INSERT INTO Product(Name,description,Unit,Price,Qty) VALUES ('Dien thoai Nokia5670','Hot','Piece',$200,200)
INSERT INTO Product(Name,description,Unit,Price,Qty) VALUES ('May In Samsung 450','Nomar','Piece',$100,10)
GO
SELECT * FROM PRODUCT
GO

CREATE TABLE Customer(
CusID int,
Name varchar(100),
Address varchar(50),
Tel int
)
GO
drop table Customer
GO

INSERT INTO Customer(Name, Address,Tel) VALUES ('Asus','USA', 983232)
GO

SELECT * FROM Customer
GO

CREATE TABLE Order_1(
OrderID int,
CustomerID int,
Code_Order int
)
GO

DROP TABLE Order_1
GO

INSERT INTO Order_1(Code_Order) VALUES (123)
GO

SELECT * FROM Order_1
GO

CREATE TABLE Category(
CatID int,
Name varchar(100)
)
GO
drop table Category
Go
INSERT INTO Category(Name) VALUES ('MAY TINH T450'), ('DIEN THOAI Nokia5670'), ('MAY IN Samsung 450')
GO
SELECT * FROM Category
GO

CREATE TABLE Order_Details(
OrderID int,
ProductID int,
Price money,
Qty int
)
GO

DROP TABLE Order_Details
GO

INSERT INTO Order_Details(Price,Qty) VALUES ($1000,10)
INSERT INTO Order_Details(Price,Qty) VALUES ($200,200)
INSERT INTO Order_Details(Price,Qty) VALUES ($100,10)
GO

SELECT * FROM Order_Details
GO