-------------PHAN 3---------------

USE CodeLean
GO

CREATE TABLE Student
(
	StudentNo int PRIMARY KEY,
	StudentName varchar(50),
	StudentAddress varchar(100),
	PhoneNo int
)
GO

INSERT INTO Student(StudentNo,StudentName,StudentAddress,PhoneNo) VALUES (111,'LE VAN BOC PHET','HA DONG - HA NOI',0387654321)
INSERT INTO Student(StudentNo,StudentName,StudentAddress,PhoneNo) VALUES (113,'LE THI BO LAO','HAI PHONG - VIET NAM',097654321)
INSERT INTO Student(StudentNo,StudentName,StudentAddress,PhoneNo) VALUES (115,'LE TRAN VIA XE','HA GIANG - VIET NAM',098765321)
INSERT INTO Student(StudentNo,StudentName,StudentAddress,PhoneNo) VALUES (117,'LE VAN DO','BA LAN - WORD',09854321)
GO

SELECT * FROM Student
GO

CREATE TABLE Department 
(
	DeptNo int PRIMARY KEY,
	DeptName varchar(50),
	ManagerName char(30)
)
GO

INSERT INTO Department(DeptNo,DeptName,ManagerName) VALUES (0000,'O KIA NUMBERONE','DANG KIM THI')
INSERT INTO Department(DeptNo,DeptName,ManagerName) VALUES (10,'O KIA NO HOPE','DANG KIM THI')
INSERT INTO Department(DeptNo,DeptName,ManagerName) VALUES (20000,'O KIA FAKE','DANG KIM THI')
GO

SELECT * FROM Department 
GO


CREATE TABLE Assignment
(
	AssignmentNo int PRIMARY KEY,
	Desciption varchar(100)
)
GO

INSERT INTO Assignment(AssignmentNo,Desciption) VALUES (999,'E