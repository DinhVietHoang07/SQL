CREATE DATABASE Lab10
GO

USE AdventureWorks2019
SELECT*INTO Lab10.dbo.WorkOrder FROM Production.WorkOrder
GO

USE Lab10
SELECT*INTO WorkOrderIX FROM WorkOrder
GO

SELECT*FROM WorkOrder
SELECT*FROM WorkOrderIX
Go

CREATE INDEX IX_WorkOrderID ON WorkOrderIX(WorkOrderID)
GO

SELECT*FROM WorkOrder where WorkOrderID=72000
SELECT*FROM WorkOrderIX where WorkOrderID=72000
GO

--------------------------PHAN 2------------------

CREATE DATABASE CodeLean
GO

USE Codelean
GO

CREATE TABLE Classes 
(
	ClassName char(6),
	Teacher varchar(30),
	TimeSlot varchar(30),
	Class int,
	Lab int
)
GO

INSERT INTO Classes(ClassName,Teacher,TimeSlot,Class,Lab) VALUES (111,'DANG KIM THI','MATH',123,206)
INSERT INTO Classes(ClassName,Teacher,TimeSlot,Class,Lab) VALUES (112,'TRAN TRUNG TRUC','ENGLISH',222,207)
INSERT INTO Classes(ClassName,Teacher,TimeSlot,Class,Lab) VALUES (113,'TDANG THI NOI DOI','HISTORY',333,208)
GO
DROP TABLE Classes
GO

SELECT * FROM Classes
GO

-----1----
CREATE  UNIQUE INDEX MyClusteredIndex ON Classes(ClassName)
GO

CREATE CLUSTERED INDEX MyClustered  ON Classes(ClassName)
GO

CREATE INDEX MyIndex ON Classes(ClassName)
GO


-----2-----
CREATE  NONCLUSTERED INDEX TeacherIndex ON Classes(Teacher)
GO


-----3-----
DROP INDEX TeacherIndex ON Classes
GO


-----4-----
ALTER INDEX  MyClusteredIndex ON Classes REBUILD WITH(FILLFACTOR=60)
GO


-----5-----

CREATE INDEX ClassLabIndex On Classes(Class,Lab)
GO


-----6-----

SELECT * FROM Classes
GO