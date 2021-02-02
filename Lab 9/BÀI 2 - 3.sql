-------------------------BAI 2-------------------
CREATE TABLE Toys
(
	ProductCode Varchar(5) PRIMARY KEY,
	Name Varchar(30),
	Category Varchar(30),
	Manufacturer Varchar(40),
	AgeRange Varchar(15),
	UnitPrice money,
	Netweight int,
	QtyOnHand int
)
GO
DROP Table Toys
GO

INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T11','ZOZO','BO GAME','ATONIO','12T TRO LEN',$20,100,200)
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T122','GUN','LAP RAP','ATONI','12T TRO LEN',$100,400,1000)
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('TC122','OTO','LAP RAP','JUNIO','12T TRO LEN',$400,100,150)
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('Y122','BOX','LAP GHEP','MACLO','12T TRO LEN',$10,20,1220)
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('H122','KINH','LAP GHEP','R4','12T TRO LEN',$400,220,600)
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('G122','QUAN AO','MAC','MCK','12T TRO LEN',$900,190,30)
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('M122','VONG TAY','USE','RRR','12T TRO LEN',$400,1200,2200)
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('D122','BALO','USE','FOLOW','12T TRO LEN',$110,1300,13000)
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('A122','BONG DA','USE','CANT','12T TRO LEN',$1600,1600,17000)
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('RT1','BONG CHUYEN','USE','EEE','12T TRO LEN',$1700,1050,1800)
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('GF133','VOT CAU LONG','USE','VVV','12T TRO LEN',$900,1090,1230)
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('HG132','VOT TENIS','USE','BBB','12T TRO LEN',$1020,1009,700)
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('FGF142','CAU MAY','USE','MMM','12T TRO LEN',$920,300,120)
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('NHT152','ZOZO','BO GAME','ATONIO','12T TRO LEN',$1550,453,2340)
GO

SELECT * FROM Toys
GO
-----------------1----------------
INSERT INTO Toys VALUES ('DC001','Rubic','Do choi','Marvel','3-10 tuoi',50000,50,50)
INSERT INTO Toys VALUES ('DC002','Logo tau thuy','Lap giap','Tap doan LOGO','8-13 tuoi',150000,3000,20)
INSERT INTO Toys VALUES ('DC003','Xe dieu khien','Dieu khien','Tap doan Xe DK','10-15 tuoi',90000,2000,30)
INSERT INTO Toys VALUES ('DC004','May bay dieu khien','Dieu Khien','Tap doan may bay DK','10-15 tuoi',250000,3000,30)
INSERT INTO Toys VALUES ('DC005','Logo toa nha','Lap giap','Tap doan logo','8-13 tuoi',150000,300,20)
INSERT INTO Toys VALUES ('DC006','Rubic 2','Bo game','Marvel','3-11 tuoi',350000,500,150)
INSERT INTO Toys VALUES ('DC007','Rubic  3','Bo game','Marvel','4-12 tuoi',450000,60,250)
INSERT INTO Toys VALUES ('DC008','Rubic  4','Bo game','Marvel','5-13 tuoi',550000,100,350)
INSERT INTO Toys VALUES ('DC009','Rubic  5','Bo game','Marvel','6-14 tuoi',650000,5000,450)
INSERT INTO Toys VALUES ('DC010','Rubic  6','Bo game','Marvel','7-15 tuoi',150000,900,550)
INSERT INTO Toys VALUES ('DC011','Rubic  7','Bo game','Marvel','8-15 tuoi',250000,200,650)
INSERT INTO Toys VALUES ('DC012','Rubic  8','Bo game','Marvel','9-15 tuoi',350000,300,150)
INSERT INTO Toys VALUES ('DC013','Rubic  9','Bo game','Marvel','10-15 tuoi',450000,400,250)
INSERT INTO Toys VALUES ('DC014','Rubic  10','Bo game','Marvel','11-16 tuoi',550000,600,350)
INSERT INTO Toys VALUES ('DC015','Rubic  11','Bo game','Marvel','12-17 tuoi',250000,90,450)

SELECT * FROM Toys
-----------------2----------------
CREATE PROCEDURE HeavyToysID AS
SELECT * FROM Toys
WHERE Netweight > 500
GO

EXEC HeavyToysID
GO

-----------------3------------------
CREATE PROCEDURE PriceIncreasecho AS
SELECT ProductCode,Name,UnitPrice+10 AS SauKhiTangGia FROM Toys

EXEC PriceIncreasecho
GO


----------------4------------------
CREATE PROCEDURE QtyOnHand AS
SELECT ProductCode,Name,QtyOnHand-5 AS SauKhiGiamSoLuong FROM Toys

EXEC QtyOnHand
GO



-------------------5----------------
EXECUTE HeavyToys
EXECUTE PriceIncreasecho
EXECUTE QtyOnHand



---------------------------------------------------------------------BAI 3-----------------------------------------------------------


--------------------1-------------------

sp_helptext HeavyToys
sp_helptext PriceIncreasecho
sp_helptext QtyOnHand

SELECT OBJECT_DEFINITION (OBJECT_ID(N'HeavyToys')) AS [ThucHienLenh]; 
SELECT OBJECT_DEFINITION (OBJECT_ID(N'PriceIncreasecho')) AS [ThucHienLenh]; 
SELECT OBJECT_DEFINITION (OBJECT_ID(N'QtyOnHand')) AS [ThucHienLenh];



---------------------2---------------------
EXECUTE sp_depends HeavyToys
EXECUTE sp_depends PriceIncreasecho
EXECUTE sp_depends QtyOnHand
GO


---------------------3------------------------
ALTER PROCEDURE PriceIncreasecho AS
UPDATE Toys SET UnitPrice=UnitPrice+5000
GO
SELECT *FROM Toys
GO
ALTER PROCEDURE QtyOnHand AS
UPDATE Toys SET QtyOnHand=QtyOnHand-5
GO
SELECT *FROM Toys
GO


----------------------4--------------------------
CREATE PROCEDURE SpecificPriceIncrease AS
UPDATE Toys SET UnitPrice=UnitPrice+QtyOnHand
GO
SELECT *FROM Toys
GO


----------------------5---------------------------
ALTER PROCEDURE SpecificPriceIncrease @number int OUTPUT AS
UPDATE Toys SET UnitPrice=UnitPrice+QtyOnHand
SELECT ProductCode,Name,UnitPrice as Price,QtyOnHand FROM Toys
WHERE QtyOnHand>0
SELECT @number = @@Rowcount
GO
DECLARE @num int
EXECUTE SpecificPriceIncrease @num OUTPUT
PRINT @num



-----------------------6--------------------------------
ALTER PROCEDURE SpecificPriceIncrease @number int OUTPUT AS
UPDATE Toys SET UnitPrice=UnitPrice+QtyOnHand
SELECT ProductCode,Name,UnitPrice as Price,QtyOnHand FROM Toys
WHERE QtyOnHand>0
SELECT @number = @@Rowcount
execute HeavyToys


----------------------7----------------------------------------


PERFECT


----------------------8----------------------------------------
DROP PROCEDURE HeavyToys
DROP PROCEDURE PriceIncreasecho
DROP PROCEDURE QtyOnHand
