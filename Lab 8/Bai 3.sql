

CREATE TABLE Class
(
	ClassCode varchar(10) PRIMARY KEY,
	HeadTeacher varchar(30),
	Room varchar(30),
	TimeSlot char,
	CloseDate Datetime
)
GO


INSERT INTO Class(ClassCode,HeadTeacher,Room,TimeSlot,CloseDate) VALUES ('T2010A','DANG KIM THI','CLASS 206','M',2021/01/28)
INSERT INTO Class(ClassCode,HeadTeacher,Room,TimeSlot,CloseDate) VALUES ('T2010B','NGUYEN VAN TUAN','CLASS 207','G',2021/01/30)
INSERT INTO Class(ClassCode,HeadTeacher,Room,TimeSlot,CloseDate) VALUES ('T2010C','PHUNG THANH THAO','CLASS 208','J',2021/01/27)
INSERT INTO Class(ClassCode,HeadTeacher,Room,TimeSlot,CloseDate) VALUES ('T2010D','LE NGOC NGA','CLASS 209','K',2021/01/26)
INSERT INTO Class(ClassCode,HeadTeacher,Room,TimeSlot,CloseDate) VALUES ('T2010E','DI KHONG CU','CLASS 210','L',2021/01/25)
GO


SELECT * FROM Class
GO

CREATE TABLE Student
(
	RolNo varchar(10) PRIMARY KEY,
	ClassCode varchar(10),
	FulName varchar(30),
	Male bit,
	BirthDate Datetime,
	Address varchar(30),
	Province char(2),
	Email varchar(30)
)
GO

INSERT INTO Student(RolNo,ClassCode,FulName,Male,BirthDate,Address,Province,Email) VALUES ('A1001','T2010A','DINH VIET HOANG',1,2002/01/10,'MY DINH ','HN','Em123@gmail.com')
INSERT INTO Student(RolNo,ClassCode,FulName,Male,BirthDate,Address,Province,Email) VALUES ('A1002','T2010B','CHU DUC LONG',1,2000/09/10,'TON THAT THUYET ','HN','EmQ123@gmail.com')
INSERT INTO Student(RolNo,ClassCode,FulName,Male,BirthDate,Address,Province,Email) VALUES ('A1003','T2010C','NGO CHI THANH DAT',1,2002/04/10,'NHON ','HN','EWm123@gmail.com')
INSERT INTO Student(RolNo,ClassCode,FulName,Male,BirthDate,Address,Province,Email) VALUES ('A1004','T2010D','LE VAN LAP',1,2002/06/10,'LANG','HN','EmE123@gmail.com')
INSERT INTO Student(RolNo,ClassCode,FulName,Male,BirthDate,Address,Province,Email) VALUES ('A1005','T2010E','NGUYEN DUC MINH',1,2002/08/10,'HA DONG ','HN','EmR123@gmail.com')

GO

SELECT * FROM Student
GO



CREATE TABLE SubjectID
(
	SubjectCode varchar(10),
	SubjectName Varchar(40),
	WMark bit,
	PMark bit,
	WTest_per int,
	PTest_per int
)
GO

INSERT INTO SubjectID(SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per) VALUES ('PIPI','Math',1,1,20,20)
INSERT INTO SubjectID(SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per) VALUES ('BYE','English',1,1,20,20)
INSERT INTO SubjectID(SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per) VALUES ('ON','C',1,1,20,20)
INSERT INTO SubjectID(SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per) VALUES ('OFF','C++',1,1,20,20)
INSERT INTO SubjectID(SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per) VALUES ('BRAVO','Java',1,1,20,20)
GO


SELECT * FROM SubjectID
GO

CREATE TABLE Mark
(
	RollNo varchar(10),
	SubjectCode varchar(10),
	WMark float,
	PMark float,
	MarkID float
)
GO

INSERT INTO Mark(RollNo,SubjectCode,WMark,PMark,MarkID) VALUES ('A1001','PIPI',15,14,16)
INSERT INTO Mark(RollNo,SubjectCode,WMark,PMark,MarkID) VALUES ('A1002','bYE',15,14,16)
INSERT INTO Mark(RollNo,SubjectCode,WMark,PMark,MarkID) VALUES ('A1003','ON',15,14,16)
INSERT INTO Mark(RollNo,SubjectCode,WMark,PMark,MarkID) VALUES ('A1004','OFF',15,14,16)
INSERT INTO Mark(RollNo,SubjectCode,WMark,PMark,MarkID) VALUES ('A1005','BRAVO',15,14,16)
GO

SELECT * FROM Mark
GO

-----2-------
 CREATE VIEW list AS
 SELECT p.FullName, e.SubjectName
 FROM Student e
 JOIN SubjectID AS p ON e.SubjectName=p.SubjectName
 GO

-----3-----

 CREATE VIEW list3 AS
 SELECT p.PTest_per, e.PMark
 FROM SubjectID e
 JOIN Mark AS p ON e.PMark=p.PMark
 GO

 -----4-----
  CREATE VIEW list2 AS
 SELECT p.RollNo G, e.TimeSlot
 FROM Student e
 JOIN Mark AS p ON e.TimeSlot=p.TimeSlot
 GO


 ----5----
   CREATE VIEW list5 AS
 SELECT p.List5 , e.NameID
 FROM Student e
 JOIN Mark AS p ON e.NameID=p.NameID
 GO


 -----6-----
   CREATE VIEW EFC AS
 SELECT FullName, HeadTeacher, Room, MarkID
 FROM Student e
 JOIN Mark AS p ON e.TimeSlot=p.TimeSlot
 GO
