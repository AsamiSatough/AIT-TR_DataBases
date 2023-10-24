-- Вывести названия двух произвольных треков с тегом new
db.tracks.aggregate([
    {$match: {tags: 'new'}},
    {$sample: {size: 2}}
])



-- Вывести имя юзера с самым минимальным балансом
db.users.aggregate([
    {$sort: {balance: 1}},
    {$limit: 1},
    {$project: {fullname: 1, _id: 0}}
])



-- Вывести имена юзеров, у которых есть треки
db.tracks.aggregate([
    {
        $lookup: {
            from: 'users',
            localField: 'author_id',
            foreignField: '_id', 
            as: 'author'
        }
    },
    {$unwind: '$author'},
    {$project: {
        _id: 0,
        title:  1,
        fullname: '$author.fullname'
    }}
])



-- Используя метод aggregate(), вывести ко-во юзеров с балансом до 1000 EUR
db.users.aggregate([
    {$match: {balance: {$lt: 1000}}},
    {$count: 'users'}
])



-- Также очень коротко опишите, как работает агрегация в MongoDB
агрегация .aggregate([{}]) позволяет обрабатывать, анализировать и нужный образом преподносить
данные, находящиеся в таблице, в то время как основные CRUD методы:
.insert
.find
.countDocuments
.update
.delete
влияют по большей части на содержание и архитектуру, хотя и предоставляют возможность вывода данных
(.find/.findOne, .countDocuments)


