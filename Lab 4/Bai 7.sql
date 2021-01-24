--A--
SELECT * FROM Product
go

ALTER TABLE Price
ADD CONSTRAINT Minimum 
check ('price' > 0)
GO

--B--

ALTER TABLE Date_order
ADD CONSTRAINT up_date
check ('up_date') < ('Date_order')
GO

--C--
UPDATE order_one SET Date_order = 2021/01/23
SELECT * FROM Order_one
GO
