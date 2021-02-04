USE AdventureWorks2019
GO

--Tạo một thủ tục lưu trữ lấy ra toàn bộ nhân viên vào làm theo năm có tham số đầu vào là một năm
CREATE PROCEDURE sp_DisplayEmployeesHireYear
	@HireYear int
AS
SELECT * FROM HumanResources.Employee
WHERE DATEPART(YY, HireDate)=@HireYear
GO
--Để chạy thủ tục này cần phải truyền tham số vào là năm mà nhân viên vào làm
EXEC sp_DisplayEmployeesHireYear 2003
GO

--Tạo thủ tục lưu trữ đếm số người vào làm trong một năm xác định có tham số đầu vào là một năm,
-- tham số đầu ra là số người vào làm trong năm này
CREATE PROCEDURE sp_EmployeesHireYearCount
@HireYear int,
@Count int OUTPUT
AS
SELECT @Count=COUNT(*) FROM HumanResources.Employee
WHERE DATEPART(YY,Hiredate)=@HireYear
GO

--Chạy thủ tục lưu trữ cần phải truyền vào 1 tham số đầu vào và một tham số đầu ra.
DECLARE @Number int
EXECUTE sp_EmployeesHireYearCount 2003, @Number OUTPUT
PRINT @Number
GO

--Tạo thủ tục lưu trữ đếm số người vào làm trong một năm xác định có tham số đầu vào là một năm, hàm trả về số người vào làm năm đó
CREATE PROCEDURE sp_EmployeesHireYearCount2
	@HireYear int
AS
DECLARE @Count int
SELECT @Count=COUNT(*) FROM HumanResources.Employee
WHERE DATEPART(YY, HireDate)=@HireYear
RETURN @Count
GO

--Chạy thủ tục lưu trữ cần phải truyền vào 1 tham số đầu và lấy về số người làm trong năm đó.
DECLARE @Number int
EXECUTE @Number = sp_EmployeesHireYearCount2 2003
PRINT @Number
GO

--Tạo bảng tạm #Students
CREATE TABLE #Students
(
RollNo varchar(6) CONSTRAINT PK_Students PRIMARY KEY,
FullName nvarchar(100),
Birthday datetime constraint DF_StudentsBirthday DEFAULT
DATEADD(yy, -18, GETDATE())
)
GO
--Tạo thủ tục lưu trữ tạm để chèn dữ liệu vào bảng tạm
CREATE PROCEDURE #spInsertStudents
@rollNo varchar(6),
@fullName nvarchar(100),
@birthday datetime
AS BEGIN
IF(@birthday IS NULL)
SET @birthday=DATEADD(YY, -18, GETDATE())
INSERT INTO #Students(RollNo, FullName, Birthday)
VALUES(@rollNo, @fullName, @birthday)

END
GO
--Sử dụng thủ tục lưu trữ để chèn dữ liệu vào bảng tạm
EXEC #spStudents 'A12345', 'abc', NULL
EXEC #spStudents 'A54321', 'abc', '12/24/2011'
SELECT * FROM #Students
--Tạo thủ tục lưu trữ tạm để xóa dữ liệu từ bảng tạm theo RollNo
CREATE PROCEDURE #spDeleteStudents
@rollNo varchar(6)
AS BEGIN
DELETE FROM #Students WHERE RollNo=@rollNo
END
--Xóa dữ liệu sử dụng thủ tục lưu trữ
EXECUTE #spDeleteStudents 'A12345'
GO

--Tạo một thủ tục lưu trữ sử dung lệnh RETURN để trả về một số nguyên
CREATE PROCEDURE Cal_Square @num int=0 AS
BEGIN
RETURN (@num * @num);
END
GO
--Chạy thủ tục lưu trữ
DECLARE @square int;
EXEC @square = Cal_Square 10;
PRINT @square;
GO

