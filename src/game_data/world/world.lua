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
	self.unit_list = {}
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

---
-- Добавить отслеживание юнита
--
-- @param[type=object] Юнит для отслеживания
function World:add_unit(unit)
	table.insert(self.unit_list, unit)
end

-- Проверка, есть ли по данным координатам юнит
--
-- @param x[type=integer] Х-координата на карте
-- @param y[type=integer] Y-координата на карте
-- @return[type=boolean] true/false есть ли в данной ячейке какой-либо юнит
function World:is_unit(x, y)
	for _, unit in ipairs(self.unit_list) do
		local unit_position = unit:get("Position")

		local unit_x, unit_y = unit_position:get()

		if unit_x == x and unit_y == y then
			return true
		end
	end

	return false
end

---
-- Получить юнит, находящийся по данным координатам
--
-- @param x[type=integer] Х-координата на карте
-- @param y[type=integer] Y-координата на карте
-- @return[type=object] Юнит
function World:get_unit(x, y)
	for _, unit in ipairs(self.unit_list) do
		local unit_position = unit:get("Position")

		local unit_x, unit_y = unit_position:get()

		if unit_x == x and unit_y == y then
			return unit
		end
	end
end

--- Получить список совсеми юнитами
--
-- @returnp[type=table] Список всех юнитов на карте
function World:get_all_units()
	return self.unit_list
end

return World
