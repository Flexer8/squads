---
-- test_map.lua
--
-- Тестовая карта для отображения. Изучение концепции


local class = require "middleclass"
local Grid = require "jumper.grid"

local CellFactory = require "game_data.world.cell.cell_factory"


local TestMap = class("TestMap")

function TestMap:initialize()
	self.map_str = [[
,..................,
,...............,,,,
,,,...........,,,,,,
,,,,,.......,,,,,,,,
....,,..........,,,,
....,,,,..,,,,,,,,,,
.....,,,......,,,,,,
.....,,,..........,,
...............,,,,,
...........,,,.,,,,,
..............,,,,,,
.................,,,
.....,,,,,,,.,,,,,,.
.....,,,,,,,....,,,,
.,,,,,....,,,.,,,,,,
]]
end

---
-- Получение готовой карты для World
--
-- @return[type=table] Объект Grid
function TestMap:get_map()
	local empty_map = self:get_empty_map()

	local map = Grid(empty_map)
	self:fill_map(map)

	return map
end

---
-- Генерация пустой структуры карты
--
-- @return[type=table] Путая карта
function TestMap:get_empty_map()
	local map_table = {}

	local map_x = #(self.map_str:match("[^\n]+"))
	local map_y = math.floor(#self.map_str / #(self.map_str:match("[^\n]+")))

	for i = 1, map_y do
		local row = {}

		for j = 1, map_x do
			table.insert(row, 0)
		end

		table.insert(map_table, row)
	end

	return map_table
end

---
-- Наполнение карты из строки с данными
-- @param[type=table] объект Grid
function TestMap:fill_map(grid)
	local rowIndex, columnIndex = 1, 1

	for row in self.map_str:gmatch("[^\n]+") do
        columnIndex = 1

        for character in row:gmatch(".") do
			local node = grid:getNodeAt(columnIndex, rowIndex)
			node.cell = CellFactory:get_cell(character)

            columnIndex = columnIndex + 1
        end
        rowIndex = rowIndex + 1
	end
end

return TestMap
