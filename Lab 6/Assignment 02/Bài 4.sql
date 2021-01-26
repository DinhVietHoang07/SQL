--A--
CREATE TABLE Temp(
Name varchar(50),
)
Go
drop table Temp
Go

SELECT *FROM Temp
go
INSERT INTO Temp (Name)
	SELECT Name FROM Customer
	go



--B--
CREATE TABLE List(
Name varchar(50)

)
Go
drop table List
Go

SELECT *FROM List
go

INSERT INTO List (Name)
	SELECT Name FROM Category
	go
