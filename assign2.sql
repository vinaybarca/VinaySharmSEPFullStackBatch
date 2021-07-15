USE AdventureWorks2019
go

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
