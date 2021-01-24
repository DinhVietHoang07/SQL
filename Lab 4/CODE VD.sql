USE AdventureWorks2019

SELECT * FROM Person.ContactType
WHERE ContactTypeID >= 3 AND ContactTypeID <= 9

--
SELECT * FROM Person.ContactType
WHERE ContactTypeID BETWEEN 3 AND 9

--
SELECT * FROM Person.ContactType
WHERE ContactTypeID IN (1,3,5,9)