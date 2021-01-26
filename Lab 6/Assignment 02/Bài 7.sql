--A--
UPDATE Product SET Price = 0
WHERE Price > 0
SELECT * FROM Product
GO

--B--
UPDATE Category SET name = 0
WHERE Name = 'I LOVE YOU'
GO
SELECT * FROM Category
GO

--C--
CONSTRAINT fk_ProID
  FOREIGN KEY (Name)
  REFERENCES ProID(description)
