SELECT SalesPersonID, YEAR(OrderDate) AS OrderYear

FROM Sales.SalesOrderHeader

WHERE CustomerID = 30084

GROUP BY SalesPersonID, YEAR(OrderData)

HAVING COUNT(*) >1

ORDER BY SalesPersonID, OrderYear;