USE AdventureWorks2019
GO


SELECT * FROM Production.Location
go
INSERT INTO Production.Location (Name,CostRate, Availability, ModifiedDate)values ('Books Shop', 0, 0, '2019/11/02'),('CoopMart', 0, 0,'2002/01/10'),('BigC', 0, 0,'2003/03/09')
go

CREATE TABLE Temp(
Name varchar(50),
ModifiedDate datetime
)
Go
SELECT *FROM Temp
go
INSERT INTO Temp (Name, ModifiedDate)
	SELECT Name, ModifiedDate FROM Production.Location
	go

UPDATE Production.Location Set
Name = 'Đinh Việt Hoàng',CostRate ='1.22', ModifiedDate = '2021/01/22'
WHERE LocationID = 20

DELETE FROM Production.Location
WHERE Name = 'BigC'
