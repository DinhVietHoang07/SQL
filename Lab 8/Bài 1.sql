

CREATE DATABASE Lab11
GO
USE Lab11

CREATE VIEW ProductList
AS
SELECT ProductID, Name FROM AdventureWorks2019.Production.Product

SELECT * FROM ProductList

CREATE VIEW SalesOrderDetail
AS
SELECT pr.ProductID, pr.Name, od.UnitPrice, od.OrderQty,
od.UnitPrice*od.OrderQty as [Total Price]
FROM AdventureWorks2019.Sales.SalesOrderDetail od
JOIN AdventureWorks2019.Production.Product pr

 ON od.ProductID=pr.ProductID

 SELECT * FROM SalesOrderDetail
 GO

 -----Tạo khung nhìn lấy ra thông tin cơ bản trong bảng Person.Person
 CREATE VIEW V_CONTACT_INFO AS
 SELECT FIRSTNAME, MIDDLENAME, LASTNAME
 FROM AdventureWorks2019.Person.Person
 GO

 -----Tạo khung nhìn lấy ra thông tin về nhân viên
 CREATE VIEW V_CONTACT_INFO AS
 SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate
 FROM AdventureWorks2019.HumanResources.Employee e
 JOIN AdventureWorks2019.Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID ;
 GO

 -----Xem một khung hình
 SELECT * FROM V_Employee_Contact
 GO

 -----Thay đổi khung hình V_Employee_Contact bằng viết thêm cột Birthdate
 ALTER VIEW V_Employee_Contact AS
 SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate, e.Birthdate
 FROM AdventureWorks2019.HumanResources.Employee e
 JOIN AdventureWorks2019.Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
 WHERE p.FirstName like '%B%' ; 
 GO


 -----Xóa một khung hình
 DROP VIEW V_CONTACT_INFO
 GO

 -----Xem định nghĩa khung hình V_Employee_Contact
 EXECUTE sp_helptext 'V_Employee_Contact'
 GO

 -----Xem các thành phần mà khung hình phụ thuộc
 EXECUTE sp_depends 'V_Employee_Contact'
 GO

 -----Tạo khung hình ẩn mà định nghĩa ẩn đi ( không xem được định nghiã khung hình)
 CREATE VIEW OrderRejects
 WITH ENCRYPTION
 AS
 SELECT PurchaseOrderId, ReceivedQty, RejectedQty,
	RejectedQty / ReceivedQty AS RejectRatio, DueDate
FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail
WHERE RejectedQty / ReceivedQty > 0
AND DueDate > CONVERT(DATETIME,'20010603',101);

 -----Không xem được định nghĩa khung hình V_Contact_Info
 sp_helptext 'OrderRejects'
 GO

 -----Thay đổi khung nhìn thêm tùy chọn CHECK OPTION
 ALTER VIEW V_Employee_Contact AS
 SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate
 FROM AdventureWorks2019.HumanResources.Employee e
 JOIN AdventureWorks2019.Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
 WHERE p.FirstName like 'A%'
 WITH CHECK OPTION
 GO 
 SELECT * FROM V_Employee_Contact


 -----Cập nhật được khung hình khi FirstName bắt đầu ký tự 'A'
 UPDATE V_Employee_Contact SET FirstName='Atest' WHERE LastName='Amy'

 -----Không cập nhật khung hình khi FirstName bắt đầu bằng kí tự 'A'
 UPDATE V_Employee_Contact SET FirstName='BCD' WHERE LastName'Atest'
 GO

 -----Phải xóa khung hình phía trước
 DROP VIEW V_Employee_Contact
 GO

 -----Tạo khung hình có giản đồ
 CREATE VIEW V_Contact_Info WITH SCHEMABINDING AS
 SELECT FirstName, MiddlName,LastName, emailAddress
 FROM AdventureWorks2019.Person.ContactType
 GO


 -----Không thể truy vấn được khung nhìn có tên là V_Contact_Info
 SELECT * FROM V_Contact_Info
 GO

 -----Tạo chỉ nhất trên cột EmaillAddress trreen khung nhìn V_Contact_Info
 CREATE UNIQUE CLUSTERED INDEX IX_Contact_Email
 ON V_Contact_Info(EmailAddress)
 GO

 -----Thực hiện đổi tên khung nhìn
 EXEC sp_rename V_Contact_Info, V_Contact_Information

 -----Truy vấn khung nhìn
 SELECT * FROM V_Contact_Information
 -----Không thể thêm bản ghi vào khung nhìn
 -----Vì có một cột cho phép NULL trong bảng Contact
 INSERT INTO V_Contact_Information VALUES ('ABC', 'DEF','GHI','abc@yahoo.com')
 -----Không thể xóa bản ghi của khung hình V_Contact_Information
 -----Vì bảng Person.Contact còn có các khóa ngoại
 DELETE FROM V_Contact_Information WHERE LastName='Gilbert' AND FirstName='Guy'