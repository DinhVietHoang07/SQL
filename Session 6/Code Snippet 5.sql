CREATE DATABASE [SalesDB] ON PRIMARY

( NAME = 'SalesDB', FILE ='C:\ProgramFiles\Microsoft SQL Server\MSSQL11.
MSSQLSERVER\MSSQL\DATA\SalesDB.mdf', SIZE =3072KB, MAXSIZE = UNLIMITED,
FILEGROWTH = 1024KB),

FILEGROUP [MyFileGroup]

(NAME = 'SalesDB_FG', FILENAME = 'C:\ProgramFiles\Microsoft SQL Server\MSSQL11.
MSSQLSERVER\MSSQ;\DATA\SalesDB_FG.ndf', SIZE =3072KB, MAXSIZE = UNLIMITED,
FILEGROWTH = 1024KB)
