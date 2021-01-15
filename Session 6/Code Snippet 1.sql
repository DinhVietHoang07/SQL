CREATE DATABASE [Customer_DB] ON PRIMARY
( NAME = 'Customer_DB', FILENAME = 'C:\ProgramFiles\Microsoft SQL Server\
MSSQL11.MSSQLSERVER\MSSQL\DATA\Customer_DB.mdf')

LOG ON

(NAME = 'Customer_DB_log',FILENAME = 'C:\ProgramFiles\Microsoft SQL Server\
MSSQL11.MISSQLSERVER\MSSQL\DATA\Customer_DB_log.ldf')
COLLATE SQL_Latin1_Genral_CP1_CI_AS