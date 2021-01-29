-------------PHAN 3---------------


CREATE TABLE Student_t
(
	StudentNo int,
	StudentName varchar(50),
	StudentAddress varchar(100),
	PhoneNo int
)
GO

drop table Student_t
GO

INSERT INTO Student_t(StudentNo,StudentName,StudentAddress,PhoneNo) VALUES (111,'LE VAN BOC PHET','HA DONG - HA NOI',0387654321)
INSERT INTO Student_t(StudentNo,StudentName,StudentAddress,PhoneNo) VALUES (113,'LE THI BO LAO','HAI PHONG - VIET NAM',097654321)
INSERT INTO Student_t(StudentNo,StudentName,StudentAddress,PhoneNo) VALUES (115,'LE TRAN VIA XE','HA GIANG - VIET NAM',098765321)
INSERT INTO Student_t(StudentNo,StudentName,StudentAddress,PhoneNo) VALUES (117,'LE VAN DO','BA LAN - WORD',09854321)
GO

SELECT * FROM Student_t
GO

CREATE TABLE Department 
(
	DeptNo int,
	DeptName varchar(50),
	ManagerName char(30)
)
GO

drop table Department
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
	Desciption nvarchar(100)
)
GO
drop table Assignment
GO


INSERT INTO Assignment(AssignmentNo,Desciption) VALUES (999,'KHO')
INSERT INTO Assignment(AssignmentNo,Desciption) VALUES (979,'DE')
INSERT INTO Assignment(AssignmentNo,Desciption) VALUES (989,'TRUNG BINH')
GO

SELECT * FROM Assignment
GO


CREATE TABLE Works_Assign
(
	JobID int PRIMARY KEY,
	StudentNo int,
	AssignmentNo int,
	TotalHours int,
	JobDetails nvarchar(450)
)
GO

DROP TABLE Works_Assign
GO

INSERT INTO Works_Assign(JobID,StudentNo,AssignmentNo,TotalHours,JobDetails) VALUES (7749,12345,223,48,'HOAN THANH BAI TAP')
INSERT INTO Works_Assign(JobID,StudentNo,AssignmentNo,TotalHours,JobDetails) VALUES (2234,33445,213,48,'HOAN THANH BAI TAP')
INSERT INTO Works_Assign(JobID,StudentNo,AssignmentNo,TotalHours,JobDetails) VALUES (1123,22222,253,48,'HOAN THANH BAI TAP')

GO

SELECT * FROM Works_Assign
GO


------2-----

CREATE CLUSTERED INDEX IX_Student ON Student_t(StudentNo)
GO


-----3-----
ALTER INDEX IX_Student ON Student_t REBUILD
GO

-----4-----
CREATE NONCLUSTERED INDEX IX_Dept
ON Department(DeptName,ManagerName)
GO

