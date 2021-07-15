--USE AdventureWorks2019
--go

--Part 2

-- Question 2 Products in Production.Product table
--SELECT ProductID, ProductNumber, Name, ProductSubcategoryID FROM Production.Product WHERE ProductSubcategoryID IS NOT NULL ORDER BY ProductSubcategoryID ASC


--Question 3 

--SELECT ProductSubcategoryID , COUNT(ProductSubcategoryID) AS 'CountedProducts' FROM  Production.Product WHERE ProductSubcategoryID IS NOT NULL GROUP BY ProductSubcategoryID ORDER BY ProductSubcategoryID ASC


--Question 4

--SELECT COUNT(Name) AS 'Counted Null product subcategory' FROM  Production.Product WHERE ProductSubcategoryID IS  NULL 


--Question 5 
--SELECT ProductID, COUNT(Quantity) AS 'Quantity Per Product ID' from Production.ProductInventory GROUP BY ProductID ORDER BY ProductID ASC

--Question 6

--SELECT Production.Product.ProductID, SUM(Quantity) AS 'TheSum'  from Production.ProductInventory  LEFT JOIN Production.Product ON Production.Product.ProductID = Production.ProductInventory.ProductID   WHERE  Quantity < 100 AND LocationID = 40 GROUP BY Production.Product.ProductID


--Question 7

--SELECT Shelf, Production.Product.ProductID, SUM(Quantity) AS 'TheSum'  from Production.ProductInventory  LEFT JOIN Production.Product ON Production.Product.ProductID = Production.ProductInventory.ProductID   WHERE  Quantity < 100 AND LocationID = 40 GROUP BY Production.Product.ProductID, Shelf


--Question 8

--SELECT LocationID ,AVG(Quantity) AS 'Average Product quantity'  from Production.ProductInventory  WHERE   LocationID = 10 GROUP BY LocationID


--Question 9
--SELECT Shelf,Production.Product.ProductID, SUM(Quantity) AS 'TheSum'  from Production.ProductInventory  LEFT JOIN Production.Product ON Production.Product.ProductID = Production.ProductInventory.ProductID   WHERE  LocationID = 10 GROUP BY Shelf, Production.Product.ProductID ORDER BY Shelf ASC


--Question 10
--SELECT Shelf,Production.Product.ProductID, SUM(Quantity) AS 'TheSum'  from Production.ProductInventory  LEFT JOIN Production.Product ON Production.Product.ProductID = Production.ProductInventory.ProductID   WHERE  LocationID = 10 AND Shelf NOT LIKE ('N/A')GROUP BY Shelf, Production.Product.ProductID ORDER BY Shelf ASC


--Question 11

--SELECT DISTINCT Color, Class, COUNT(Name) AS 'The Count',AVG(ListPrice) AS 'AvgPrice' FROM  Production.Product GROUP BY Color ,Class HAVING Color IS  NOT NULL AND Class IS NOT NULL

--Question 12

--SELECT DISTINCT Person.CountryRegion.Name AS 'Country', Person.StateProvince.Name AS 'Province' from Person.CountryRegion   JOIN Person.StateProvince ON Person.CountryRegion.CountryRegionCode = Person.StateProvince.CountryRegionCode WHERE Person.StateProvince.Name IS NOT NULL GROUP BY Person.CountryRegion.Name, Person.StateProvince.Name


--Question 13
--SELECT DISTINCT Person.CountryRegion.Name AS 'Country', Person.StateProvince.Name AS 'Province' from Person.CountryRegion   JOIN Person.StateProvince ON Person.CountryRegion.CountryRegionCode = Person.StateProvince.CountryRegionCode WHERE Person.CountryRegion.name IN ('Germany', 'Canada') AND Person.StateProvince.Name IS NOT NULL GROUP BY Person.CountryRegion.Name, Person.StateProvince.Name ORDER BY Person.CountryRegion.Name asc





USE Northwind
go


--Question 14
--SELECT dbo.[Order Details].productID , dbo.orders.OrderDate,Quantity from dbo.[Order Details] FULL JOIN dbo.orders ON dbo.orders.OrderID = dbo.[Order Details].OrderID where DATEDIFF(year, dbo.Orders.OrderDate, GETDATE()) < 1   order by dbo.orders.OrderDate DESC


