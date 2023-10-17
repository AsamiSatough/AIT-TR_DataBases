-- Найти мин/стоимость товаров для каждой категории
SELECT 
    CategoryID,
    MIN(Price) AS min_price
FROM Products
GROUP BY CategoryID
ORDER BY CategoryID ASC



-- Вывести названия категорий, в которых более 10 товаров
SELECT 
	CategoryID,
    COUNT(*)Prod_amount  
  FROM [Products]
GROUP BY CategoryID



-- Очистить тел/номер поставщикам из USA
UPDATE [Suppliers]
SET Phone = Null
WHERE Country = 'USA'



-- Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
SELECT 
	Employees.EmployeeID, 
    Employees.FirstName,
    Employees.LastName,
    COUNT(*) AS Total_orders 
FROM [Orders]
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Orders.EmployeeID
HAVING Total_orders < 15
ORDER BY Total_orders DESC



-- С помощью инструмента онлайн-проектирования описать схему БД "онлайн-шахматы"
Table players{
  playerID integer
  registered_from timestamp
  name string
  country string
  photo string
  email string
  password string
  isPlayingNow bool
  rank string
  winningPercentage integer
  gamesPlayed integer
  bio string
}

Table games{
  gameID integer
  started_at timestamp
  ended_at timestamp
  whitePlayerID integer
  blackPlayer2ID integer
  nextStepByPlayerID integer
  time time
  isActive bool
  totalTime time
  winnerID integer
}

Table moves{
  moveID integer
  gameID integer
  nextMoveBy integer
  currentCoordinate string
  targetCoordinate string
}

Ref: "games"."gameID" < "moves"."gameID"

Ref: "games"."whitePlayerID" < "players"."playerID"

Ref: "games"."blackPlayer2ID" < "players"."playerID"

Ref: "games"."winnerID" < "players"."playerID"

Ref: "games"."nextStepByPlayerID" < "players"."playerID"