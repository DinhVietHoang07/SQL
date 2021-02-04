
-----Bai 1-2-3------


USE AdventureWorks2019
GO


CREATE TABLE Categories_
(
	CateID char(6) PRIMARY KEY,
	CateName nvarchar(100) Not Null,
	Description nvarchar(200)
)
GO


INSERT INTO Categories_(CateID,CateName,Description) VALUES ('T11','RAM','Luu Du Lieu')
INSERT INTO Categories_(CateID,CateName,Description) VALUES ('T12','CPU','Bo phan Xu Li')
INSERT INTO Categories_(CateID,CateName,Description) VALUES ('T13','HDD','Cau Truc')
GO

SELECT * FROM Categories_
GO


CREATE TABLE Parts_
(
	PartID int PRIMARY KEY IDENTITY,
	PartName nvarchar(100),
	CateID char(6)Foreign Key (CateID) References Categories_(CateID),
	Description nvarchar(1000),
	Price money Not Null Default'0',
	Quantity int Default'0',
	Warranty int Default '1',
	Photo nvarchar(200) Default'photo/nophoto.png',
)
GO

INSERT INTO Parts_(PartName,CateID,Description,Price,Quantity,Warranty,Photo) VALUES ('Man Hinh','T11','Good',$1000,3,2,'noPhoto.png')
INSERT INTO Parts_(PartName,CateID,Description,Price,Quantity,Warranty,Photo) VALUES ('Ban Phim','T12','Nomar',$700,3,2,'Photo.png')
INSERT INTO Parts_(PartName,CateID,Description,Price,Quantity,Warranty,Photo) VALUES ('Chuot','T13','Hot',$200,3,2,'Photo.png')
GO

SELECT * FROM Parts_
GO


-----Bai 4-----
SELECT * FROM Parts_
WHERE Price > 100
GO



-----Bai 5-----
SELECT * FROM Categories_
WHERE CateName='CPU'
GO



-----Bai 6-----
CREATE VIEW v_Parts AS
SELECT PartID, PartName,CateName,Price, Quantity
FROM Parts_, Categories_
GO

SELECT * FROM v_Parts
GO



-----Bai 7-----
CREATE VIEW v_TopPartsID AS
SELECT TOP(5) Price
FROM Parts_
WHERE Price > 0
ORDER BY Price ASC
Go

SELECT  * FROM Parts_
GO
