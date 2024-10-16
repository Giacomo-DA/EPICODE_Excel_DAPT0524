-- TASK 1
SHOW KEYS
FROM dimproduct
WHERE Key_name = 'PRIMARY';
-- OPPURE
SELECT ProductKey
       ,COUNT(*)
FROM dimproduct
GROUP BY ProductKey
HAVING COUNT(*) >1;

-- TASK 2
SHOW KEYS
FROM factresellersales
WHERE Key_name = 'PRIMARY';
-- OPPURE
SELECT SalesOrderLineNumber, SalesOrderNumber
       ,COUNT(*)
FROM factresellersales
GROUP BY SalesOrderLineNumber, SalesOrderNumber
HAVING COUNT(*) >1;

-- TASK 3
SELECT OrderDate
      , COUNT(DISTINCT SalesOrderNumber) AS NumTransazione
FROM factresellersales
WHERE OrderDate >= '2020-01-01'
GROUP BY OrderDate
ORDER BY OrderDate;

-- TASK 4
SELECT d.ProductKey
       , d.EnglishProductName
       , SUM(f.SalesAmount) AS FATT_TOT
       , SUM(f.OrderQuantity) AS Q_TOT
       , AVG(f.UnitPrice) AS PREZZO_MEDIO
FROM dimproduct AS d
LEFT JOIN factresellersales AS f
ON d.ProductKey = f.ProductKey
WHERE f.OrderDate >= '2020-01-01'
GROUP BY d.ProductKey, d.EnglishProductName;

-- TASK 5
SELECT C.EnglishProductCategoryName AS Categoria
	   , SUM(A.SalesAmount) AS Fatturato_TOT
       , SUM(A.OrderQuantity) AS Q_TOT
FROM factresellersales AS A
LEFT JOIN dimproduct AS B ON A.ProductKey=B.ProductKey
LEFT JOIN dimproductsubcategory AS D ON D.ProductSubcategoryKey=B.ProductSubcategoryKey
LEFT JOIN dimproductcategory AS C ON C.ProductCategoryKey=D.ProductCategoryKey
GROUP BY C.EnglishProductCategoryName
ORDER BY C.EnglishProductCategoryName;

-- TASK 6
SELECT G.City AS Città
       , SUM(F.SalesAmount) AS Fatturato_TOT
FROM factresellersales AS F
LEFT JOIN dimreseller AS R ON F.ResellerKey=R.ResellerKey
LEFT JOIN dimgeography AS G ON R.GeographyKey=G.GeographyKey
WHERE F.OrderDate >= '2020-01-01'
GROUP BY G.City
HAVING SUM(F.SalesAmount) > 60000
ORDER BY Fatturato_TOT DESC;
