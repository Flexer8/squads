---
-- db.lua
--
-- Модуль работы с БД


local class = require "middleclass"
local sqlite3 = require "sqlite3"
local LIP = require "LIP"
local Logger = require "utils.logger"


local DB = class("DB")

function DB:initialize()
    local config = LIP.load(global_config_path)

    self.db_file = config.database.file

    self.log = Logger()
end

---
-- Select запрос к БД
--
-- @param sql запрос к БД
-- @return массив таблиц с результатами запроса
function DB:execute_select(sql)
    local db_handler = sqlite3.open(self.db_file)

    self.log:trace("Выполняется запрос к БД: " .. sql)

    local result = {}

    if db_handler then
        for item in db_handler:nrows(sql)do
            table.insert(result, item)
        end

        db_handler:close()
    else
        self.log:error("Ошибка подключения к БД!")
        error("Ошибка подключения к БД!")
    end

    return result
end

---
-- Выполнение изменяющего запроса к БД
--
-- @param sql запрос к БД
-- @return nil
function DB:execute_query(sql)
    local db_handler = sqlite3.open(self.db_file)

    self.log:trace("Выполняется запрос к БД: " .. sql)

    if db_handler then
        local res = db_handler:execute(sql)

        self.log:trace("Измененя затронули " .. tostring(res) .. "строк")

        db_handler:close()
    else
        self.log:error("Ошибка подключения к БД!")
        error("Ошибка подключения к БД!")
    end
end

return DB
