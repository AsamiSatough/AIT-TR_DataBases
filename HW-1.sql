-- 10 операций “ВИДЕО-ХОСТИНГ”
-- 1. Регистрация пользователя - CREATE
-- 2. Авторизация - READ
-- 3. Выйти из аккаунта - UPDATE? Logged_in: false
-- 4. Поиск видео - READ
-- 5. Просмотр видео - READ
-- 6. Поставить “Like” - тип Boolean, операция CREATE с точки зрения пользователя; Integer, UPDATE для самого видео: Название: Видео_Н Просмотров: 899
-- 7. Добавить в “Избранное” - CREATE
-- 8. Оставить отзыв - CREATE
-- 9. Подписаться на канал - READ
-- 10. Включить уведомления - READ


-- В рамках БД "песочница" напишите след/запросы:
-- 2. Вывести название и стоимость товаров от 20 EUR.
SELECT ProductName, Price FROM [Products]
WHERE Price >= 20
ORDER BY Price ASC


-- 3. Вывести страны поставщиков.
SELECT DISTINCT Country FROM [Suppliers]

-- 4. В упорядоченном по стоимости виде вывести название и стоимость товаров от всех поставщиков, кроме поставщика 1.
SELECT ProductName, Price, SupplierID FROM [Products]
WHERE NOT SupplierID IN (1)
ORDER BY Price DESC

-- 5. Вывести контактные имена клиентов, кроме тех, что из France и USA.
SELECT ContactName, Country FROM [Customers]
WHERE NOT Country IN ('France', 'USA')