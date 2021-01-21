create table booklibary(
BookCode int primary key,
BookTitle varchar(100),
Author varchar(50),
Edition int,
BookPrice money,
Copies int,
)
go
select * from booklibary
go
--tao insert
insert into booklibary(BookCode,BookTitle,Author,Edition,BookPrice,Copies) values(101,'Hello My Friend','Meis',2020,$1200,5)
insert into booklibary(BookCode,BookTitle,Author,Edition,BookPrice,Copies) values(302,'My dream  me with you','Niso',1953,$100,10)
insert into booklibary(BookCode,BookTitle,Author,Edition,BookPrice,Copies) values(150,'I Love You','Shir',1996,$5000,15)
insert into booklibary(BookCode,BookTitle,Author,Edition,BookPrice,Copies) values(942,'I hate you','Nger',2021,$685200,4)
insert into booklibary(BookCode,BookTitle,Author,Edition,BookPrice,Copies) values(845,'Book Limited','Me',2021,null,1)
go
--tao bang member 
create table member(
MemBerCode int primary key,
Name nvarchar(50),
Address varchar(100),
PhoneNumber int,
)
go
select * from member
go
--tao insert
insert into member(MemBerCode,Name,Address,PhoneNumber) values (202,'Jhon Wick','New York',0394480757)
insert into member(MemBerCode,Name,Address,PhoneNumber) values (451,'Captian','Endland',548116962)
insert into member(MemBerCode,Name,Address,PhoneNumber) values (102,'Batman','New York',364413584)
insert into member(MemBerCode,Name,Address,PhoneNumber) values (364,'Superman','New York',79621651)
insert into member(MemBerCode,Name,Address,PhoneNumber) values (597,'Thor','Taiwan',11219999)
go
--tao bang thong tin muon sach
create table issuedetails(
IssueDate datetime,
ReturnDate datetime,
BookCode int,
MemBerCode int,
constraint ml foreign key (BookCode) references booklibary(BookCode),
constraint mk foreign key (MemBerCode) references member(MemBerCode)
)
go
select * from issuedetails
go

--tao insert 
insert into issuedetails(IssueDate,ReturnDate,BookCode,MemBerCode) values (2012/12/12,2012/12/12,101,202)
insert into issuedetails(IssueDate,ReturnDate,BookCode,MemBerCode) values (2012/12/12,2012/12/12,302,451)
insert into issuedetails(IssueDate,ReturnDate,BookCode,MemBerCode) values (2012/12/12,2012/12/12,150,102)
insert into issuedetails(IssueDate,ReturnDate,BookCode,MemBerCode) values (2012/12/12,2012/12/12,942,364)
insert into issuedetails(IssueDate,ReturnDate,BookCode,MemBerCode) values (2012/12/12,2012/12/12,845,597)
go
--xoa bang dl
drop table issuedetails
go
drop table booklibary
go
drop table member
go
Bai 2
--a,
--xoa bo khoa ngoai 
Alter Table IssueDetails drop constraint ml
Alter Table IssueDetails drop constraint mk
--b,
--xoa bo khoa chinh bang Member
Alter table member drop constraint MemBerCode

--xoa bo khoa chinh bang book
Alter TABLE booklibary drop constraint book
--c,
--them rang buoc khoa chinh member
ALTER TABLE MEMBER
ADD CONSTRAINT PK_MEMBER
PRIMARY KEY (MaNV)
--them rang buoc khoa chinh book
ALTER TABLE BOOK 
ADD CONSTRAINT PK_BOOK
PRIMARY KEY (HNB)
--d,
--them rang buoc khoa ngoai cho IssueDetails
ALTER TABLE IssueDetails(
ADD CONSTRAINT FK_NOTFUN
FOREIGN KEY(ISOTAI)
REFERENCES PLEALS()
)
--e,
--them rang buoc 
ALTER TABLE SACH
ADD CONSTRAINT C_T
CHECK ('SACH' > 0)
CHECK ('SACH' < 200)
--F.
--bo sung rang buoc duy nhat cho phoneNumber

CREATE TABLE PhoneNumber 
 (  
   PhoneNuberID int NOT NULL,   
   CONSTRAINT AK_PhoneNuberID UNIQUE(PhoneNuberID)   
);   
GO  
--G
--bo sung rang buoc NOT NULL cho bookcode\
CREATE TABLE PhoneNumber 
 (  
   PhoneNuberID int NOT NULL,   
   CONSTRAINT AK_PhoneNuberID UNIQUE(PhoneNuberID)   
);   
--bo sung rang buoc MemberCode trong bảng IssueDetails
CREATE TABLE IssueDetails 
 (  
  IssueDetailsID int Member,   
   CONSTRAINT AK_IssueDetailsID UNIQUE(IssueDetailsID)   
);  
--h
-- tao khoa chinh
CREATE TABLE IssueDetails(
BookCodeID int,
MemberCodeID int,
location varchar(2),
Constraint PK_IssueDetails PRIMARY KEY(BookCodeID, MemberCodeID))
--i
--chen du lieu hop ly
INSERT INTO Cities (Location)  
VALUES ( CONVERT(Point, '12.3:46.2'));