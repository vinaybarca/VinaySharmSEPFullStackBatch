USE AdventureWorks2019
go

--Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, with no filter. 

SELECT Name, ProductNumber, Color FROM Production.Product;


--Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are 0 for the column ListPrice

SELECT ProductID, Name, Color , ListPrice FROM Production.Product WHERE ListPrice = 0;


--Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are rows that are NULL for the Color column.

SELECT ProductID, Name, Color , ListPrice FROM Production.Product WHERE Color IS NULL;


--Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are not NULL for the Color column.

SELECT ProductID, Name, Color , ListPrice FROM Production.Product WHERE Color IS NOT NULL;



--Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are not NULL for the column Color, and the column ListPrice has a value greater than zero.

SELECT ProductID, Name, Color , ListPrice FROM Production.Product WHERE Color IS NOT NULL AND ListPrice > 0;


--Generate a report that concatenates the columns Name and Color from the Production.Product table by excluding the rows that are null for color.

SELECT  Name, Color  FROM Production.Product WHERE Color IS NOT NULL ;


--Write a query that generates the following result set  from Production.Product: Name And Color

SELECT 'NAME: '+ Name+ ' -- COLOR: ' + Color AS 'Name And Color' FROM Production.Product WHERE Color IN ('Black', 'Silver') ;


--Write a query to retrieve the to the columns ProductID and Name from the Production.Product table filtered by ProductID from 400 to 500

SELECT ProductID, Name FROM Production.Product WHERE ProductID BETWEEN 400 AND 500


--Write a query to retrieve the to the columns  ProductID, Name and color from the Production.Product table restricted to the colors black and blue

SELECT ProductID, Name, Color  FROM Production.Product WHERE Color IN ('black', 'blue')


--Write a query to generate a report on products that begins with the letter S. 

SELECT * FROM Production.Product WHERE Name LIKE 'S%'



--Write a query that retrieves the columns Name and ListPrice from the Production.Product table. Your result set should look something like the following. Order the result set by the Name column


SELECT  Name+ '      ' + CAST(ListPrice AS VARCHAR) AS 'Name                       ListPrice' FROM Production.Product  ;


-- Write a query that retrieves the columns Name and ListPrice from the Production.Product table. Your result set should look something like the following. Order the result set by the Name column. The products name should start with either 'A' or 'S'


SELECT  Name+ '      ' + CAST(ListPrice AS VARCHAR) AS 'Name                       ListPrice' FROM Production.Product WHERE Name LIKE 'A%' OR   Name LIKE   'S%' ORDER BY Name ASC;


--Write a query so you retrieve rows that have a Name that begins with the letters SPO, but is then not followed by the letter K. After this zero or more letters can exists. Order the result set by the Name column.

SELECT Name FROM Production.Product WHERE Name Like  'SPO%' AND Name NOT LIKE 'SPOK%' ORDER BY Name ASC



--Write a query that retrieves unique colors from the table Production.Product. Order the results  in descending  manner

SELECT Color FROM Production.Product WHERE Color NOT IN ('black', 'silver', 'White')



--Write a query that retrieves the unique combination of columns ProductSubcategoryID and Color from the Production.Product table. Format and sort so the result set accordingly to the following. We do not want any rows that are NULL.in any of the two columns in the result.

SELECT ProductSubcategoryID, Color FROM Production.Product WHERE ProductSubcategoryID IS NOT NULL AND Color IS NOT NULL



--Something is “wrong” with the WHERE clause in the following query. We do not want any Red or Black products from any SubCategory than those with the value of 1 in column ProductSubCategoryID, unless they cost between 1000 and 2000.


SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice 

	FROM Production.Product
WHERE ((Color IN ('Red','Black') AND ProductSubCategoryID = 1 )  AND (ListPrice BETWEEN 1000 AND 2000)) 
OR ((Color NOT IN ('Red','Black') AND ProductSubCategoryID != 1 )  AND (ListPrice	NOT BETWEEN 1000 AND 2000)) 
ORDER BY ProductSubCategoryID ASC
 


--Write the query in the editor and execute it. Take a look at the result set and then adjust the query so it delivers the following result set.

SELECT CAST(ProductSubCategoryID AS VARCHAR) 
    + '                              ' +Name + '      ' + Color+ '      ' +CAST(ListPrice AS VARCHAR) AS 'ProductSubCategoryID            Name                                Color           ListPrice' 	FROM Production.Product
WHERE ((Color IN ('Red','Black') AND ProductSubCategoryID = 14 )  AND (ListPrice = 1431.50)) 
OR ((Color IN ('silver') AND ProductSubCategoryID = 12 )  AND (ListPrice = 1364.50)) 
OR ((Color IN ('Yellow') AND ProductSubCategoryID = 2 )  AND (ListPrice = 1700.99)) 
OR ((Color IN ('black') AND ProductSubCategoryID = 1 )  AND (ListPrice = 539.99)) 
ORDER BY CAST(ProductSubCategoryID AS int) DESC