--Question 15
SELECT TOP 5 ShipPostalCode,  SUM([Order Details].Quantity) from Orders FULL JOIN [Order Details] ON orders.OrderID = [Order Details].OrderID WHERE Orders.ShipPostalCode IS NOT NULL GROUP BY ShipPostalCode 



SELECT TOP 5 o.ShipPostalCode, SUM(od.Quantity) as qty FROM 
	Orders o
	FULL JOIN
	[Order Details] od
	ON o.OrderID =  od.OrderID
	WHERE o.ShipPostalCode IS NOT NULL 
		AND DATEDIFF(year, o.OrderDate, GETDATE())< 21
	GROUP BY ShipPostalCode
	ORDER BY qty DESC;


select count(customerID),City
from customers
group by City


select count(customerID),City
from customers
group by City
having  count(customerID)>10




SELECT DISTINCT c.CustomerID, c.CompanyName, c.ContactName FROM 
	Orders o
	INNER JOIN 
	Customers c
	ON o.CustomerID = c.CustomerID
	WHERE OrderDate > '1998-1-1';


SELECT c.CustomerID, c.CompanyName, c.ContactName FROM
	Orders o
	INNER JOIN
	Customers c
	ON o.CustomerID = c.CustomerID
	WHERE o.OrderDate IN 
	(SELECT TOP 1 OrderDate FROM Orders
	WHERE OrderDate IS NOT NULL
	GROUP BY OrderDate
	ORDER BY OrderDate DESC);

SELECT c.CustomerID, c.CompanyName, c.ContactName, 
SUM(od.Quantity) AS QTY FROM 
Customers c 
LEFT JOIN 
Orders o 
ON c.CustomerID = o.CustomerID
LEFT JOIN 
[Order Details] od
ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName, c.ContactName
ORDER BY QTY;


SELECT c.CustomerID,
SUM(od.Quantity) AS QTY FROM 
Customers c 
LEFT JOIN 
Orders o 
ON c.CustomerID = o.CustomerID
LEFT JOIN 
[Order Details] od
ON o.OrderID = od.OrderID
GROUP BY c.CustomerID
HAVING SUM(od.Quantity) > 100
ORDER BY QTY;


SELECT DISTINCT sup.CompanyName, ship.CompanyName FROM 
Orders o
LEFT JOIN
[Order Details] od
ON o.OrderID = od.OrderID
INNER JOIN 
Products p
ON od.ProductID = p.ProductID
RIGHT JOIN
Suppliers sup
ON p.SupplierID = sup.SupplierID
INNER JOIN
Shippers ship
ON o.ShipVia = ship.ShipperID;

SELECT o.OrderDate, p.ProductName FROM 
Orders o
LEFT JOIN
[Order Details] od
ON o.OrderID = od.OrderID
INNER JOIN
Products p
ON od.ProductID = p.ProductID
GROUP BY o.OrderDate, p.ProductName
ORDER BY o.OrderDate;


SELECT Title, LastName + ' ' + FirstName AS Name 
FROM Employees
ORDER BY Title;


SELECT e1.Title, e1.LastName + ' ' + e1.FirstName AS Name1, e2.LastName + ' ' + e2.FirstName AS Name2 
FROM Employees e1
JOIN 
Employees e2
ON e1.Title = e2.Title 
WHERE e1.FirstName <> e2.FirstName OR e1.LastName <>        e2.LastName
ORDER BY Title;

SELECT * FROM (SELECT * FROM Employees) AS T1
INNER JOIN
(SELECT ReportsTo, COUNT(ReportsTo) AS Subordinate  FROM Employees
WHERE ReportsTo IS NOT NULL
GROUP BY ReportsTo
HAVING COUNT(ReportsTo) > 2) T2
ON T2.ReportsTo= T1.EmployeeID;
Question: How to keep most columns but drop only a few of them?


SELECT c.City, c.CompanyName, c.ContactName, 'Customer' as Type
FROM Customers c
UNION
SELECT s.City, s.CompanyName, s.ContactName, 'Supplier' as Type
FROM Suppliers s;


SELECT * FROM F1 INNER JOIN F2;
ON F1.T1 = F2.T2


SELECT * FROM F1 LEFT JOIN F2;
ON F1.T1 = F2.T

SELECT * FROM F1 FULL JOIN F2;
ON F1.T1 = F2.T2

