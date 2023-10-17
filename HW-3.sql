-- Вывести ко-во поставщиков не из UK и не из China
SELECT DISTINCT
    COUNT(Country) AS TotalCountries
FROM [Suppliers]
WHERE Country NOT IN ('UK', 'China')


-- Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT
	AVG(Price),
    MAX(Price),
    MIN(Price)
FROM [Products]
WHERE CategoryID IN (3, 5)


-- Вывести общую сумму проданных товаров
SELECT 
	SUM(Products.Price * OrderDetails.Quantity)
FROM [OrderDetails]
JOIN Products ON OrderDetails.ProductID = Products.ProductID


-- Вывести данные о заказах (номер_заказа, имя_клиента, страна_клиента, фамилия_менеджера, название_компании_перевозчика)
SELECT 
	Orders.OrderID,
    Customers.CustomerName,
    Customers.Country,
    Employees.LastName,
    Shippers.ShipperName
FROM [Orders]
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID


-- Вывести сумму, на которую было отправлено товаров клиентам в Germany
SELECT 
    ROUND(SUM(Products.Price * OrderDetails.Quantity),2) AS Total_sold_DE
FROM [OrderDetails]
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Customers.Country = 'Germany'