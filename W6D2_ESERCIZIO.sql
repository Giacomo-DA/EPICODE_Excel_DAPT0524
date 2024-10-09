SELECT *
FROM dimproduct;

SELECT ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag 
FROM dimproduct;

SELECT ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag 
FROM dimproduct
WHERE FinishedGoodsFlag = 1; 

SELECT ProductKey, ProductAlternateKey, ModelName, EnglishProductName, StandardCost, ListPrice
FROM dimproduct
WHERE ProductAlternateKey LIKE 'FR%' OR ProductAlternateKey LIKE 'BK%';

SELECT ProductKey, ProductAlternateKey, ModelName, EnglishProductName, StandardCost, ListPrice, ListPrice - StandardCost AS Markup
FROM dimproduct
WHERE ProductAlternateKey LIKE 'FR%' OR ProductAlternateKey LIKE 'BK%';

SELECT ProductKey, ListPrice
FROM dimproduct
WHERE ListPrice BETWEEN 1000 AND 2000;

SELECT *
FROM dimemployee;
dimproduct
SELECT EmployeeKey, SalesPersonFlag
FROM dimemployee
WHERE SalesPersonFlag = 1;

SELECT ProductKey, SalesOrderLineNumber, SalesOrderNumber, SalesTerritoryKey, OrderDate, SalesAmount - TotalProductCost AS Profit 
FROM factresellersales
WHERE OrderDate >= '2020-01-01' AND ProductKey IN (597, 598, 477, 214);