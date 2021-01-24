--A--
SELECT * FROM Customer WHERE Name_order=UPPER('Nguyen Van A') order by Name_order;

--B--
SELECT * FROM Product
ORDER BY Price DESC
GO

--C--
CREATE TABLE SP(
Species varchar(50)

)
Go

SELECT *FROM SP
go

INSERT INTO SP (Species)
	SELECT Species FROM Category_one
	go