--Xem định nghĩa thủ tục lưu trữ bằng hàm OBJECT_DEFINITION
SELECT
OBJECT_DEFINITION(OBJECT_ID('HumanResources.uspUpdateEmployeePersonalI
nfo')) AS DEFINITION

--Xem định nghĩa thủ tục lưu trữ bằng
SELECT definition FROM sys.sql_modules
WHERE
object_id=OBJECT_ID('HumanResources.uspUpdateEmployeePersonalInfo')
GO

--Thủ tục lưu trữ hệ thống xem các thành phần mà thủ tục lưu trữ phụ thuộc
sp_depends 'HumanResources.uspUpdateEmployeePersonalInfo'
GO

USE AdventureWorks
GO
--Tạo thủ tục lưu trữ sp_DisplayEmployees
CREATE PROCEDURE sp_DisplayEmployees AS
SELECT * FROM HumanResources.Employee
GO
--Thay đổi thủ tục lưu trữ sp_DisplayEmployees
ALTER PROCEDURE sp_DisplayEmployees AS
SELECT * FROM HumanResources.Employee
WHERE Gender='F'
GO
--Chạy thủ tục lưu trữ sp_DisplayEmployees
EXEC sp_DisplayEmployees
GO

--Xóa một thủ tục lưu trữ
DROP PROCEDURE sp_DisplayEmployees
GO

--
CREATE PROCEDURE sp_EmployeeHire
AS
BEGIN
--Hiển thị
EXECUTE sp_DisplayEmployeesHireYear 1999
DECLARE @Number int
EXECUTE sp_EmployeesHireYearCount 1999, @Number OUTPUT
PRINT N'Số nhân viên vào làm năm 1999 là: ' +
CONVERT(varchar(3),@Number)
END
GO
--Chạy thủ tục lưu trữ
EXEC sp_EmployeeHire
GO

--Thay đổi thủ tục lưu trữ sp_EmployeeHire có khối TRY ... CATCH
ALTER PROCEDURE sp_EmployeeHire
@HireYear int

AS
BEGIN
BEGIN TRY
EXECUTE sp_DisplayEmployeesHireYear @HireYear
DECLARE @Number int
--Lỗi xảy ra ở đây có thủ tục sp_EmployeesHireYearCount chỉ truyền 2 tham số mà ta truyền 3

EXECUTE sp_EmployeesHireYearCount @HireYear, @Number OUTPUT,

'123'

PRINT N'Số nhân viên vào làm năm là: ' +

CONVERT(varchar(3),@Number)
END TRY
BEGIN CATCH
PRINT N'Có lỗi xảy ra trong khi thực hiện thủ tục lưu trữ'
END CATCH
PRINT N'Kết thúc thủ tục lưu trữ'
END
GO
--Chạy thủ tục sp_EmployeeHire
EXEC sp_EmployeeHire 1999
--Xem thông báo lỗi bên Messages không phải bên Result
GO

--Thay đổi thủ tục lưu trữ sp_EmployeeHire sử dụng hàm @@ERROR
ALTER PROCEDURE sp_EmployeeHire
@HireYear int
AS
BEGIN
EXECUTE sp_DisplayEmployeesHireYear @HireYear
DECLARE @Number int
--Lỗi xảy ra ở đây có thủ tục sp_EmployeesHireYearCount chỉ truyền 2 tham số mà ta truyền 3
EXECUTE sp_EmployeesHireYearCount @HireYear, @Number OUTPUT,
'123'
IF @@ERROR <> 0
PRINT N'Có lỗi xảy ra trong khi thực hiện thủ tục lưu trữ'
PRINT N'Số nhân viên vào làm năm là: ' +
CONVERT(varchar(3),@Number)
END
GO
--Chạy thủ tục sp_EmployeeHire
EXEC sp_EmployeeHire 1999
--Xem thông báo lỗi bên Messages không phải bên Result




----------------------------------PHAN 1-------------------------------

CREATE TABLE Employee
(
	EmployeeID int,
	Name varchar(100),
	Tel char(11),
	Email varchar(30)
)
GO

INSERT INTO Employee(EmployeeID,Name,Tel,Email) VALUES (111,'ANTONI',123456,'AGV@Email.com')
INSERT INTO Employee(EmployeeID,Name,Tel,Email) VALUES (222,'CACEMILO',098765,'CML@Email.com')
INSERT INTO Employee(EmployeeID,Name,Tel,Email) VALUES (333,'LINDGAR',567843,'LDG@Email.com')
INSERT INTO Employee(EmployeeID,Name,Tel,Email) VALUES (444,'BRUNO',123890,'BRN@Email.com')
INSERT INTO Employee(EmployeeID,Name,Tel,Email) VALUES (555,'CAVANI',283940,'CVN@Email.com')
GO

SELECT * FROM Employee
GO

CREATE TABLE Groups
(
	GroupID int,
	GroupName varchar(30),
	LeaderID int,
	ProjectID int,
	CONSTRAINT ID PRIMARY KEY (GroupID, LeaderID),
	CONSTRAINT PID FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
)
GO
DROP TABLE Groups
GO

INSERT INTO Groups(GroupID,GroupName,LeaderID,ProJectID) VALUES (123,'A',011,1)
INSERT INTO Groups(GroupID,GroupName,LeaderID,ProJectID) VALUES (134,'B',012,2)
INSERT INTO Groups(GroupID,GroupName,LeaderID,ProJectID) VALUES (145,'C',013,3)
INSERT INTO Groups(GroupID,GroupName,LeaderID,ProJectID) VALUES (156,'D',014,4)
INSERT INTO Groups(GroupID,GroupName,LeaderID,ProJectID) VALUES (167,'E',014,5)
GO

SELECT * FROM Groups
GO


CREATE TABLE Project
(
	ProjectID int PRIMARY KEY,
	ProjectName varchar(30),
	StartDate datetime,
	EndDate datetime,
	Period int,
	Cost money
)
GO

INSERT INTO Project(ProjectID,ProjectName,StartDate,EndDate,Period,Cost) VALUES (231,'A',2021/02/02,2021/05/02,3,$25000)
INSERT INTO Project(ProjectID,ProjectName,StartDate,EndDate,Period,Cost) VALUES (221,'B',2021/02/02,2021/05/02,3,$50000)
INSERT INTO Project(ProjectID,ProjectName,StartDate,EndDate,Period,Cost) VALUES (241,'C',2021/02/02,2021/05/02,3,$35000)
INSERT INTO Project(ProjectID,ProjectName,StartDate,EndDate,Period,Cost) VALUES (251,'D',2021/02/02,2021/05/02,3,$45000)
INSERT INTO Project(ProjectID,ProjectName,StartDate,EndDate,Period,Cost) VALUES (261,'E',2021/02/02,2021/05/02,3,$15000)
GO

SELECT * FROM Project
GO

CREATE TABLE GroupDetail
(
	GroupID int,
	EmployeeID int,
	Status char(20)

)
GO
DROP TABLE GroupDetail
GO

INSERT INTO GroupDetail(GroupID,EmployeeID,Status) VAlUES (111,343,'ON')
INSERT INTO GroupDetail(GroupID,EmployeeID,Status) VAlUES (222,347,'ON')
INSERT INTO GroupDetail(GroupID,EmployeeID,Status) VAlUES (333,346,'ON')
INSERT INTO GroupDetail(GroupID,EmployeeID,Status) VAlUES (444,348,'ON')
INSERT INTO GroupDetail(GroupID,EmployeeID,Status) VAlUES (555,349,'ON')
GO

SELECT * FROM GroupDetail
GO

----------3---------
--a--
SELECT * FROM Employee
GO
--b--
SELECT EmployeeID,
      
       COUNT(2) So_luong
FROM   Employee
GROUP BY
       EmployeeID

--c--
SELECT GroupID FROM GroupDetail
GO
--d--
SELECT EmployeeID FROM GroupDetail
GO
--e--
 SELECT * FROM Project
 WHERE StartDate ='2021/02/02'
 GO
 --f--
 SELECT * FROM GroupDetail
 WHERE GroupID=555
 GO
 --g--
 SELECT * FROM  GroupDetail
 WHERE Status='ON'
 GO


 -------------4-------------
 --a--
 SELECT * FROM Project
 WHERE EndDate<StartDate
 Go
 --b--
 SELECT Name FROM Employee
 
 GO

 --c--
 SELECT Status, Name FROM  GroupDetail, Employee
 GO

 --d--
 SELECT * FROM Project
 WHERE Cost > 1000
 GO
 --e--
 SELECT * FROM Groups, Employee
 WHERE LeaderID=EmployeeID
 GO
 --f--
  SELECT * FROM Employee
 WHERE Tel=0
 GO


 ---------------------5----------------
 --a--
 CREATE PROCEDURE Price AS
SELECT ProjectID,ProjectName,Cost+10 AS SauKhiTangGia FROM Project

EXEC Price
GO
--b--
SELECT * FROM Project
WHERE ProjectName=2
GO
--c--
SELECT ProjectName,