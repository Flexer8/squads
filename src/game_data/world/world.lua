---
-- world.lua
--
-- Модуль соержащий в себе все данные о мире


local class = require "middleclass"
local Grid = require "jumper.grid"

local MapData = require "game_data.world.map_data"
local CellFactory = require "game_data.world.cell.cell_factory"

local TestMap = require "game_data.world.map.test_map"


local World = class("World")

function World:initialize(data)
	self.engine = data.engine
	self.map_data = MapData()
	self.map = nil
end

---
-- Загрузка данных о карте о объектах на ней
--
-- @param[type=table] Объект с данными о карте
function World:load_world(map)
	local test_map = TestMap({owner = self})
	self.map = test_map:get_map()
end

---
-- Получение карты для отображения
--
-- @return[type=table] таблица с данными для STI
function World:map_to_draw()
	assert(self.map)

	local map = self.map_data:get_map(self.map)

	return map
end

---
-- Доступ к объекту Engine
--
-- @return[type=table] Объект Engine
function World:get_engine()
	return self.engine
end

return World
