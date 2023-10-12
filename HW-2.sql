-- В рамках БД "онлайн-магазин" напишите след/запросы:
-- Вывести название и стоимость в USD одного самого дорогого проданного товара (не используя агрегацию)
SELECT 
	Products.ProductID, 
	Products.ProductName
FROM Products
LEFT JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
ORDER BY Price DESC
LIMIT 1


-- Вывести два самых дорогих товара из категории Beverages из USA
SELECT 
	Products.ProductName,
	Products.Price,
	Categories.CategoryName,
    Suppliers.SupplierName,
    Suppliers.Country
FROM [Products]
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID 
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE 
Categories.CategoryName LIKE 'Beverages'
AND
Suppliers.Country LIKE 'USA'
ORDER BY Price DESC
LIMIT 2



-- Удалить товары с ценой менее 50 EUR
DELETE FROM [Products]
WHERE Price < 50



-- Вывести список стран, которые поставляют морепродукты
SELECT DISTINCT
	Suppliers.Country
FROM [Products]
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE CategoryName LIKE '%seafood%'



-- Очистить поле ContactName у всех клиентов не из China
UPDATE Customers
SET ContactName = null
WHERE NOT Country LIKE 'China'