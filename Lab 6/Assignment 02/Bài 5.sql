------A-----
SELECT * FROM Product
ORDER BY Name DESC
GO

-----B-----
SELECT * FROM Product
ORDER BY Price DESC
GO
-----C-----
CREATE TABLE SP(
Name varchar(50)
)
Go

DROP TABLE SP
GO 

SELECT *FROM SP
go

INSERT INTO SP (Name)
	SELECT Name FROM Customer
	go

	------D-----
SELECT * FROM Order_Details
where Qty < 11 
GO

-----E-----
SELECT Name FROM  Category
Go