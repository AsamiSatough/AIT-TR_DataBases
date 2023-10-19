-- Вывести имена юзеров не из France
db.users.find(
    {country: {$ne: 'France'}},
    {fullname: 1, _id: 0}
)


-- Добавить несколько реакций на треки
db.reactions.updateMany(
    { author_id: 1 },
    { $set: { value: 0 } }
)

-- Вывести названия треков продолжительностью от 1 до 10 мин
db.tracks.find(
    {duration_secs: {$gte: 1 * 60, $lte: 10 * 60}},
    {title: 1, _id: 0}
)

-- Вывести треки юзера 4
db.tracks.find(
    {author_id: 4}
)

-- С помощью инструмента онлайн-проектирования описать БД music (юзеры, треки, реакции, плейлисты)
https://dbdiagram.io/d/music-653173a9ffbf5169f00d5afc
