---
-- world.lua
--
-- Модуль соержащий в себе все данные о мире


local class = require "middleclass"

local MapData = require "game_data.world.map_data"


local World = class("World")

function World:initialize(data)
	self.map_data = MapData()
end

---
-- Получение карты для отображения
--
-- @return[type=table] таблица с данными для STI
function World:map_to_draw()
	local map = self.map_data:get_map()

	return map
end

return World
