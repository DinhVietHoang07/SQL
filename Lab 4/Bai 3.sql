

USE AdventureWorks2019
GO

CREATE TABLE Product(
STT int identity,
Name varchar(100),
description varchar(50),
Unit varchar(20),
Price money
)
GO

SELECT *FROM Product
Go

INSERT INTO Product(Name,Description,Unit, Price) values ('May Tinh T450','New','Piece',$1000)
INSERT INTO Product(Name,Description,Unit, Price) values ('Dien thoai Nokia5670','Hot','Piece',$400)
INSERT INTO Product(Name,Description,Unit, Price) values ('May In Samsung 450','Nomar','Piece',$100)
GO

drop table Product
Go

CREATE TABLE  Category_one(
STT int identity,
Species varchar(50)
)
GO

SELECT * FROM Category_one
GO

INSERT INTO Category_one (Species) VALUES ('MAY TINH'),('DIEN THOAI'),('MAY IN')
GO

CREATE TABLE Order_one(
STT int identity,
Code_order int,
Name_order varchar(50),
address nvarchar (199),
Number_Phone int,
Date_order datetime
)
GO

SELECT * FROM Order_one
Go

INSERT INTO Order_one(Code_order,Name_order,address,Number_Phone,Date_order)VALUES (123,'Nguyen Van An','111 Nguyen Trai, Thanh Xuan, Ha Noi', 987654321,2021/01/22)
Go

CREATE TABLE OrderDetails(
description varchar(50),
Price money
)
GO
drop table OrderDetails
Go

INSERT INTO OrderDetails (description,Price) VALUES ('NEW',$1000),('HOT',$200),('NOMAR',$100)
GO

SELECT *FROM OrderDetails
GO

CREATE TABLE Customer(
STT int identity,
Name_order varchar(50),
address nvarchar (199),
Number_Phone int
)
Go
drop table Customer
Go

INSERT INTO Customer(Name_order,address,Number_Phone) VALUES ('Nguyen Van An','111 Nguyen Trai, Thanh Xuan, Ha Noi', 987654321)
GO

SELECT * FROM Customer
GO


--CÂU LỆNH ĐỂ THÊM DỮ LIỆU/
UPDATE Customer Set
Name_order ='Dinh Viet Hoang',address ='My Dinh - Ha Noi',Number_Phone='0854973819'
Where STT=1

GO